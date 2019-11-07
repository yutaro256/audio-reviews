module ReviewsHelper
# 詳細表示したレビューがログインユーザーが投稿したものか判定  
  def authority?
    if logged_in?
      !!current_user.reviews.find_by(id: params[:id])
    end
  end
end
