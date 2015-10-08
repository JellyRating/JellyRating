require 'rails_helper'

RSpec.describe "media_avaliations/index", type: :view do
  before(:each) do
    assign(:media_avaliations, [
      MediaAvaliation.create!(
        :media => "",
        :user => "",
        :rating => false
      ),
      MediaAvaliation.create!(
        :media => "",
        :user => "",
        :rating => false
      )
    ])
  end

  it "renders a list of media_avaliations" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
