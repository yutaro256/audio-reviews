module UsersHelper
  def correct_user?
    if logged_in?
      user = User.find(params[:id])
      current_user == user
    end
  end
end
