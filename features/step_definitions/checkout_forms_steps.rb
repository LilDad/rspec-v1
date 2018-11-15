Given(/^I am on the site (\w+) page$/) do |page|
  goto url_for(page)
end

