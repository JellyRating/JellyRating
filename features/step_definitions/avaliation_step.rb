Given /the following avaliation exist/ do |avaliation_table|
  avaliation_table.hashes.each do |avaliation|    
    item = Item.find_by(title: avaliation["item"])
    rating = (avaliation["rating"] == "like")
    user = User.find_by(email: avaliation["user_email"])
    Avaliation.create(rateable: item, rating: rating, user: user)
  end
end