require 'watir'
require 'watir-scroll'

Before do
  @cucumber_host = 'https://www.thesiswritingservice.com'

  @browser = Watir::Browser.new :chrome
  @browser.driver.manage.window.maximize
end

After do
  @browser.close
end
