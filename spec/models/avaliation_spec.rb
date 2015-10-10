require 'rails_helper'

RSpec.describe Avaliation, type: :model do
  subject { FactoryGirl.build(:avaliation) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:rateable) }
  it { is_expected.to validate_inclusion_of(:rating).in_array [true, false] }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to [:rateable_type, :rateable_id] }
end
