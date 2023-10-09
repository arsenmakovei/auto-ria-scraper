# AutoRia Scraper 

This project aims to scrape data from the AutoRia platform regarding used cars. 
It utilizes Scrapy for web scraping and PostgreSQL for database storage. 
The program runs daily at 12:00, scrapes car details from the specified start page 
to the end, and saves the data in the database. Additionally, it performs a daily database dump 
at 00:00 and stores the dump files in the "dumps" folder next to the program.
