Given(/^I am on the site (\w+) page$/) do |page|
  goto url_for(page)
  @current_page = page_for(page)
end


When(/^I fill the form and submit$/) do |table|
  table.hashes .each do |hsh|
    on(@current_page).subtype_options.should include hsh['subtype']
  end
end