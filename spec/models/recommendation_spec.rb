require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  subject { FactoryGirl.build(:recommendation) }

  it { is_expected.to belong_to(:item1).class_name('Item') }
  it { is_expected.to belong_to(:item2).class_name('Item') }
  it { is_expected.to belong_to(:created_by).class_name('User') }
  it { is_expected.to have_many(:avaliations) }

  # TODO testar se media1 e media2 sao diferentes
end
