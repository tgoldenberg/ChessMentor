require 'faker'

FactoryGirl.define do

  factory :message do |f|
    f.body {Faker::Lorem.sentence(rand(6))}
    f.sender_id 1
    f.recipient_id 2
  end
end


