Given /the following item commentary exist/ do |commentary_table|
  commentary_table.hashes.each do |commentary|
	item = Item.find_by(title: commentary["item"])
    user = User.find_by(email: commentary["user_email"])
    Commentary.create(commentable: item, comment: commentary["comment"], user: user)
  end
end