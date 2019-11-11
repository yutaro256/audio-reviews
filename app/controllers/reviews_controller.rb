class ReviewsController < ApplicationController
  
  before_action :correct_user, only: [:edit, :destroy]
  
  def index
    @reviews = Review.all.order(id: :desc).page(params[:page]).per(20)
  end

  def create
    temporary = reviews_params
    temporary[:item_id] = params[:item_id]
    @review = current_user.reviews.build(temporary)
    if @review.save
      flash[:success] = 'レビューの投稿に成功しました'
      redirect_to @review
    else
      flash.now[:danger] = 'レビューの投稿に失敗しました'
# 　  renderした時の読み込み用
      @item = Item.find(params[:item_id])
      render 'items/new_review'
    end
  end

  def show
    @review = Review.find(params[:id])
    @item = @review.item
    average_rating(@item)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(reviews_params)
      flash[:success] = 'レビューを更新しました'
      redirect_to @review
    else
      flash.now[:danger] = 'レビューを更新出来ませんでした'
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_url
  end
  
  private
  
  def reviews_params
    params.require(:review).permit(:title, :content, :rating)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
  
end
