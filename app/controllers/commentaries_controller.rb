class CommentariesController < ApplicationController
  before_action :set_commentary, only: [:show, :edit, :update, :destroy]
  before_filter :has_user, :only => [:new, :create]
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
      flash[:warning] = @commentary.errors.full_message
      render 'new'
    end

  end

  # PATCH/PUT /commentaries/1
  # PATCH/PUT /commentaries/1.json
  def update
    respond_to do |format|
      if @commentary.update(commentary_params)
        format.html { redirect_to @commentary, notice: 'Commentary was successfully updated.' }
        format.json { render :show, status: :ok, location: @commentary }
      else
        format.html { render :edit }
        format.json { render json: @commentary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentaries/1
  # DELETE /commentaries/1.json
  def destroy
    @commentary.destroy
    respond_to do |format|
      format.html { redirect_to commentaries_url, notice: 'Commentary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentary
      @commentary = Commentary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentary_params
      params.require(:commentary).permit(:commentable, :user, :comment)
    end

    def has_user
    unless @current_user
      flash[:warning] = 'You must be logged to rate a item!'
      redirect_to '/login'
    end
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
