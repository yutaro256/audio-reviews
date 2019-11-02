class User < ApplicationRecord
  
  before_save { self.email.downcase! }
    
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
# imageカラムにアップローダーの機能を付与
  mount_uploader :image, ImageUploader
  
# user,itemテーブル同士の関係性
  has_many :likes
  has_many :interesting, through: :likes, source: :item
  
  def add_item(target_item)
    self.likes.find_or_create_by(item_id: target_item.id)
  end
  
  def remove_item(target_item)
    like_item = self.likes.find_by(item_id: target_item.id)
    like_item.destroy if like_item
  end
  
  def interesting?(target_item)
    self.interesting.include?(target_item)
  end
    
end
