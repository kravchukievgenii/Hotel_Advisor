FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "userpassword"
    password_confirmation { "userpassword" }
  end
end