class ItemsController < ApplicationController
  skip_before_filter :set_current_user, only: [:index, :show, :list_all]
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save       
      flash[:notice] = "#{@item.title} successfully added!"
      redirect_to item_path(@item)
    else
      flash[:warning] = @item.errors.full_messages
      render 'new'
    end
  end

  def show
    id = params[:id]
    @item = Item.find(id)
    @like_count = @item.avaliations.where("avaliations.rating = ?", true).size
    @dislike_count = @item.avaliations.where("avaliations.rating = ?", false).size
  end

  def list_all
    @item = Item.all
  end    

  private
    def item_params
      params.require(:item).permit(:title, :release_date);
    end
end
