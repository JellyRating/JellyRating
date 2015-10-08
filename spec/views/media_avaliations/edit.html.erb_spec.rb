require 'rails_helper'

RSpec.describe "media_avaliations/edit", type: :view do
  before(:each) do
    @media_avaliation = assign(:media_avaliation, MediaAvaliation.create!(
      :media => "",
      :user => "",
      :rating => false
    ))
  end

  it "renders the edit media_avaliation form" do
    render

    assert_select "form[action=?][method=?]", media_avaliation_path(@media_avaliation), "post" do

      assert_select "input#media_avaliation_media[name=?]", "media_avaliation[media]"

      assert_select "input#media_avaliation_user[name=?]", "media_avaliation[user]"

      assert_select "input#media_avaliation_rating[name=?]", "media_avaliation[rating]"
    end
  end
end
