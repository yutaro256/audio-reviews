class Item < ApplicationRecord
  
  validates :name_item, presence: true, length: { maximum: 255 }
  validates :maker, presence: true, length: { maximum: 30 }
  validates :price, allow_nil: true, numericality: { only_integer: true }
  
# imageカラムにアップローダーの機能を付与
  mount_uploader :image, ImageUploader
  
  has_many :reviews
  has_many :likes
  has_many :interested, through: :likes, source: :user
end
