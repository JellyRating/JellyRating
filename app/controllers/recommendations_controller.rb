class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]
  skip_before_filter :set_current_user, only: [:index, :show]
  before_filter :item_uniqueness, only: [:create]
  before_filter :has_item, only: [:create]
  before_filter :is_admin_or_owner, only: [:destroy]

  # GET /recommendations
  # GET /recommendations.json
  def index
    @recommendations = Recommendation.all
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
    @like_count = @recommendation.avaliations.where("avaliations.rating = ?", true).size
    @dislike_count = @recommendation.avaliations.where("avaliations.rating = ?", false).size
  end

  # GET /recommendations/new
  def new
    @item = Item.all
    @recommendation = Recommendation.new
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @recommendation = Recommendation.new(item1: Item.find(params[:item1]), item2: Item.find(params[:item2]), created_by: current_user)
    if @recommendation.save
      flash[:notice] = 'New recommendation created'
      redirect_to recommendation_path @recommendation
    else
      flash[:warning] = @recommendation.errors.full_messages
      redirect_to new_recommendation_path
    end
    
  end

  def destroy
    @recommendation.destroy
    respond_to do |format|
      format.html { redirect_to recommendations_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation
      @recommendation = Recommendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommendation_params
      params.require(:recommendation).permit(:item1, :item2)
    end

    def item_uniqueness
      recommendation = Recommendation.find_by(item2_id: params[:item1], item1_id: params[:item2])
      recommendation ||= Recommendation.find_by(item1_id: params[:item1], item2_id: params[:item2])
      if (recommendation)
        flash[:warning] = ["Recommendation have already been created"]
        redirect_to recommendation_path recommendation
      end
    end

    def has_item
      flash[:warning] = ["Select a item"]
      redirect_to new_recommendation_path if params[:item1] == '' or params[:item2] == ''
    end

    def is_admin_or_owner
      redirect_to recommendation_path @recommendation unless (current_user and (current_user.admin? or current_user?(@recommendation.created_by)))
    end
end
