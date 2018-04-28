Feature: Project page features
  
  	  Background: User is logged_in
  	  Given I am on signup_page
      And I fill in the following details:
       |Name|admin1|
       |UIN|123456789|
       |Email|karthi1@karthik.com|
       |Password|karthi123|
       |Confirmation|karthi123|
       |Semester|Fall|
       |Year|2016|
       |Course|CSCE606|
      When I press "Create my account"
      Then I should see "User Details"
      When I click "Home"
      Then I should see "Howdy admin1 !!"
      
      
  	  Scenario: Create Project Proposal (sad path)
  	  Given I am on home_page
  	  When I click "Projects"
      When I click "Add Project Proposal"
      Then I should see "Enter Project Proposal"
      When I press "Submit"
      Then I should be on add_projects_page
      Then I should see "ERROR: Missing required parameters"
      #Then I should see "Project Added for Approval"
      
     Scenario: Create Project Proposal (happy path)
  	  Given I am on home_page
  	  When I click "Projects"
     When I click "Add Project Proposal"
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
  	  Given I am on home_page
  	  When I click "Projects"
     When I click "Add Project Proposal"
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