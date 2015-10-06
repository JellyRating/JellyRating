class SessionsController < ApplicationController
  skip_before_filter :set_current_user

  def new    
      redirect_to user_path current_user if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back #{user.name}."
      log_in user
      params[:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to user
    else
      flash[:warning] = ['Invalid email/password combination']
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
