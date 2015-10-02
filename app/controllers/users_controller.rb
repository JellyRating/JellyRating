class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 		
  		flash[:notice] = "#{@user.name} welcome to JellyRating"
  		redirect_to user_path(@user)
  	else
  		flash[:warning] = @user.errors.full_messages
  		render 'new'
  	end
  end


  private
  	def user_params
  		params.require(:user).permit(:name, :email,
  													:password, :password_confirmation)
  	end
end