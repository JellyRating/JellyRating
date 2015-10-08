class MediaAvaliationsController < ApplicationController
  before_filter :has_user_and_media, :only => [:new :create]
  before_action :set_media_avaliation, only: [:show, :edit, :update, :destroy]


  def has_user_and_media
    unless @current_user
      flash[:warning] = "You must be logged to rate a media!"
      redirect_to '/login'
    end
  # GET /media_avaliations
  # GET /media_avaliations.json
  def index
    @media_avaliations = MediaAvaliation.all
  end

  # GET /media_avaliations/1
  # GET /media_avaliations/1.json
  def show
  end

  # GET /media_avaliations/new
  def new
    @media_avaliation = MediaAvaliation.new
  end

  # GET /media_avaliations/1/edit
  def edit
  end

  # POST /media_avaliations
  # POST /media_avaliations.json
  def create
    @media_avaliation = MediaAvaliation.new(media_avaliation_params)

    respond_to do |format|
      if @media_avaliation.save
        format.html { redirect_to @media_avaliation, notice: 'Media avaliation was successfully created.' }
        format.json { render :show, status: :created, location: @media_avaliation }
      else
        format.html { render :new }
        format.json { render json: @media_avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_avaliations/1
  # PATCH/PUT /media_avaliations/1.json
  def update
    respond_to do |format|
      if @media_avaliation.update(media_avaliation_params)
        format.html { redirect_to @media_avaliation, notice: 'Media avaliation was successfully updated.' }
        format.json { render :show, status: :ok, location: @media_avaliation }
      else
        format.html { render :edit }
        format.json { render json: @media_avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_avaliations/1
  # DELETE /media_avaliations/1.json
  def destroy
    @media_avaliation.destroy
    respond_to do |format|
      format.html { redirect_to media_avaliations_url, notice: 'Media avaliation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_avaliation
      @media_avaliation = MediaAvaliation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_avaliation_params
      params.require(:media_avaliation).permit(:media, :user, :rating)
    end
end
