import shutil
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By

options = Options()
options.add_argument("--headless=new")

service = Service(shutil.which("uc"))
driver = webdriver.Chrome(options=options,service=service)

try:
    driver.get("https://www.example.com")

    paragraphs = driver.find_elements(By.TAG_NAME, 'p')

    for p in paragraphs:
        print(p.text)
finally:
    driver.quit()
