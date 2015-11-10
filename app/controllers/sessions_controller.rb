class SessionsController < ApplicationController
  skip_before_filter :set_current_user

  def new    
      redirect_to user_path current_user if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back, #{user.name}."
      log_in user
      params[:remember_me] == "1" ? remember(user) : forget(user)
      if(session[:return_to].nil?)
          redirect_to root_url
      else
          return_to = session[:return_to]
          session.delete(:return_to)
          redirect_to return_to
      end
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
