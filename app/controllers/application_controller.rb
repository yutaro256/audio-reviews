class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  def require_login
    unless logged_in?
      redirect_to login_url
    end
  end
  
#  def counts(item)
#    @count_reviews = item.reviews.count
#  end
  
end
