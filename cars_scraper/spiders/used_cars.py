import scrapy


class UsedCarsSpider(scrapy.Spider):
    name = "used_cars"
    allowed_domains = ["auto.ria.com"]
    start_urls = ["https://auto.ria.com/uk/car/used/"]

    def parse(self, response):
        pass
