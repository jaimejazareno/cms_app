class SessionsController < ApplicationController
	
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = 'Welcome' 
      cookies[:username]= user.username
      redirect_to user
    else
      flash[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
  	sign_out
    redirect_to root_url
  end

end
