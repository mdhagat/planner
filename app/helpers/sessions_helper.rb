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
  
  def current_user?(user)
    user == current_user
  end
  
  def redirect_back_or(default, message)
    logger.info "--- in redirect_back_or ---"
    redirect_to session[:return_to] || default, :notice => message
    session.delete(:return_to)
  end

  def store_location
    logger.info "--- in store_location ---"
    # Redirecting in HTTP only works with GET
    session[:return_to] = request.url if request.get?
    logger.info "--- saving: "+session[:return_to]+" ---"
  end  
  
end
