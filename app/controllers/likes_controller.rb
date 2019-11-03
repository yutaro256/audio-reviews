class LikesController < ApplicationController
  
  before_action :require_login
  
  def create
    item = Item.find(params[:item_id])
    current_user.add_item(item)
    flash[:success] = 'リストに追加されました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    item = Item.find(params[:item_id])
    current_user.remove_item(item)
    flash[:danger] = 'リストから削除されました'
    redirect_back(fallback_location: root_path)
  end
end
