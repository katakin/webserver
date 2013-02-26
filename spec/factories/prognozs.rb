# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prognoz do
    date "2013-02-25"
    temp_day 1
    temp_night 1
    descr_day "MyString"
    descr_night "MyString"
  end
end
