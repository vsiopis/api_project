class PostCategorySerializer < ActiveModel::Serializer
  attributes :id, :post_id, :category_id

  belongs_to :post
  belongs_to :category
end
