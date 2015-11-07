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