Feature: Admin project functionalities
  
     Background: Admin login
      Given an admin
      | Name         | AdminAccount        |
      | Email        | akapale@tamu.edu    |
      | Password     | password            |
      Given a user
      | Name         | UserAccount        |
      | Email        | ak@tamu.edu    |
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
      |User|UserAccount|
      
    
    Scenario: Project Indexing
      Given I am on home_page
      When I click "Projects"
      And I click "All Projects"
      Then I should see "All Projects"
      And I should see "Semester"
      And I should see "Title"
      And I should see "Legacy"
      And I should see "On Campus"
      Then I click "Semester" 
      #Add code to check if it actually got sorted
      Then I click "Title"
      #Add code to check if it actually got sorted
      Then I click "ProjectA"
      
    Scenario: Project Deletion
      Given I am on home_page
      When I click "Projects"
      And I click "All Projects"
      Then I should see "All Projects"
      Then I click "ProjectA"
      Then I should see "Project Details"
      Then I should be on ProjectA's project details page
      Then I click "Delete"
      Then I should see "Project deleted"
      And I should not see "ProjectA"
    
    Scenario: Project Update
      Given I am on home_page
      When I click "Projects"
      And I click "All Projects"
      Then I should see "All Projects"
      Then I click "ProjectA"
      Then I should see "Project Details"
      Then I should be on ProjectA's project details page
      Then I click "Edit"
      Then I should see "Enter Project Proposal"
      And I should be on ProjectA's project edit page
      #Actual edit case to be added
      And I press "Submit"
      
    Scenario: Project Documentation
      Given I am on home_page
      When I click "Projects"
      And I click "All Projects"
      Then I should see "All Projects"
      Then I click "ProjectA"
      Then I should see "Project Details"
      Then I should be on ProjectA's project details page
      Then I click "View"
      Then I should see "Documentation for ProjectA"
    
    Scenario: Unapproved Project
      Given I am on home_page
      When I click "Projects"
      And I click "Unapproved Projects"
      Then I should see "Unapproved Projects"
      And I should see "Semester"
      And I should see "Title"
      And I should see "Legacy"
      And I should see "On Campus"
      And I should see "ProjectA"
      When I click "Semester"
      When I click "Title"
    
    Scenario: Unapprove project
      Given I am on home_page
      When I click "Projects"
      And I click "Unapproved Projects"
      And I should see "ProjectA"
      When I click "Approve"
      When I visit unapproved_projects_page
      Then I should not see "ProjectA"
      
      
      
    Scenario: Approve project
      Given there exists a project
      |Title|ProjectB|
      | Semester|Fall|
      | Year|2018|
      | Approved|true|
      When I visit approved_projects
      Then I should see "ProjectB"
      When I click "Unapprove"
      When I visit approved_projects
      Then I should not see "ProjectA"
      
    Scenario: Unapproved Project
      Given I am on home_page
      When I click "Projects"
      And I click "Peer Evaluation Result"
      Then I should see "Peer Evaluation Result"
      
    Scenario: Peer Evaluation (sad case)
      When I am on home_page
      And I click "Peer Evaluation Result"
      Then I should be on peer_evaluation_page
      And I should see "Peer Evaluation Result"
      And I should see "Score"
      And I should see "User Name"
      And I should see "UserAccount"
      And I click "UserAccount"
      Then I should see "Failed to retrieve the peer evaluation form because the team is missing."
    
    Scenario: Peer Evaluation (happy case)
      When I am on teams_page
      And I click "Navi"
      And I select "User2Account"
      And I press "Add user"
      And I click "Peer Evaluation Result"
      Then I should be on peer_evaluation_page
      And I should see "Peer Evaluation Result"
      And I should see "Score"
      And I should see "User Name"
      And I click "Navi"
      Then I should see "Peer Evaluation Result of Team Navi"
      And I should see "User2Account"
      When I visit peer_evaluation_page
      And I click "User2Account"
      Then I should see "Peer Evaluation"
      
    Scenario: Assign Project (Happy path)
      Given there exists a team
      |Name|MYM|
      |User|AdminAccount|
      Given there exists a project
      |Title|ProjectB|
      | Semester|Fall|
      | Year|2018|
      | Approved | true|
      Given there exists a project
      |Title|ProjectC|
      | Semester|Fall|
      | Year|2018|
      | Approved | true|
      | OnCampus|false|
      | IsLegacy|true|
      Given I am on home_page 
      When I click "Projects"
      And I click "Assign Projects"
      Then I should be on assign_projects_path
      And I should see "Assignment Details"
      And I should see "Assignment algorithm ran successfully"
      When I visit home_page
      And I click "Download Assignment"
      Then I should be on download
      #And I press "Save"
      When I am on home_page
      #check I should be able to download
      When I visit teams_page
      Then I should see "Project Assigned"
      #shoukld actually check if the column value is Yes
      
      Scenario: Assign Project (Sad path1: more teams less projects)
      Given there exists a team
      |Name|MYM|
      |User|AdminAccount|
      Given I am on home_page 
      When I click "Projects"
      And I click "Assign Projects"
      Then I should be on assign_projects_path
      And I should see "Assignment Details"
      And I should see "Cannot proceed with Assignment Algorithm, Number of Unassigned Teams more than number of Approved and available Projects"
      
      Scenario: Assign Project (Sad path2: less than 2 teams)
      Given I am on home_page 
      When I click "Projects"
      And I click "Assign Projects"
      Then I should be on assign_projects_path
      And I should see "Assignment Details"
      And I should see "Cannot proceed with Assignment Algorithm, less than 2 teams exist."
      
      
       Scenario: Reset Database
       When I am on home_page
       And I click "ResetDB"
       Then I should be on reset_database_page
       #Check for 0 users/projects/teams
       
       Scenario: Clear Assignments
      Given there exists a team
      |Name|MYM|
      |User|AdminAccount|
      Given there exists a project
      |Title|ProjectB|
      | Semester|Fall|
      | Year|2018|
      | Approved | true|
      Given there exists a project
      |Title|ProjectC|
      | Semester|Fall|
      | Year|2018|
      | Approved | true|
      | OnCampus|false|
      | IsLegacy|true|
      And I click "Assign Projects"
      When I visit home_page
      And I click "View Assignment"
      And I press "Clear All Assignments"
      Then I should be on assign_projects_path
      When I press "Add Assignment"
      Then I should see "Successfully assigned project"
      When I press "Delete Assignment"
      Then I should see "Delete successful"
      
      
      Scenario: Upload Documentation
      Given there exists a project
      |Title|ProjectB|
      | Semester|Fall|
      | Year|2018|
      | Approved | true|
      Given there exists a project
      |Title|ProjectC|
      | Semester|Fall|
      | Year|2018|
      | Approved | true|
      | OnCampus|false|
      | IsLegacy|true|
      And I click "Log Out"
      And I am logged in as:
      |Email|ak3@tamu.edu|
      When I am on home_page
      And I create a team
      |Name|NewTeam|
      When I click "Log Out"
      And I am logged in as:
      |Email|akapale@tamu.edu|
      When I am on home_page
      And I click "Assign Projects"
      And I click "Log Out"
      When I am logged in as:
      |Email|ak3@tamu.edu|
      When I visit home_page
      And I click "View Assigned Project"
      Then I should see "Project Details"
      When I click "View"
      Then I should see "Documentation for"
      When I click "Add/Upload documentation for this project"
      Then I should see "Add Project Documentation"
      When I select "Link"
      And I press "Submit"
      Then I should see "Documentation Added"
       When I click "Add/Upload documentation for this project"
       And I select "File Upload"
       And I press "Submit"
       Then I should see "Documentation Added"