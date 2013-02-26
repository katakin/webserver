# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ykt_news, :class => 'YktNew' do
    date "2013-02-26"
    title "MyString"
    url "MyString"
    image "MyString"
  end
end
