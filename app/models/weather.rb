class Weather
  include Mongoid::Document
  
  field :temp, type: String
  field :descr, type: String
  field :wind, type: Integer
  field :wind_direction, type: String
  field :barp, type: Integer
  field :hum, type: Integer
  field :created_at, type: Time
end
