class HomeController < ApplicationController
  skip_before_filter :set_current_user, only: [:index]
  def index  	
  	@recent_items = Item.recent.first(5)
  	@top_items = Item.top_rated.first(5)
  	@top_recommendations = Recommendation.top_rated.first(5)
    @recent_recommendations = Recommendation.recent.first(5)
  end
end