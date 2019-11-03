class ItemsController < ApplicationController
  def index
    @items = Item.all
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
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name_item, :maker, :price, :outline, :image)
  end
  
end
