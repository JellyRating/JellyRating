Given /the following recommendation exist/ do |recommendation_table|
  recommendation_table.hashes.each do |recommendation|    
    item01 = Item.find_by(title: recommendation["item1"])
    item02 = Item.find_by(title: recommendation["item2"])
    user = User.find_by(email: recommendation["user_email"])
    Recommendation.create(item1: item01, item2: item02, created_by: user)
  end
end

Given /I am on the "(.*)", "(.*)" recommendation page/ do |title1, title2|
  item1 = Item.find_by(title: title1)
  item2 = Item.find_by(title: title2)
  recommendation = Recommendation.find_by(item2: item1, item1: item2)
  recommendation ||= Recommendation.find_by(item1: item1, item2: item2)
  visit recommendation_path(recommendation.id)
end