class ItemsController < ApplicationController
  
  before_action :require_login, only: [:new_review, :new]
  before_action :confirm_admin, only: [:edit, :destroy]
  
  def index
    if params[:search]
      @items = Item.all.order(id: :desc).page(params[:page]).per(20).where("(name_item LIKE ?) OR (maker LIKE ?)", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @items = Item.all.order(id: :desc).page(params[:page]).per(20)
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = '商品を登録しました'
      redirect_to @item
    else
      flash[:danger] = '商品の登録に失敗しました'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = '商品情報を更新しました'
      redirect_to @item
    else
      flash.now[:danger] = '商品情報を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = '商品を削除しました'
    redirect_to items_url
  end
  
# ある１つの商品に対してのレビュー作成ページ
  def new_review
    @item = Item.find(params[:id])
    @review = Review.new
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name_item, :maker, :price, :outline, :image)
  end
  
end
