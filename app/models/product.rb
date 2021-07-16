class Product < ApplicationRecord
  validates :item_name, presence: true
  validates :pieces, presence: true
  validates :price, presence: true
  validates :description, presence: true
  
  has_rich_text :description
  has_many_attached :images
end
