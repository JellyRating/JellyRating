require 'rails_helper'

RSpec.describe "commentaries/index", type: :view do
  before(:each) do
    assign(:commentaries, [
      Commentary.create!(),
      Commentary.create!()
    ])
  end

  it "renders a list of commentaries" do
    render
  end
end
