class UsersController < ApplicationController
  skip_before_filter :set_current_user, only: [:new, :create]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @users = search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save     
      log_in @user
      flash[:notice] = "#{@user.name}, welcome to JellyRating"
      redirect_to user_path @user
    else
      flash[:warning] = @user.errors.full_messages
      render 'new'
    end
  end

  def followers
    @user = User.find_by_id(params[:user_id])
    
  end

  def following
    @user = User.find_by_id(params[:user_id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.name} deleted"
    redirect_to root_path
  end

  def search(s_params)
    if(s_params)
      User.where("name LIKE ?", "%#{s_params}%")
    else
      User.all
    end
  end  

  helper_method :follows?
  def follows? (user_id)
    @follower = User.find_by_id @current_user
    @followed = User.find_by_id user_id
    @relationship = Relationship.where(follower: @follower, followed: @followed)
    if @relationship.length==0    
      return -1
    else return @relationship[0].id
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email,
                            :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless (current_user?(@user) or current_user.admin?)
    end
end