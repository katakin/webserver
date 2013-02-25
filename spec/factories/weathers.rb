# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weather do
    temp "MyString"
    descr "MyString"
    wind 1
    wind_direction "MyString"
    barp 1
    hum 1
    created_at "2013-02-25 10:25:26"
  end
end
