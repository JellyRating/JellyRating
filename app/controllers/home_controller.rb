class HomeController < ApplicationController
  def index
  	#@recent_items = Item.find(:all, :order => "created_at desc", :limit => 5).reverse
  	@recent_items = Item.order("created_at desc").take(5)
  end
end
