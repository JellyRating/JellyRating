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
    @item = search(params[:search])
  end

  def search(s_params)
    s_params = s_params.strip if s_params
    if(s_params && !s_params.empty?)
      by_name = Item.where("title LIKE ?", "%#{s_params}%")
      by_tags = Item.tagged_with(s_params)
      by_name.union(by_tags).order(:title)
    else
      Item.all.order(:title)
    end
  end

  private
    def item_params
      params.require(:item).permit(:title, :release_date, :tag_list => []);
    end
end
