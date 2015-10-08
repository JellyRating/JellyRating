require "rails_helper"

RSpec.describe MediaAvaliationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/media_avaliations").to route_to("media_avaliations#index")
    end

    it "routes to #new" do
      expect(:get => "/media_avaliations/new").to route_to("media_avaliations#new")
    end

    it "routes to #show" do
      expect(:get => "/media_avaliations/1").to route_to("media_avaliations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/media_avaliations/1/edit").to route_to("media_avaliations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/media_avaliations").to route_to("media_avaliations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/media_avaliations/1").to route_to("media_avaliations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/media_avaliations/1").to route_to("media_avaliations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/media_avaliations/1").to route_to("media_avaliations#destroy", :id => "1")
    end

  end
end
