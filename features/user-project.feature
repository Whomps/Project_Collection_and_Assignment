Feature: User Project features
  
  	  Background: User is logged_in
      Given a user
      | Name         | UserAccount        |
      | Email        | ak@tamu.edu    |
      | UIN | 111111111 |
      Given an admin
      | Name         | AdminAccount        |
      | Email        | akapale@tamu.edu    |
      Given a user
      | Name         | User2Account        |
      | Email        | ak2@tamu.edu    |
      | UIN | 111111112 |
      And I am logged in as:
      | Email        | ak@tamu.edu    |
      Then I should be on UserAccount's user details page
      Given there exists a project
      |Title|ProjectA|

    
  	  Scenario: Create Project Proposal (sad path)
  	  Given I am on home_page
  	  When I click "Projects"
      When I click "Add Project Proposal"
      Then I should see "Enter Project Proposal"
      When I press "Submit"
      Then I should be on add_projects_page
      Then I should see "ERROR: Missing required parameters"
      
     Scenario: Create Project Proposal (happy path)
  	  Given I am on add_projects_page
     Then I should see "Enter Project Proposal"
     And I fill in the following project details:
      |Title|My Project Name|
      |Organization|123456789|
      |Contact|karthi1@karthik.com|
      |Semester|Fall|
      |Year|2018|
      |Description|Project desc|
      |Github link|URL|
      |Heroku link|URL|
      |Pivotal link|URL|
     When I press "Submit"
     Then I should be on myproposals_projects_page
     Then I should see "Project Added for Approval"
     Then I should see "My Project Name"
     
     Scenario: Check github/heroku/pivotal links
  	  Given I am on add_projects_page
     Then I should see "Enter Project Proposal"
     And I fill in the following project details:
      |Title|Project1234|
      |Organization|123456789|
      |Contact|karthi1@karthik.com|
      |Semester|Fall|
      |Year|2018|
      |Description|Project desc|
      |Github link|Github_URL|
      |Heroku link|Heroku_URL|
      |Pivotal link|Pivotal_URL|
     When I press "Submit"
     Then I should be on myproposals_projects_page
     Then I should see "Project Added for Approval"
     Then I should see "Project1234"
     When I click "Project1234"
     Then I should see "GitHub Link"
     And I should see "Pivotal Link"
     And I should see "Heroku Link"
     
     Scenario: Peer Evaluation (sad case)
       Given I am on home_page
       When  I click "Peer Evaluation"
       Then I should see "Failed to retrieve the peer evaluation form because the team is missing."
       
     Scenario: Peer Evaluation (happy case)
       When I am on home_page
       And I create a team
        |Name|Navi2|
       And I click "Peer Evaluation"
       #And I should see "aasas"
       And I fill the peer evaluation:
       |Score |10|
       | Comments|'Great work by him'|
       And I press "Submit"
       Then I should see "Peer evaluation results have been saved."
       And I should be on pest