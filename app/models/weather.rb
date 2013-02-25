class Weather
  include Mongoid::Document
  include Mongoid::Timestamps
  field :temp, type: Integer
  field :descr, type: String
  field :wind, type: Integer
  field :wind_direction, type: String
  field :barp, type: Integer
  field :hum, type: Integer
  field :created_at, type: Time
end
