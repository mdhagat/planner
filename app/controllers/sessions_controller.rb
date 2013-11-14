class SessionsController < ApplicationController
  
  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      logger.info '*** create - found non-nil user ***'
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in successfully"
    else
      logger.info '*** create - found nil user ***'
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end  
  
end
