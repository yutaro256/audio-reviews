class UsersController < ApplicationController
  
  before_action :confirm_user, only: [:edit]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー情報を更新出来ませんでした'
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.interesting.order(id: :desc)
  end

  def destroy
  end
  
  def review
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(id: :desc)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
  def confirm_user
    unless correct_user?
      redirect_to root_url
    end
  end
  
end
