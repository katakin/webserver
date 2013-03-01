class Event
  include Mongoid::Document
  field :image, type: String
  field :title, type: String
  field :desc, type: String
  field :id, type: Integer

  validates :image, presence: true
  validates :title, presence: true
  validates :desc, presence: true
  validates :id, presence: true

  has_many :ykt_sessions
end
