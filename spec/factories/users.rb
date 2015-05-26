require 'faker'

FactoryGirl.define do

factory :user do |f|
    f.email "example@gmail.com"
    f.name "Tom G"
    f.password "password"
    f.password_confirmation "password"
    f.city "Long Beach"
    f.country "USA"
  end
end
