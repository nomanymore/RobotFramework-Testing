from selenium import webdriver
from selenium.webdriver.common.by import By 
from spellchecker import SpellChecker

# ---------------------------------------------------------------------
# THIS TEST WILL CHECK FOR ANY SPELLING MISTAKES ON A GIVEN PAGE
# ---------------------------------------------------------------------

# To run enter this in the console: python Spellchecker.py

# Define credentials and URL
username = '**ADD HERE**'
password = '**ADD HERE**'
start_url = 'bnfin-staging.curbza.com/'

# Create the URL with authentication
auth_url = f"https://{username}:{password}@{start_url}"

# Set up 
driver = webdriver.Chrome()
driver.get(auth_url)

# Find the body element and extract the text
text = driver.find_element(By.TAG_NAME, 'body').text
driver.quit()

# Spell check the extracted text
spell = SpellChecker()
misspelled = spell.unknown(text.split())
print("Misspelled words:", misspelled)
