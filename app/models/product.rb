class Product < ApplicationRecord
  enum status: { draft: 0, published: 1, archived: 2 }

  has_one_attached :cover_image
  has_many_attached :images
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :description, length: { minimum: 4 }
  validates :stock, :numericality => { :greater_than_or_equal_to => 0 }
end
