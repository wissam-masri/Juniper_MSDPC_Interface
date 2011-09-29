Feature: Exceptions and errors management
  
	In order to understand what went wrong
  	As a client
  	I want to be notified with corresponding errors

  	Scenario Outline: Authentification error
    		Given I am not authenticated
    		And I am on the page "home"
    		When I fill in "IP address" with "<address>"
    		And I fill in "User_name" with "<user_name>"
    		And I fill in "Password" with "<password>"
    		And I press "Submit"
    		Then I should not be authenticated
    		And I should see "home"
    		And I should see "Authentification failed"


    	Scenarios: 
      	| address       | user_name | password      |
      	| 127.0.0.1     | wissam    | admin123      |
      	| 10.194.65.201 | falsename | admin123      |
      	| 10.194.65.201 | wissam    | falsepassword |
        
	Scenario Outline: Classifying a filtered application
    		Given I am authenticated
    		And "<app>" is filtered
    		When I follow "Services"
    		And I follow "Map applications"
    		And I drag "<app>" to "<cos>"
    		Then I should see "Error. This application is filtered!"


    	Scenarios: 
      	| app | cos  |
      	| p2p | high |
