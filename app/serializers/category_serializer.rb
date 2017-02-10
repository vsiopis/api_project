class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name 

  has_many :posts, through: :post_categories
end
