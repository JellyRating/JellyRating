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
