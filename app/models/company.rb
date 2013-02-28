class Company
  include Mongoid::Document
  field :name, type: String
  field :url, type: String

  validates :name, presence: true

  has_many :ykt_sessions
end
