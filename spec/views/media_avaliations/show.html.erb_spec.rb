require 'rails_helper'

RSpec.describe "media_avaliations/show", type: :view do
  before(:each) do
    @media_avaliation = assign(:media_avaliation, MediaAvaliation.create!(
      :media => "",
      :user => "",
      :rating => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
