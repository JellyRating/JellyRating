require 'rails_helper'

RSpec.describe "media_avaliations/new", type: :view do
  before(:each) do
    assign(:media_avaliation, MediaAvaliation.new(
      :media => "",
      :user => "",
      :rating => false
    ))
  end

  it "renders new media_avaliation form" do
    render

    assert_select "form[action=?][method=?]", media_avaliations_path, "post" do

      assert_select "input#media_avaliation_media[name=?]", "media_avaliation[media]"

      assert_select "input#media_avaliation_user[name=?]", "media_avaliation[user]"

      assert_select "input#media_avaliation_rating[name=?]", "media_avaliation[rating]"
    end
  end
end
