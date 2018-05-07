Feature: User Team functionalities
  
     Background: User login
      Given an admin
      | Name         | AdminAccount        |
      | Email        | akapale@tamu.edu    |
      | Password     | password            |
      #7 users
      Given a user
      | Name         | User1Account        |
      | Email        | ak1@tamu.edu    |
      | Password     | password            |
      | UIN          | 111111111|
      Given a user
      | Name         | User2Account        |
      | Email        | ak2@tamu.edu    |
      | Password     | password            |
      | UIN          | 111111112|
      Given a user
      | Name         | User3Account        |
      | Email        | ak3@tamu.edu    |
      | Password     | password            |
      | UIN          | 111111113|
      Given a user
      | Name         | User4Account        |
      | Email        | ak4@tamu.edu    |
      | Password     | password            |
      | UIN          | 111111114|
      Given a user
      | Name         | User5Account        |
      | Email        | ak5@tamu.edu    |
      | Password     | password            |
      | UIN          | 111111115|
      Given a user
      | Name         | User6Account        |
      | Email        | ak6@tamu.edu    |
      | Password     | password            |
      | UIN          | 111111116|
      Given a user
      | Name         | User7Account        |
      | Email        | ak7@tamu.edu    |
      | Password     | password            |
      | UIN          | 111111117|
      And I am logged in as:
      | Email        | ak1@tamu.edu    |
      Then I should be on User1Account's user details page
      And I create a team
      |Name|Navi|
      Given there exists a project
      |Title|ProjectA|
      | Semester|Fall|
      | Year|2018|

    Scenario: Add more than 6 persons to a team (user case)
    Given I am on home_page
    And I click "Log Out"
    And I am logged in as:
    |Email|akapale@tamu.edu|
    Then I visit teams_page
    Then I should see "Navi"
    And I click "Navi"
    And I select "User2Account"
    And I press "Add user"
    And I click "Navi"
    And I select "User3Account"
    And I press "Add user"
    And I click "Navi"
    And I select "User4Account"
    And I press "Add user"
    And I click "Navi"
    And I select "User5Account"
    And I press "Add user"
    And I click "Navi"
    And I select "User6Account"
    And I press "Add user"
    Then I click "Log Out"
    And I am logged in as:
    |Email|ak7@tamu.edu|
    When I visit home_page
    And I click "Join Team"
    And I select "Navi"
    And I fill the team code:
    |Code|ABCD|
    And I press "Join Team"
    Then I should see "Code is wrong"
    #And I fill the team code:
    #|Code|ABCD|
    #And I press "Join Team"
    #Then I should see "Sorry, this team has already reached the capacity of 6 members."
    #Need to know the code to do this
    
    Scenario: Remove leader from team (sad case)
    Given I am on home_page
    And I click "Log Out"
    And I am logged in as:
    |Email|akapale@tamu.edu|
    When I click "All Teams"
    Then I should be on teams_page
    Then I should see "Navi"
    When I click "Navi"
    Then I should be on Navi's team details page
    And I press "Remove"
    And I should see "Error . . .  You cannot remove the team leader!"
    
    Scenario: Leave team for a leader (admin)
    When I visit Navi's team details page
    And I click "Leave Team"
    Then I should see "Team leader cannot leave team"
    
    
    
