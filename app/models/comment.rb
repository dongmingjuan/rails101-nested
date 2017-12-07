class Comment
  include Mongoid::Document
  field :title, type: String
  belongs_to :post
end
