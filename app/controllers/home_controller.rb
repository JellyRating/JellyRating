class HomeController < ApplicationController
  skip_before_filter :set_current_user, only: [:index]
  def index  	
  	@recent_items = Item.recent.take(5)
  	@top_items = Item.top_rated.take(5)
  	@top_recommendations = Recommendation.top_rated.take(5)
  end
end