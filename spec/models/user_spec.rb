require 'rails_helper'
require 'support/utilities.rb'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  it { is_expected.to validate_length_of(:name) }
  it { is_expected.to validate_length_of(:email) }
  it { is_expected.to validate_length_of(:password) }

  it { should validate_uniqueness_of(:email) }

  describe 'validation for email' do
    context 'when format is invalid' do
      invalid_emails.each do |invalid_email|
        it { should_not allow_value(invalid_email).for(:email) }
      end
    end

    context 'when format is valid' do
      valid_emails.each do |valid_email|
        it { should allow_value(valid_email).for(:email) }
      end
    end
  end
  
end
