Feature: see the homepage
  As anyone,
  So I can see something
  I want to list things

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

  Given the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  
  | Mary  | mary@johnson.com  | 123456    | 123456                |

  And the following recommendation exist:
  | item1     | item2           | user_email        |
  | Aladdin   | The Terminator  | john@johnson.com  |
  | The Help  | Aladdin         | john@johnson.com  |

  And the following item avaliation exist:
  | item      | user_email        | rating  |
  | Aladdin   | john@johnson.com  | like    |
  | Chocolat  | john@johnson.com  | dislike |
  | Amelie    | john@johnson.com  | like    |
  | Aladdin   | mary@johnson.com  | like    |


And the following recommendation avaliation exist:
  | item1     | item2     | user_email        | rating  |
  | Aladdin   | Chocolat  | john@johnson.com  | like    |
  | Aladdin   | Chocolat  | mary@johnson.com  | like    |
  | The Help  | Aladdin   | john@johnson.com  | dislike |

  And I am on "the homepage"

Scenario: list recent items
  And I should see "Aladdin" before "Amelie"
