module ReviewsHelper
# 詳細表示したレビューがログインユーザーが投稿したものか判定  
  def authority?
    if current_user.reviews.find_by(id: params[:id])
      true
    else
      false
    end
  end
end
