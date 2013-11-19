module SessionsHelper
  
  def signed_in?
    !session[:user_id].nil?
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  
  
end
