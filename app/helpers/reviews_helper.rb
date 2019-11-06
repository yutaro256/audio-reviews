module ReviewsHelper
# 詳細表示したレビューがログインユーザーが投稿したものか判定  
  def authority?
    if current_user
      !!current_user.reviews.find_by(id: params[:id])
    else
      false
    end
  end
end
