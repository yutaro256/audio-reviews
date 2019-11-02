class Item < ApplicationRecord
    has_many :likes
    has_many :interested, through: :likes, resource: :user
end
