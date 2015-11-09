Feature: list users
  As a user,
  So that I can find more about other users
  I want to be able to search and be redirected to user profile

Background: users have been added to database
  Given the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  
  | Mary  | mary@johnson.com  | 123456    | 123456                |

  And I am logged in as "john@johnson.com", "123456" 
  And I am on "the users page"

Scenario: search for a user and see the profile
  And I fill in "search" with "Mary"
  And I press "Find"
  And I follow "Mary"
  Then I should see "Mary"
  And I should not see "John"
  And I should see "mary@johnson.com" 
