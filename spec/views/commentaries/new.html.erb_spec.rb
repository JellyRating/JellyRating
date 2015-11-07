require 'rails_helper'

RSpec.describe "commentaries/new", type: :view do
  before(:each) do
    assign(:commentary, Commentary.new())
  end

  it "renders new commentary form" do
    render

    assert_select "form[action=?][method=?]", commentaries_path, "post" do
    end
  end
end
