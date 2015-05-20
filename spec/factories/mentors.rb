require 'faker'

FactoryGirl.define do

  factory :mentor do |f|
    f.name {Faker::Name.first_name }
    f.email {Faker::Internet.email }
    f.password "password"
    f.password_confirmation "password"
    f.city {Faker::Address.city }
    f.country {Faker::Address.country }
    f.official_ranking { Faker::Number.number(3)}
    end
end
