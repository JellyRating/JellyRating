class CommentariesController < ApplicationController
  before_filter :has_commentable, :only => [:new, :create]
  # GET /commentaries/new
  def new
    @commentary = Commentary.new
    @path = item_commentaries_path(@commentable) if @commentable.is_a? Item
    @path = recommendation_commentaries_path(@commentable) if @commentable.is_a? Recommendation
  end

  # POST /commentaries
  # POST /commentaries.json
  def create
    @commentary = Commentary.new(user: @current_user, commentable: @commentable, comment: params[:commentary][:comment])
    if @commentary.save
      flash[:notice] = "You post a commentary"
      redirect_to recommendation_path(@commentable) if @commentable.is_a? Recommendation
      redirect_to item_path(@commentable) if @commentable.is_a? Item
    else
      flash[:warning] = @commentary.errors.full_messages
      render 'new'
    end

  end

  def destroy
    
  end

  private    

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentary_params
      params.require(:commentary).permit(:commentable, :user, :comment)
    end

  def has_commentable
    @commentable = Item.find_by_id(params[:item_id])
    @commentable ||= Recommendation.find_by_id(params[:recommendation_id])
    unless @commentable
      flash[:warning] = ["It's not a commentable object", params[:item_id]]
      redirect_to ''
    end
  end
end
