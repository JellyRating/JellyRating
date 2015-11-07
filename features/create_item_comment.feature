Feature: create a new commentary about a item
  As a user,
  So that others users can see my opinion of the item
  I want to post a new commentary about a specific item

Background: item have been added to database
  Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |
  | When Harry Met Sally    | 21-Jul-1989  |
  | The Help                | 10-Aug-2011  |
  | Chocolat                | 5-Jan-2001   |
  | Amelie                  | 25-Apr-2001  |
  | 2001: A Space Odyssey   | 6-Apr-1968   |
  | The Incredibles         | 5-Nov-2004   |
  | Raiders of the Lost Ark | 12-Jun-1981  |
  | Chicken Run             | 21-Jun-2000  |

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |

  And I am logged in as "john@johnson.com", "123456"
  And I am on the "Aladdin" item page

Scenario: create a new commentary about this item
  When I follow "New Commentary"
  And I fill in "Comment" with "Nice movie"
  And I press "Post"
  Then I should see "John"
  And I should see "Nice movie"
