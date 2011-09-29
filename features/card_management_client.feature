Feature: Card Management scenarios
  
  	In order to easily use the services provided by the MS-DPC card
  	As a costumer
  	I want to manage the MS-DPC card through a web application

  	Scenario: Connection
    		Given I have a client account on the router
    		And I am not authenticated
    		And I fill in "IP address" with "10.194.65.201"
    		And I fill in "User name" with "my-user-name"
    		And I fill in "Password" with "my-password"
    		And I press "Submit"
    		Then the connection to "10.194.65.201" should be established
    		And I should be authenticated
    		And I should be on "services"


  	Scenario: Choosing the first service
    		Given I am authenticated
 		When I follow "Observing applications"
    		Then I should be on "service_1"


  	@javascript
  	Scenario Outline: Using the Observing applications service
    		Given I am authenticated
    		When I follow "Observing applications"
    		And I press "<link>"
    		Then I should see "Applications used in the last <number> days"


    	Scenarios: 
      	| link    | number |
      	| 7 days  | 7      |
      	|15 days  | 15     |
	|30 days  | 30     |
	
	
	Scenario Outline: Using the Observing applications service without javascript
    		Given I am authenticated                                                                  
    		When I follow "Observing applications"                     
    		And I follow "<link>"
		Then I should see "Applications used in the last <number> days"

    	
	Scenarios: 
      	| link    | number |
      	| 7 days  | 7      |
      	| 15 days | 15     |
      	| 30 days | 30     |


	Scenario: Choosing the second service
    		Given I am authenticated
    		When I follow "Applications per COS"
    		Then I should be on "service_2"


  	Scenario Outline: Using the Reading Applications on each COS service
    		Given I am authenticated
    		When I follow "Applications per COS"
    		And I press "<link>"
    		Then I should see "<result>"


    	Scenarios: 
      	| link | result         |
      	| high | important apps |
#       |low    |secondary apps |
  

	Scenario: Choosing the third service
    		Given I am authenticated
    		When I follow "Map Applications"
    		Then I should be on "service_3"


	@javascript
  	Scenario Outline: Mapping applications
    		Given I am authenticated
    		When I follow "Map Applications"
    		And I drag "<app>" to "<cos>"
    		Then "<app>" should be classified "<cos>"


    	Scenarios: 
      	| app   | cos  |
      	| video | high |
# 	|P2P    |low   |


  	Scenario Outline: Mapping application without javascript
    		Given I am authenticated
    		When I follow "Map Applications"
    		And I fill in "<app>_field" with "<cos>"
    		And I press "submit"
    		Then "<app>" should be classified "<cos>"


    	Scenarios: 
      	| app | cos  |
      	| web | high |
      	| p2p | low  |

  	Scenario: Choosing the fourth service # features/card_management_client.feature:98
    		Given I am authenticated
    		When I follow "Filter Applications"
    		Then I should be on "service_4"


  	Scenario Outline: Using the application filter
    		Given I am authenticated
    		When I follow "Filter Applications"
    		And I check "<app>"
    		And I uncheck "<app2>"
    		And I press "Submit"
    		Then "<app>" should be filtered
    		And "<app2>" should not be filtered
    		And I should be on "services"
    		And I should see "Filtering success"

    	Scenarios: 
      	| app   | app2 |
      	| video | web  |

