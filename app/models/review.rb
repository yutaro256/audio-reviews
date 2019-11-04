class Review < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :rating, presence: true
  validates :content, presence: true
  
  belongs_to :user
  belongs_to :item  
end
