Given(/^I visit the home page$/) do
  visit '/'
  save_and_open_page
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
end

Given(/^I am a signed up user$/) do
  @user = User.create(name: "Tom Golden",
                      email: "tommyg@gmail.com",
                      password: 'password',
                      password_confirmation: 'password'
                      )
end

Given(/^I fill in the sign in form and hit submit$/) do
  save_and_open_page
  fill_in("user_password", with: @user.password)
  fill_in("Email", with: @user.email)
  click_button "Log in"
end







