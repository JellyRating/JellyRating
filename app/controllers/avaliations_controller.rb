class AvaliationsController < ApplicationController
  before_filter :has_rateable, :only => [:index, :new, :create]
  before_filter :has_rating, :only => [:index, :create]

  def has_rateable
    @rateable = Item.find_by_id(params[:item_id])
    @rateable ||= Recommendation.find_by_id(params[:recommendation_id])
    unless @rateable
      flash[:warning] = ["rateable_id not find"]
      redirect_to ''
    end
  end

  def has_rating
    @rating = params[:rating]
    unless @rating != nil
      flash[:warning] = ["rating not true or false"]
      redirect_to ''
    end
  end

  def index; create;  end

  # GET /avaliations/new
  def new
    @avaliation = @rateable.avaliation.build
  end

 
  def create   
    avaliation = Avaliation.where(user: @current_user, rateable: @rateable)
    if avaliation.length == 0
      @current_user.avaliations << @rateable.avaliations.build({:user =>@current_user, :rating => params[:rating]})
    else
      avaliation[0].update(rating:params[:rating])
    end
    redirect_to recommendation_path(@rateable) if @rateable.is_a? Recommendation
    redirect_to item_path(@rateable) if @rateable.is_a? Item
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliation_params
      params.require(:avaliation).permit(:rateable, :user, :rating)
    end
end
