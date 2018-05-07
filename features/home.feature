#@home_pagemainfeature
Feature: Homepage

	Scenario: See About Page
		Given I am on home_page
		When I click "About"
		Then I should be on about_page

	Scenario: See Contact Page
		Given I am on the contact_page
		Then I should see "walker@cse.tamu.edu"		

	Scenario: See Help Page
		Given I am on home_page
		When I click "Help"
		Then I should be on help_page

    Scenario: See Login Page
        Given I am on about_page
        When I click "Log In"
        Then I should see "Log in"
           
    Scenario: See Login Page
        Given I am on home_page
        When I click "Log In (NetID)"
        Then I should see "Log in (NetID)"

	Scenario: See Sign Up Page
		Given I am on home_page
		When I click "Sign Up"
		Then I should be on signup_page     
		
	Scenario: Github code
	  Given I am on home_page
	  Then I should see "Source code available at GitHub"