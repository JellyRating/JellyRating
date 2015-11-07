class AvaliationsController < ApplicationController
  before_filter :has_user, :only => [:new, :create]
  before_filter :has_rateable, :only => [:new, :create]
  before_filter :has_rating, :only => [:create]
  before_action :set_avaliation, only: [:show, :edit, :update, :destroy]


  def has_user
    unless @current_user
      flash[:warning] = 'You must be logged to rate a item!'
      redirect_to '/login'
    end
  end

  def has_rateable
    @rateable = Item.find_by_id(params[:item_id])
    @rateable ||= Recommendation.find_by_id(params[:recommendation_id])
    unless @rateable
      flash[:warning] = ["rateable_id nao ta chegando"]
      redirect_to ''
    end
  end

  def has_rating
    @rating = params[:rating]
    unless @rating != nil
      flash[:warning] = ["rating nao ta chegando"]
      redirect_to ''
    end
  end
  # GET /avaliations
  # GET /avaliations.json
  def index
    @avaliations = Avaliation.all
  end

  # GET /avaliations/1
  # GET /avaliations/1.json
  def show
  end

  # GET /avaliations/new
  def new
    @avaliation = @rateable.avaliation.build
  end

  # GET /avaliations/1/edit
  def edit
  end

  # POST /avaliations
  # POST /avaliations.json
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

  # PATCH/PUT /avaliations/1
  # PATCH/PUT /avaliations/1.json
  def update
    respond_to do |format|
      if @avaliation.update(avaliation_params)
        format.html { redirect_to @avaliation, notice: 'Item avaliation was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliation }
      else
        format.html { render :edit }
        format.json { render json: @avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliations/1
  # DELETE /avaliations/1.json
  def destroy
    @avaliation.destroy
    respond_to do |format|
      format.html { redirect_to avaliations_url, notice: 'Item avaliation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliation
      @avaliation = Avaliation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliation_params
      params.require(:avaliation).permit(:rateable, :user, :rating)
    end
end
