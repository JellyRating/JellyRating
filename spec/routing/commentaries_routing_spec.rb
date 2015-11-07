require "rails_helper"

RSpec.describe CommentariesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/commentaries").to route_to("commentaries#index")
    end

    it "routes to #new" do
      expect(:get => "/commentaries/new").to route_to("commentaries#new")
    end

    it "routes to #show" do
      expect(:get => "/commentaries/1").to route_to("commentaries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/commentaries/1/edit").to route_to("commentaries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/commentaries").to route_to("commentaries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/commentaries/1").to route_to("commentaries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/commentaries/1").to route_to("commentaries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/commentaries/1").to route_to("commentaries#destroy", :id => "1")
    end

  end
end
