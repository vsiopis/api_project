class PostSerializer < ActiveModel::Serializer
  attributes :id, :post_text

  has_many :post_categories
  has_many :categories, through: :post_categories
end
