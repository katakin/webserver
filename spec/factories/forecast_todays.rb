# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :forecast_today do
    date "2013-02-26"
    temp_day 1
    temp_night 1
    temp_evening 1
    temp_morning 1
    descr_day "MyString"
    descr_night "MyString"
    descr_evening "MyString"
    descr_morning "MyString"
  end
end
