Given /the following user exist/ do |users_table|
  users_table.hashes.each do |user|    
    User.create(user)
  end
end

And /I am logged in as "(.*)", "(.*)"$/ do |email, password|  
  visit("/login")
  fill_in("session_email", :with => email)
  fill_in("session_password", :with => password)
  click_button("Log in")
end

Given /I am on the "(.*)" user page$/ do |user_email|
  user = User.find_by(email: user_email)
  visit user_path(user.id)
end

Then /I should see "(.*)", "(.*)" recommendation$/ do |title1, title2|
  item1 = Item.find_by(title: title1)
  item2 = Item.find_by(title: title2)
  recommendation = Recommendation.find_by(item2: item1, item1: item2)
  recommendation ||= Recommendation.find_by(item1: item1, item2: item2)
  url = recommendation_path(recommendation)
  page.should have_xpath("//a[@href = '#{url}']")
end