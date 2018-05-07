Feature: Preferences related features
  
  	  Background: User is logged_in and has created a team
      Given a user
      | Name         | UserAccount        |
      | Email        | ak@tamu.edu    |
      And I am logged in as:
      | Email        | ak@tamu.edu    |
      Then I should be on UserAccount's user details page
      Given there exists a project
      |Title|ProjectA|
      When I click "Team"
      And I click "Create Team"
      And I fill the team name:
      |Name|Navi|
      And I press "Create Team"
      Then I should see "Team created successfully"
        
   
     Scenario: Fill Project Preferences
  	  Given I am on home_page
  	  When I click "Projects"
     When I click "Project Preference"
     #When I check "Positive"
     #Cant do as the tags are invisible
     Then I press "Submit Final Preferences"
     Then I should see "Preferences Saved"
     Then I should be on UserAccount's user details page
     
  	  Scenario: Fill Project Preferences (second time)
  	  When I click "Projects"
     When I click "Project Preference"
     #Then I choose('A Radio Button')
     Then I press "Submit Final Preferences"
     Then I should see "Preferences Saved"
     Then I should be on UserAccount's user details page
  	  When I click "Projects"
     When I click "Project Preference"
     Then I should see "Preferences have already been submitted"
     And I should be on UserAccount's user details page
     
     Scenario: Submit Team Peer Evaluation (Happy)
     Given: I am on home_page
     When I click "Project"
     And I click "Peer Evaluation"
     And I fill the peer evaluation:
     |Score |10|
     | Comments|'He is Awesome'|
     And I press "Submit"
     Then I should see "Peer evaluation results have been saved"
     
     Scenario: Submit Team Peer Evaluation (Sad1)
     Given: I am on home_page
     When I click "Project"
     And I click "Peer Evaluation"
     And I press "Submit"
     Then I should see "The scores should sum to"