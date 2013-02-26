class ForecastToday
  include Mongoid::Document
  field :date, type: Date
  field :temp_day, type: Integer
  field :temp_night, type: Integer
  field :temp_evening, type: Integer
  field :temp_morning, type: Integer
  field :descr_day, type: String
  field :descr_night, type: String
  field :descr_evening, type: String
  field :descr_morning, type: String

  index({ date: 1 }, { unique: true, background: true })

  validates :date, uniqueness: true, presence: true
  validates :temp_day, presence: true
  validates :temp_night, presence: true
  validates :descr_day, presence: true
  validates :descr_night, presence: true
  validates :temp_evening, presence: true
  validates :temp_morning, presence: true
  validates :descr_evening, presence: true
  validates :descr_morning, presence: true
end
