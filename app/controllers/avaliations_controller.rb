class AvaliationsController < ApplicationController
  before_filter :has_user_and_media, :only => [:new, :create]
  before_filter :has_rating, :only => [:create]
  before_action :set_avaliation, only: [:show, :edit, :update, :destroy]


  def has_user_and_media
    unless @current_user
      flash[:warning] = 'You must be logged to rate a media!'
      redirect_to '/login'
    end
    unless @media = Media.find_by_id(params[:medium_id])
      flash[:warning] = ["medium_id nao ta chegando"]
      redirect_to '/media/list_all'
    end
  end

  def has_rating
    @rating = params[:rating]
    unless @rating != nil
      flash[:warning] = ["rating nao ta chegando"]
      redirect_to '/media/list_all'
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
    @avaliation = @media.avaliation.build
  end

  # GET /avaliations/1/edit
  def edit
  end

  # POST /avaliations
  # POST /avaliations.json
  def create   
    avaliation = Avaliation.where(user: @current_user, rateable: @media)
    if avaliation.length == 0
      @current_user.avaliations << @media.avaliations.build({:user =>@current_user, :rating => params[:rating]})
    else
      avaliation[0].update(rating:params[:rating])
    end
    redirect_to medium_path(@media)
  end

  # PATCH/PUT /avaliations/1
  # PATCH/PUT /avaliations/1.json
  def update
    respond_to do |format|
      if @avaliation.update(avaliation_params)
        format.html { redirect_to @avaliation, notice: 'Media avaliation was successfully updated.' }
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
      format.html { redirect_to avaliations_url, notice: 'Media avaliation was successfully destroyed.' }
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
      params.require(:avaliation).permit(:media, :user, :rating)
    end
end
