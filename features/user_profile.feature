Feature: access the user profile 
  As a user,
  So I can know the items other user recommendations and ratings
  I want to access the profile of other user

Background: item have been added to database
  Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  
  | Mary  | mary@johnson.com  | 654321    | 654321                |
  
  And the following recommendation exist:
  | item1   | item2           | user_email        |
  | Aladdin | The Terminator  | john@johnson.com  |

  And the following avaliation exist:
  | item    | user_email        | rating  |
  | Aladdin | john@johnson.com  | like    |

  And I am logged in as "mary@johnson.com", "654321"
  And I am on the "john@johnson.com" user page


Scenario: view the other user recommendations and ratings
  Then I should see "John"
  And I should see "john@johnson.com"
  And I should see "Aladdin", "The Terminator" recommendation
  And I should see "likes Alladin"
