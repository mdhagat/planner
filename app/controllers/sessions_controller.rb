class SessionsController < ApplicationController
  
  # the New action shows the login page
  
  # the Login action
  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_back_or root_url, "Logged in successfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  # the Logout action
  def destroy
    reset_session
    redirect_back_or root_url, "You successfully logged out"
  end  
  
end
