Given(/^I am on the site (\w+) page$/) do |page|
  goto url_for(page)
  @current_page = page_for(page)
end

When(/^I fill the form and submit$/) do

  @browser.select_list(:id, 'subtype').options.to_a.sample.click

end