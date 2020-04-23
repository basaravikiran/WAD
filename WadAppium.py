from appium import webdriver
from time import sleep
class WadAppium:
    def __init__(self):
        self.desired_caps = {}

    def start_app(self, app_id):
        self.desired_caps["app"] = str(app_id)
        self.driver = webdriver.Remote(command_executor='http://127.0.0.1:4723', desired_capabilities=self.desired_caps)

    def save_screenshot(self,name):
        name= str(name)+'.png'
        self.driver.save_screenshot(name)

    def click_element_by_automation_id(self,automation_id):
        self.driver.find_element_by_accessibility_id(automation_id).click()

    def close_app(self):
        self.driver.quit()

