class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user and user.authenticate(params[:session][:password])
  		flash[:notice] = "Welcome back #{user.name}."
  		log_in user
  		redirect_to user
  	else
  		flash[:warning] = ['Invalid email/password combination']
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
