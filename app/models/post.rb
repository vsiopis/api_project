class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories
  validates :post_text, presence: true 
  validates :title, presence: true
end

