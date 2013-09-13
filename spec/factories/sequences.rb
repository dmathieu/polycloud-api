FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :title do |n|
    "title #{n}"
  end

  sequence :content do |n|
    "A longer content, version #{n}"
  end
end
