# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { |u| u.password }
  end
end
