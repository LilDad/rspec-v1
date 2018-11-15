require 'watir'

Before do
  @cucumber_host = 'https://www.thesiswritingservice.com'

  @browser = Watir::Browser.new :chrome
end

After do
  @browser.close
end
