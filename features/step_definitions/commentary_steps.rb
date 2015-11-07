Given /the following commentary exist/ do |commentary_table|
  commentary_table.hashes.each do |commentary|
    item01 = Item.find_by(title: commentary["item1"])
    item02 = Item.find_by(title: commentary["item2"])
    user = User.find_by(email: commentary["user_email"])
    Recommendation.create(item1: item01, item2: item02, created_by: user)
  end
end