require 'rails_helper'

RSpec.describe "MediaAvaliations", type: :request do
  describe "GET /media_avaliations" do
    it "works! (now write some real specs)" do
      get media_avaliations_path
      expect(response).to have_http_status(200)
    end
  end
end
