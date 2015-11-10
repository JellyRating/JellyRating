Feature: create an account
  As a user,
  So I can login
  I want to create an account

Background: I am in the sign up page
  Given I am on "the signup page"


Scenario: fill the form and submit
  When I fill in the following:
  | Name           | John              |
  | Email          | john@johnson.com  |
  | Password       | 123456            |
  | Confirmation   | 123456            |
  And I press "Create my account"
  Then I should see "John, welcome"
  And I should see "John"
  And I should see "john@johnson.com"

Scenario: don't fill the form and submit
  When I press "Create my account"
  Then I should see "Name can't be blank"
  And I should see "Email can't be blank"
  And I should see "Email is invalid"
  And I should see "Password can't be blank"
  And I should see "Password is too short (minimum is 6 characters)"