Given(/^I visit the home page$/) do
  visit '/'
end

Given(/^I hit the "(.*?)" button$/) do |button_name|
  click_link button_name
end

Then(/^I should see "(.*?)"$/) do |title|
  page.should have_content(title)
end

Given(/^I fill in the form and hit submit$/) do
  fill_in("Name", with: "TomG")
  fill_in("user_password", with: "password")
  fill_in("Email", with: "example@gmail.com")
  fill_in("user_password_confirmation", with: "password")
  click_button "Sign up"
end

Then(/^I should see the home page$/) do
  page.should have_content("Hi")
  save_and_open_page
end





