import os
from datetime import datetime

from apscheduler.schedulers.blocking import BlockingScheduler
import subprocess
from dotenv import load_dotenv


load_dotenv()


def run_scraper():
    print("Start scraping AutoRia used cars")
    subprocess.run(["scrapy", "crawl", "used_cars"])
    print("Scraper executed successfully.")


def create_database_dump():
    print("Start creating database dump")
    os.environ["PGPASSWORD"] = os.getenv("POSTGRES_PASSWORD")
    current_date = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    dump_filename = f"dumps/dump_{current_date}.sql"
    subprocess.run(
        [
            "pg_dump",
            "-U",
            os.getenv("POSTGRES_USER"),
            "-d",
            os.getenv("POSTGRES_DB"),
            "-f",
            dump_filename,
        ]
    )
    print(
        "Database dump created successfully. "
        "Wait until the file appears in the dumps folder."
    )


if __name__ == "__main__":
    scheduler = BlockingScheduler()
    # scheduler.add_job(run_scraper, "cron", hour=12, minute=0)
    # scheduler.add_job(create_database_dump, "cron", hour=0, minute=0)
    scheduler.add_job(run_scraper, "cron", minute="*")
    scheduler.add_job(create_database_dump, "cron", minute="*")

    try:
        scheduler.start()
    except (KeyboardInterrupt, SystemExit):
        pass
