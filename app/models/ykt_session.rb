class YktSession
  include Mongoid::Document
  include Mongoid::Timestamps
  field :date, type: Date
  field :body, type: String

  validates :date, presence: true
  validates :body, presence: true

  belongs_to :event, index: true
  belongs_to :company, index: true
end
