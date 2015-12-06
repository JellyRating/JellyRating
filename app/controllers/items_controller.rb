class ItemsController < ApplicationController
  skip_before_filter :set_current_user, only: [:index, :show, :list_all]
  def index

  end

  def new
    @item = Item.new
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save       
      flash[:notice] = "#{@item.title} successfully added!"
      redirect_to item_path(@item)
    else
      flash[:warning] = @item.errors.full_messages
      @tags = ActsAsTaggableOn::Tag.all
      render 'new'
    end
  end

  def show
    id = params[:id]
    @item = Item.find(id)
  end

  def list_all
    @item = Item.all
  end    

  private
    def item_params
      params.require(:item).permit(:title, :release_date, :tag_list => []);
    end
end
