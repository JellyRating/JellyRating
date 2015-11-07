require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { FactoryGirl.build(:item) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:release_date) }


  it { is_expected.to validate_length_of(:title) }
  it { is_expected.to validate_length_of(:release_date) }
end
