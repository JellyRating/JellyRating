Feature: logout the aplication
  As a user,
  So other people can't use my account
  I want to logout the aplication

Background: users exist in the database and loged in

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |

  And I am logged in as "john@johnson.com", "123456"
  And I am on "the homepage"
Scenario: logout
  When I follow "Log out"
  Then I should see "Log in"
  And I should see "Sign up"
