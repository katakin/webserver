class Horoscope
  include Mongoid::Document
  field :sign, type: String
  field :desc, type: String
  field :den, type: Time
end
