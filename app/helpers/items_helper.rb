module ItemsHelper
  def average_rating(item)
    tmp =  Review.group(:item_id).average(:rating)
    @rating = tmp[item.id]
  end
end
