users = [
	{:name => "Luffy", :email=> "luffy@one.piece.com", :password => "asdfasdf"},
	{:name => "Oliver Queen", :email=> "oliver@arrow.com", :password => "asdfasdf"},
	{:name => "Agumon", :email=> "agumon@digi.mon", :password => "asdfasdf"},
	{:name => "Pikachu", :email=> "pikachu@poke.mon", :password => "asdfasdf"},
	{:name => "Snake", :email=> "snake@solid.com", :password => "asdfasdf"},
	{:name => "Cloud", :email=> "cloud@ffvii.com", :password => "asdfasdf"},
]
users.each do |user|
	User.create!(user)
end

items = [
	{:title => "Harry Potter and the Philosopher's Stone", :release_date => "2001-01-01"},	
	{:title => "The Lord of the Rings: The Return of the King", :release_date => "1955-01-01"},
	{:title => "Digimon Adventure Tri Episode 1", :release_date => "2015-11-20"},
	{:title => "Tree of Savior", :release_date => "2015-01-01"},
	{:title => "Ragnarok Online", :release_date => "2002-01-01"},
	{:title => "Suicide Squad", :release_date => "2016-08-05"},
	{:title => "Batman vs Superman: Dawn of Justice", :release_date => "2016-03-24"},
	{:title => "Final Fantasy X", :release_date => "2001-07-19"},
	{:title => "Xenoblade Chronicles", :release_date => "2010-06-10"},
	{:title => "Mad Max: Fury Road", :release_date => "2015-05-22"},
	{:title => "Star Wars: The Force Awakens", :release_date => "2016-12-17"}
]

items.each do |item|
	Item.create!(item)
end