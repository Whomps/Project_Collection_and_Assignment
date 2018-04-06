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
      Then I should see "User Details"
      When I click "Home"
      Then I should see "Howdy admin1 !!"
  	  
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
      When I click "My Team"
      Then I should see "You are not yet part of any team"
  	  When I click "Join Team"
  	  Then I should see "Join a Team"
  	  When I press "Join Team"
      Then I should see "Code is wrong"
  	  #When I click "Leave Team"
  	  #Then I should visit home_page
  	  When I click "Create Team"
  	  Then I should see "Create a Team"
  	  When I fill the team name:
  	   |Name|Karthikkkkk|
  	  Then I press "Create Team"
  	  Then I should see "Team created successfully"
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
      Then I should see "User Details"
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
      Then I should see "User Details"
      When I click "Approved Projects"
  	  Then I should see "Approved Projects"
      And I should see "Semester"
      And I should see "Title"
      And I should see "Legacy"
      And I should see "On Campus"
      When I click "Add Project Proposal"
      Then I should see "Enter Project Proposal"
      And I should see "Title"
      And I should see "Organization"
      And I should see "Contact"
      And I should see "Semester"
      And I should see "Year"
      And I should see "Description"
      And I should see "Is On-Campus?"
      And I should see "Is Legacy Project?"
      When I click "My Project Proposal"
      Then I should see "My Proposals"
      Then I should see "Created At"
      Then I should see "Proposal Title"
      Then I should see "Status"
      Then I should see "Actions"
      When I click "View Assigned Project"
      Then I should see "You still have no team"
      When I click "Create Team"
      And I fill the team name:
	   |Name|Team Assigner|
      And I press "Create Team"
      When I click "View Assigned Project"
      Then I should see "Project has not been assigned"
      When I click "Peer Evaluation"
      Then I should see "Peer Evaluation"
      And I should see "assign a total score of 10"
      And I should see "Member #1: admin4 **"
    
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
      #Then I should visit user_details
      When I click "Account"
      When I click "View Profile"
      #Then I should visit user_details
      When I click "Update Profile"
      Then I should visit admin5's update details page
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