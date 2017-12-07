class Post
  include Mongoid::Document
  field :title, type: String
  belongs_to :group
  has_many :comments
end
