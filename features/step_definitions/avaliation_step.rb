Given /the following item avaliation exist/ do |avaliation_table|
  avaliation_table.hashes.each do |avaliation|    
    item = Item.find_by(title: avaliation["item"])
    rating = (avaliation["rating"] == "like")
    user = User.find_by(email: avaliation["user_email"])
    Avaliation.create(rateable: item, rating: rating, user: user)
  end
end

Given /the following recommendation avaliation exist/ do |avaliation_table|
  avaliation_table.hashes.each do |avaliation|    
    item1 = Item.find_by(title: avaliation["item1"])
    item2 = Item.find_by(title: avaliation["item2"])
    recommendation = Recommendation.find_by(item1: item1, item2: item2)
    rating = (avaliation["rating"] == "like")
    user = User.find_by(email: avaliation["user_email"])
    Avaliation.create(rateable: recommendation, rating: rating, user: user)
  end
end