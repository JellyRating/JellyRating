require 'rails_helper'

RSpec.describe "Commentaries", type: :request do
  describe "GET /commentaries" do
    it "works! (now write some real specs)" do
      get commentaries_path
      expect(response).to have_http_status(200)
    end
  end
end
