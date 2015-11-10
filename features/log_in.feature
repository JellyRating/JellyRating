Feature: create an account
  As a user,
  So I can add and recommend items
  I want to create an login in a existing account



Background: user have been added to database 
  Given the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                | 
  Given I am on "the login page"


Scenario: fill the form and submit
  When I fill in the following:
  | Email          | john@johnson.com  |
  | Password       | 123456            |
  And I check "Remember me on this computer"
  And I press "Log in"
  Then I should see "Welcome back, John"
  And I should see "John"
  And I should see "john@johnson.com"

Scenario: invalid password
  When I fill in the following:
  | Email          | john@johnson.com  |
  | Password       | 1234567           |
  And I press "Log in"
  Then I should not see "Welcome back, John"
  And I should see "Invalid email/password combination"
