def save_screenshot
  time = Time.now.strftime("%d-%m-%Y %H:%M:%S")
  screenshot = "screenshots/#{time}.png"
  @browser.driver.save_screenshot(screenshot)
end

Given(/^I am on the site (\w+) page$/) do |page|
  goto url_for(page)
  @current_page = page_for(page)
end

When(/^I fill the form and submit\. Data: "([^"]*)", "([^"]*)"$/) do |data, email|
  @browser.text_field(id: 'firstname').set data
  @browser.text_field(id: 'email').set email
  @browser.text_field(id: 'topic_paper').set data
  array = %w[paper type subtype subject urgency pages]
  array.each do |arg|
    if @browser.select_list(id: arg).present?
      @browser.select_list(id: arg).wait_until(&:present?).options.to_a.sample.click
      sleep 1
    end
  end
  @browser.scroll.to([0, 300])
  @browser.file_field.set('/home/e-bezura/Documents/Form testing/9mb.docx')
  @browser.checkbox(id: 'tc_checkbox').set
  @browser.button(id: 'send_quote').click
  save_screenshot
  sleep 10
end

# Тестовая версия
#
# Рабочая версия
# array.each do |arg|
#   if @browser.select_list(id: arg).present?
#     @browser.select_list(id: arg).wait_until(&:present?).options.to_a.sample.set
#   end
# end
#
# Рабочая версия 2
# array.each do |arg|
#   if @browser.select_list(id: arg).present?
#   value = @browser.select_list(id: arg).options.to_a.sample
#   @browser.select_list(id: arg).select(value.index.to_s)
#   end
# end

# @browser.scroll.to([0, 300])
# @browser.checkbox(id: 'tc_checkbox').set
# sleep 5

# 1====
# @browser.select_list(:id, 'paper').options.to_a.sample.click
# if @browser.select_list(:id, 'subtype').present?
#   @browser.select_list(:id, 'subtype').options.to_a.sample.click
# end
# @browser.select_list(id: 'subject').options.to_a.sample.click
# @browser.select_list(id: 'urgency').options.to_a.sample.click
# @browser.select_list(id: 'pages').options.to_a.sample.click
#
# 2====
# @browser.select_list(id: 'paper').wait_until(&:present?).options.to_a.sample.click
# sleep 1
# if @browser.select_list(id: 'subtype').present?
#   @browser.select_list(id: 'subtype').wait_until(&:present?).options.to_a.sample.click
# end
# sleep 1
# @browser.select_list(id: 'subject').wait_until(&:present?).options.to_a.sample.click
# sleep 1
# @browser.select_list(id: 'urgency').wait_until(&:present?).options.to_a.sample.click
# sleep 1
# @browser.select_list(id: 'pages').wait_until(&:present?).options.to_a.sample.click
# sleep 1
# @browser.scroll.to([0, 300])
# @browser.checkbox(id: 'tc_checkbox').wait_until(&:present?).set
# =====
# Выбор значений для всех дроплистов массива
# array = %w[services type terminology urgency pages]
# array.each do |arg|
#   @browser.select_list(id: arg).wait_until_present.options.to_a.sample.click
# end
# =====
# Если дроплист будет выбирать включенные значения
# enabled_options = @browser.select_list(:class, 'preset-select').options.select(&:enabled?)
# enabled_options.sample.click
