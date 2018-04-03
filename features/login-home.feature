Feature: Login home page
  
    Scenario: Signup
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
      Then I should visit user_details
      Then I should see "User Details"
      When I click "Home"
      Then I should visit home_page
  	  
  	Scenario: Team tab, logout
  	  Given I am on signup_page
      And I fill in the following details:
       |Name|admin2|
       |UIN|123456789|
       |Email|karthi2@karthik.com|
       |Password|karthi123|
       |Confirmation|karthi123|
       |Semester|Fall|
       |Year|2016|
       |Course|CSCE606|
      When I press "Create my account"
      Then I should visit user_details
      When I click "Team"
      When I click "My Team"
  	  Then I should visit myteam page
  	  Given I am on myteam page
  	  When I click "Join Team"
  	  Then I should visit jointeam_page
  	  When I am on jointeam_page
  	  Then I should see "Join a Team"
  	  When I click "Join Team"
  	  Then I should visit myteam page
  	  #When I click "Leave Team"
  	  #Then I should visit home_page
  	  When I click "Create Team"
  	  Then I should visit createteam_page
  	  When I am on createteam_page
  	  And I fill the team name:
  	   |Name|Karthikkkkk|
  	  When I press "Create Team"
  	  Then I should visit myteam page
	  When I click "Log Out"
	  Then I should see "Welcome to the Project Submission and Assignment System"
	  
	Scenario: Create team, attempt leave team as leader, then delete team
      Given I am on signup_page
      And I fill in the following details:
       |Name|admin3|
       |UIN|123456789|
       |Email|karthi3@karthik.com|
       |Password|karthi123|
       |Confirmation|karthi123|
       |Semester|Fall|
       |Year|2016|
       |Course|CSCE606|
      When I press "Create my account"
	  When I click "Create Team"
  	  And I fill the team name:
	   |Name|Team Leavers|
	  When I press "Create Team"
	  Then I should see "Team created successfully"
	  And I should see "Team Details"
	  And I should see "Team Leavers"
	  When I click "Leave Team"
	  Then I should see "Team leader cannot leave team"
	  When I click "Delete"
	  Then I should see "You are not yet part of any team"
	  And I should see "User Details"
	  
  	Scenario: Project tab
  	  Given I am on signup_page
      And I fill in the following details:
       |Name|admin4|
       |UIN|123456789|
       |Email|karthi4@karthik.com|
       |Password|karthi123|
       |Confirmation|karthi123|
       |Semester|Fall|
       |Year|2016|
       |Course|CSCE606|
      When I press "Create my account"
      Then I should visit user_details
      When I click "Project"
      When I click "Approved Projects"
  	  Then I should visit approved_projects
      When I click "Add Project Proposal"
      Then I should visit addproposal page
      When I click "My Project Proposal"
      Then I should visit myproposal page
      When I click "View Assigned Project"
      Then I should visit assignedpro page
      When I click "Peer Evaluation"
    
  	Scenario: Account tab
  	  Given I am on signup_page
      And I fill in the following details:
       |Name|admin5|
       |UIN|123456789|
       |Email|karthi5@karthik.com|
       |Password|karthi123|
       |Confirmation|karthi123|
       |Semester|Fall|
       |Year|2016|
       |Course|CSCE606|
      When I press "Create my account"
      Then I should visit user_details
      When I click "Account"
      When I click "View Profile"
      Then I should visit user_details
      When I click "Update Profile"
      Then I should visit update_details
      And I fill the updated details:
       |Name|karthi5a|
       |Email|karthi5a@karthik.com|
       |UIN|123123123| 
       |Password|karth123|
       |Confirmation|karth123|
      When I press "Save changes"
      Then I should visit user_details page
      When I click "Log Out"
      Then I should visit home_page
      
    Scenario: LoginNN
      Given I am on login_page
      And I fill in the details:
       |Email|master@example.com|
       |Password|adminadmin|
      When I press "Log In"
      Then I should visit user_details
   
  Scenario: Test
      Given I am on projects
      Then I should see "Help"
    
  Scenario: Sign up
      Given I am on login_page
      And I click "Sign up now!"
      Then I should visit the signup page
  
  Scenario: Forgot Password
    Given I am on login_page
    When I click "forgot password"
    Then I should visit forgot_password_page
    
  Scenario: Password Reset
    Given I am on forgot_password_page
    And I fill the mail id:
    |Email|master@example.com|
    When I press "Submit"
    Then I should visit password_reset_page
   
 Scenario: Remember me
   Given I am on login_page