require 'rails_helper'
require 'support/utilities.rb'

RSpec.describe Media, type: :model do
  subject { FactoryGirl.build(:media) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:release_date) }


  it { is_expected.to validate_length_of(:title) }
  it { is_expected.to validate_length_of(:release_date) }

  
  
end
