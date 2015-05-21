Given(/^I visit the home page$/) do
  visit '/'
end

Given(/^I hit the "(.*?)" button$/) do |button_name|
  click_link button_name
end

Then(/^I should see "(.*?)"$/) do |title|
  page.should have_content(title)
end







