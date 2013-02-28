class YktSession
  include Mongoid::Document
  field :date, type: Date
  field :body, type: String
end
