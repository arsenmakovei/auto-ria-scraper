import datetime
import re

import scrapy
from scrapy.http import Response
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By

from cars_scraper.items import UsedCarItem


class UsedCarsSpider(scrapy.Spider):
    name = "used_cars"
    allowed_domains = ["auto.ria.com"]
    start_urls = ["https://auto.ria.com/uk/car/used/"]

    def __init__(self, *args, **kwargs):
        super(UsedCarsSpider, self).__init__(*args, **kwargs)
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--no-sandbox")
        self.driver = webdriver.Chrome(options=chrome_options)

    def parse(self, response: Response, **kwargs):
        for car in response.css("div.content"):
            car_url = car.css("a.address::attr(href)").get()

            yield response.follow(url=car_url, callback=self.parse_car_page)

        # To parse data from all pages, not just one, uncomment the following code block.
        # next_page = response.css("a.js-next::attr(href)").get()
        #
        # if next_page is not None:
        #     yield response.follow(next_page, callback=self.parse)

    def parse_car_page(self, response: Response):
        username = response.css("h4.seller_info_name a::text").get()

        if username is None:
            username = response.css("div.seller_info_name::text").get()

        self.driver.get(response.url)

        element = self.driver.find_element(By.XPATH, "//*[@id='phonesBlock']/div/span")

        if element:
            self.driver.execute_script("arguments[0].click();", element)
            phone_elements = self.driver.find_elements(
                By.CSS_SELECTOR, ".popup-successful-call-desk"
            )
            phone_numbers = [element.text for element in phone_elements]
        else:
            phone_numbers = None

        car_item = UsedCarItem(
            url=response.css("link[rel=canonical]::attr(href)").get(),
            title=response.css("h1.head::attr(title)").get(),
            price_usd=int(
                response.css("div.price_value strong::text")
                .get()
                .replace(" ", "")
                .replace("$", "")
            ),
            odometer=int(response.css("div.base-information span::text").get()) * 1000,
            username=username,
            phone_number=", ".join(phone_numbers),
            image_url=response.css("div.photo-620x465 img::attr(src)").get(),
            images_count=int(
                re.search(
                    r"\d+", response.css("span.count span.mhide::text").get()
                ).group()
            ),
            car_number=response.css("span.state-num::text").get(),
            car_vin=response.css("span.label-vin::text").get(),
            datetime_found=datetime.datetime.now(),
        )

        yield car_item
