dependent: :destroyclass Company
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :yktid, type: Integer

  validates :name, presence: true

  has_many :ykt_sessions, dependent: :destroy
end
