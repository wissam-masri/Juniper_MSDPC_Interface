Feature: Card Management for admins scenarios
  
  	In order to be able to access the log and help the client manage
  	As an administrator
  	I want to access the router through the application as a super user

  	Scenario: Connection                                           
    		Given I have an admin account on the router
    		And I am not admin_authenticated
    		When I check "admin"
    		And I fill in "IP address" with "10.194.65.201"
    		And I fill in "User name" with "my-user-name"
    		And I fill in "Password" with "my-password"
    		And I press "Submit"
    		Then the connection to "10.194.65.201" should be established
    		And I should be admin_authenticated
    		And I should be on "administration"


  	Scenario: Viewing the log
    		Given I am admin_authenticated
    		When I follow "Log"
    		Then I should see "log"


  	Scenario: Administrating the card
    		Given I am admin_authenticated 
		When I follow "Manage Services"
	    	Then I should see "services"
