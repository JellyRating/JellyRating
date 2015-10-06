FactoryGirl.define do
  factory :user do
    name "Naruto Uzumaki"
    email "naruto@shippuden.com"
    password ""
    password_confirmation ""
    admin true
  end
end