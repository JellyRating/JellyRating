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

