class Event
  include Mongoid::Document
  field :image, type: String
  field :title, type: String
  field :desc, type: String
end
