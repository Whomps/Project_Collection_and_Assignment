Feature: Admin login functionalities
  
     Background: Admin login
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
      
      And I am logged in as:
      | Email        | akapale@tamu.edu    |
      | Password     | password            |
      Then I should be on AdminAccount's user details page
      Given there exists a project
      |Title|ProjectA|
      | Semester|Fall|
      | Year|2018|
      Given there exists a team
      |Name|Navi|
      |User|User1Account|

    Scenario: All teams view
    Given I am on home_page
    When I click "All Teams"
    Then I should be on teams_page
    And I should see "All teams"
    And I should see "Team Name"
    And I should see "No. of Students"
    And I should see "Navi"
    When I click "Team Name"
    #check if Sorted by team name
    When I click "Project Assigned"
    #check if Sorted by team assigned
    
    
    Scenario: Delete team by admin
    Given I am on home_page
    When I click "All Teams"
    Then I should be on teams_page
    And I click "Delete"
    Then I should see "Team deleted"
    And I should be on teams_page
    And I should not see "Navi"
    
    
    Scenario: Edit team by admin
    Given I am on home_page
    When I click "All Teams"
    Then I should be on teams_page
    And I should see "Navi"
    And I click "Edit"
    Then I should see "Edit Team"
    And I should be on Navi's update team page
    And I fill the team name:
    |Name|Navi2|
    And I press "Save changes"
    Then I should see "Team updated"
    And I should be on Navi2's team details page
    And I should see "Team Details"
    
    Scenario: Add person to a team
    Given I am on home_page
    When I click "All Teams"
    Then I should be on teams_page
    Then I should see "Navi"
    And I click "Navi"
    Then I should be on Navi's team details page
    And I select "User2Account"
    And I press "Add user"
    Then I should see "Successfully added user User2Account to team"
    And I should be on teams_page
    
    Scenario: Remove person from a team
    Given I am on home_page
    When I click "All Teams"
    Then I should be on teams_page
    Then I should see "Navi"
    And I click "Navi"
    And I should be on Navi's team details page
    And I select "User2Account"
    And I press "Add user"
    Then I should see "Successfully added user User2Account to team"
    And I click "Navi"
    And I press 1th "Remove"
    Then I should be on teams_page
    And I should see "Remove successful"
    
    Scenario: Delete team (admin)
    Given there exists a team
      |Name|AdminTeam|
      |User|AdminAccount|
    When I visit AdminTeam's team details page
    And I click "Delete"
    Then I should see "Team deleted"
    
    