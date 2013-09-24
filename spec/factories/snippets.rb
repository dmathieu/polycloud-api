# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :snippet do
    address { Address.where(ip: '0.0.0.0').first || FactoryGirl.create(:address) }
    user
    content
  end
end
