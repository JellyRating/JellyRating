Feature: list users
  As a user,
  So that I can find more about other users
  I want to be able to filter and be redirected to user profiles by listing all of them

Background: users have been added to database
  Given the following user exist:
  | name  | email              | password  | password_confirmation |
  | John  | john@johnson.com   | 123456    | 123456                |  
  | Johna | johna@johanson.com | 123456    | 123456                |

  And the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |  

  And the following recommendation exist:
  | item1   | item2           | user_email        |
  | Aladdin | The Terminator  | john@johnson.com  |
  And I am on the "Aladdin", "The Terminator" recommendation page


Scenario: create a new commentary about this recommendation
  When I follow "New Commentary"
  And I fill in "Comment" with "I like both movies"
  And I press "Post"
  Then I should see "John"
  And I should see "I like both movies" 
