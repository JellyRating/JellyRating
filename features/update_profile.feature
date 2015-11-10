Feature: update the user profile 
  As a user,
  So others users can see the right information
  I want to update the my profile

Background: user has been added to database

  Given the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |

  And I am logged in as "john@johnson.com", "123456"
  And I am on the "john@johnson.com" user page

Scenario: edit my profile
  When I follow "Edit your profile" 
  And I fill in the following:
  | Name           | Jonny              |
  | Email          | jonny@johnson.com  |
  | Password       | 123456             |
  | Confirmation   | 123456             |
  And I press "Save changes" 
  Then I should see "Jonny"
  And I should see "jonny@johnson.com"

Scenario: edit my profile with error
  When I follow "Edit your profile" 
  And I fill in the following:
  | Name           |                    |
  | Email          | jonny@johnson.com  |
  | Password       | 123456             |
  | Confirmation   | 123456             |
  And I press "Save changes" 
  Then I should see "Update your profile"
