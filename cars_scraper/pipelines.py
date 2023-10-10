# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter


import psycopg2
from scrapy.exceptions import NotConfigured


class PostgresPipeline:
    def __init__(self, postgres_settings):
        self.postgres_settings = postgres_settings

    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.get("POSTGRES_SETTINGS"):
            raise NotConfigured("POSTGRES_SETTINGS not set or empty")
        return cls(postgres_settings=crawler.settings.get("POSTGRES_SETTINGS"))

    def open_spider(self, spider):
        self.connection = psycopg2.connect(
            dbname=self.postgres_settings["db_name"],
            user=self.postgres_settings["user"],
            password=self.postgres_settings["password"],
            host=self.postgres_settings["host"],
        )
        self.curr = self.connection.cursor()

        self.curr.execute(
            """
            CREATE TABLE IF NOT EXISTS used_cars (
                id SERIAL PRIMARY KEY,
                url VARCHAR(255),
                title VARCHAR(255),
                price_usd INTEGER,
                odometer INTEGER,
                username VARCHAR(255),
                phone_number VARCHAR(255),
                image_url VARCHAR(255),
                images_count INTEGER,
                car_number VARCHAR(255),
                car_vin VARCHAR(255),
                datetime_found TIMESTAMP
            )
            """
        )
        self.connection.commit()

    def close_spider(self, spider):
        self.curr.close()
        self.connection.close()

    def process_item(self, item, spider):
        self.curr.execute("SELECT * FROM used_cars WHERE url = %s", (item["url"],))
        existing_item = self.curr.fetchone()

        if existing_item:
            existing_item_dict = {
                "url": existing_item[0],
                "title": existing_item[1],
                "price_usd": existing_item[2],
                "odometer": existing_item[3],
                "username": existing_item[4],
                "phone_number": existing_item[5],
                "image_url": existing_item[6],
                "images_count": existing_item[7],
                "car_number": existing_item[8],
                "car_vin": existing_item[9],
                "datetime_found": existing_item[10],
            }

            if (
                existing_item_dict["title"] == item["title"]
                and existing_item_dict["price_usd"] == item["price_usd"]
                and existing_item_dict["odometer"] == item["odometer"]
                and existing_item_dict["username"] == item["username"]
                and existing_item_dict["phone_number"] == item["phone_number"]
                and existing_item_dict["image_url"] == item["image_url"]
                and existing_item_dict["images_count"] == item["images_count"]
                and existing_item_dict["car_number"] == item["car_number"]
                and existing_item_dict["car_vin"] == item["car_vin"]
                and existing_item_dict["datetime_found"] == item["datetime_found"]
            ):
                return item
            else:
                self.curr.execute(
                    """
                    UPDATE used_cars SET title=%s, price_usd=%s, odometer=%s, username=%s, phone_number=%s,
                    image_url=%s, images_count=%s, car_number=%s, car_vin=%s, datetime_found=%s WHERE url=%s
                    """,
                    (
                        item["title"],
                        item["price_usd"],
                        item["odometer"],
                        item["username"],
                        item["phone_number"],
                        item["image_url"],
                        item["images_count"],
                        item["car_number"],
                        item["car_vin"],
                        item["datetime_found"],
                        item["url"],
                    ),
                )
        else:
            self.curr.execute(
                """
                INSERT INTO used_cars (url, title, price_usd, odometer, username, phone_number, image_url, 
                images_count, car_number, car_vin, datetime_found) 
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                (
                    item["url"],
                    item["title"],
                    item["price_usd"],
                    item["odometer"],
                    item["username"],
                    item["phone_number"],
                    item["image_url"],
                    item["images_count"],
                    item["car_number"],
                    item["car_vin"],
                    item["datetime_found"],
                ),
            )
        self.connection.commit()

        return item
