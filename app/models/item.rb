class Item < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :maker, presence: true, length: { maximum: 30 }
  validates :price, numericality: { only_integer: true }
  
# imageカラムにアップローダーの機能を付与
  mount_uploader :image, ImageUploader
  
  has_many :likes
  has_many :interested, through: :likes, resource: :user
end
