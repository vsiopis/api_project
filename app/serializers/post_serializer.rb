class PostSerializer < ActiveModel::Serializer
  attributes :id, :post_text, :created_at

  has_many :post_categories
  has_many :categories, through: :post_categories
end
