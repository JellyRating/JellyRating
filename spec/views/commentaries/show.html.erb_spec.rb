require 'rails_helper'

RSpec.describe "commentaries/show", type: :view do
  before(:each) do
    @commentary = assign(:commentary, Commentary.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
