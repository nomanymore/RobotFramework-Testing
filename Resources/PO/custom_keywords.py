from robot.libraries.BuiltIn import BuiltIn

def click_first_visible_element(*locators):
    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    for locator in locators:
        print(f"Checking visibility for locator: {locator}")
        try:
            if selenium_lib.wait_until_element_is_visible(locator, timeout='10s'):  # Increased timeout
                selenium_lib.click_element(locator)
                print(f"Clicked on locator: {locator}")
                return
        except Exception as e:
            print(f"Failed to find or click {locator}: {str(e)}")
    raise Exception("None of the locators were visible or clickable.")
