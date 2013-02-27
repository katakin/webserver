class Event
  include Mongoid::Document
  field :image, type: String
  field :title, type: String
  field :desc, type: String

  validates :image, presence: true
  validates :title, presence: true
  validates :desc, presence: true

  has_many :sessions
end
