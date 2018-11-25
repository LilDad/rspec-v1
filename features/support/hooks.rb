require 'watir'
require 'watir-scroll'

def save_screenshot screenshot_name
  screenshot = "screenshots/#{screenshot_name}.png"
  @browser.driver.save_screenshot(screenshot)
end

Before do
  @cucumber_host = 'https://www.thesiswritingservice.com'

  @browser = Watir::Browser.new :chrome
  @browser.driver.manage.window.maximize
end

After do
  @browser.close
end
