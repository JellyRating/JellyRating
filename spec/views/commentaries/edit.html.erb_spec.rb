require 'rails_helper'

RSpec.describe "commentaries/edit", type: :view do
  before(:each) do
    @commentary = assign(:commentary, Commentary.create!())
  end

  it "renders the edit commentary form" do
    render

    assert_select "form[action=?][method=?]", commentary_path(@commentary), "post" do
    end
  end
end
