# AutoRia Scraper 

This project aims to scrape data from the AutoRia platform regarding used cars. 
It utilizes Scrapy for web scraping and PostgreSQL for database storage. 
The program runs daily at 12:00, scrapes car details from the specified start page 
to the end, and saves the data in the database. Additionally, it performs a daily database dump 
at 00:00 and stores the dump files in the "dumps" folder next to the program.

## Installation

1. **Clone the Repository**: Clone this repository to your local machine.
2. **Install Dependencies**: Ensure you have Python installed. Install the required dependencies using the following commands:

    ```shell
    git clone https://github.com/arsenmakovei/auto-ria-scraper.git
    cd auto-ria-scraper
    python -m venv venv
    Windows: venv\Scripts\activate
    Linux, Unix: source venv/bin/activate
    pip install -r requirements.txt
    ```
3. Set up the PostgreSQL database, and configure the .env file with your PostgreSQL credentials and other environment variables:

   ```shell
   POSTGRES_DB=your_database_name
   POSTGRES_USER=your_database_user
   POSTGRES_PASSWORD=your_database_password
   POSTGRES_HOST=your_database_host
   ```

## Usage

1. Running the Scraper

To run the scraper manually, execute the following command:

   ```shell
   scrapy crawl used_cars
   ```
This command will start the scraper, which will visit the AutoRia website, 
scrape used car data, and store it in the PostgreSQL database.

2. Scheduling the Scraper

The scraper can be scheduled to run automatically at specific intervals using 
the scheduler.py script. By default, the scraper is scheduled to run every day at 12:00 PM, 
and a database dump is created every day at 12:00 AM. You can modify the scheduling settings in the scheduler.py file.

To start the scheduler, run:

   ```shell
   python scheduler.py
   ```

The scheduler will run in the background and execute the scraper and database dump tasks based on the specified schedule.
