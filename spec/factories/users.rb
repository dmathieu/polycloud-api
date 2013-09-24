# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    address { Address.where(ip: '0.0.0.0').first || FactoryGirl.create(:address) }
    email
    password 'password'
  end
end
