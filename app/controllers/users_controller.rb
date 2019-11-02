class UsersController < ApplicationController
  
  before_action require_login, only: [:edit, :show, :destroy, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザーを登録しました#{@user.image}"
      redirect_to @user
    else
      flash[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
end
