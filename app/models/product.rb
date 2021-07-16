class Product < ApplicationRecord
  validates :item_name, presence: true
  validates :pieces, presence: true
  validates :price, presence: true

  has_rich_text :description
end
