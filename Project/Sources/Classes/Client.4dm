
Class extends BaseClient

Class constructor
	Super:C1705()
	This:C1470.ws:=cs:C1710.WebSocketManager.new(This:C1470)
	
Function login
	C_TEXT:C284($0;$1)
	If (Count parameters:C259>0)
		This:C1470.token:=$1
		
		  // remove authentification header prefix if any
		This:C1470.token:=Replace string:C233(This:C1470.token;"Bot ";"")
		This:C1470.token:=Replace string:C233(This:C1470.token;"Bearer ";"")
	End if 
	
	If (Asserted:C1132(This:C1470.token#Null:C1517;"No token provided to login"))
		
		
	End if 
	
	This:C1470.ws.connect()
	
	$0:=This:C1470.token
	
	