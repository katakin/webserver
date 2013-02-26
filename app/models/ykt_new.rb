class YktNew
  include Mongoid::Document
  field :date, type: Date
  field :title, type: String
  field :url, type: String
  field :image, type: String
end
