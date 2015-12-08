Feature: follow another user
	As a user,
	So I can know what other users activities,
	I want to follow a user

Background:
	Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |
  | Chocolat                | 5-Jan-2001   |

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  
  | Mary  | mary@johnson.com  | 654321    | 654321                |
  
  And the following recommendation exist:
  | item1   | item2           | user_email        |
  | Aladdin | The Terminator  | john@johnson.com  |
  | Aladdin | Chocolat        | mary@johnson.com  |

  And the following item avaliation exist:
  | item    | user_email        | rating  |
  | Aladdin | john@johnson.com  | like    |

  And the following recommendation avaliation exist:
  | item1   | item2           | user_email        | rating  |
  | Aladdin | Chocolat        | john@johnson.com  | dislike |

  And the following item commentary exist:
  | item    | comment     | user_email        |
  | Aladdin | Nice movie  | john@johnson.com  |

  And I am logged in as "mary@johnson.com", "654321"
  And I am on the "john@johnson.com" user page

  Scenario: view other followed users list
  When I follow "Follow" 
  And I follow "Home"
  And I follow "Following"
  Then I should see "John"

  Scenario: view other followed users activities in my timeline
  When I follow "Follow" 
  And I follow "Home"
  Then I should see "John created a recommendation"
  And I should see "John commented a movie"


