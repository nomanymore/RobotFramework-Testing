from selenium import webdriver
from selenium.webdriver.common.by import By
import os

# ------------------------------------------------------------------------------------
# THIS TEST WILL CHECK FOR ALT ATTRIBUTES ON IMAGES FOR ACCESSIBILITY ON A GIVEN PAGE
# ------------------------------------------------------------------------------------


# To run enter this in the console: python AccessibilityChecker.py

# Define credentials and URL
username = '**ADD HERE**'
password = '**ADD HERE**'
start_url = 'bnfin-staging.curbza.com/'

# Set the url you want to check, with the authentication
auth_url = f"https://{username}:{password}@{start_url}about-info"


driver = webdriver.Chrome()
driver.get(auth_url)

# Find all image elements on the page
images = driver.find_elements(By.TAG_NAME, 'img')

# Store images without alt text in a list
images_without_alt = []

# Check each image for an alt attribute
for image in images:
    alt_text = image.get_attribute('alt')
    if alt_text is None or alt_text.strip() == '':
        images_without_alt.append(image.get_attribute('src'))


# Ensure directory exists
output_file_path = os.path.join(os.path.dirname(__file__), '..', 'Results', 'accessibility_check_results.txt')
output_file_path = os.path.normpath(output_file_path)
os.makedirs(os.path.dirname(output_file_path), exist_ok=True)

# Save results in a text file in Results folder
with open(output_file_path, 'w') as file:
    if images_without_alt:
        file.write("Images without 'alt' text:\n")
        for img_src in images_without_alt:
            file.write(f"{img_src}\n")
    else:
        file.write("All images have 'alt' text.\n")

driver.quit()