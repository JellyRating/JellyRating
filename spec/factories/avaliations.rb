FactoryGirl.define do
  factory :avaliation do
    rateable {FactoryGirl.build(:recommendation)}
    user {FactoryGirl.build(:user)}
    rating false
  end
end
