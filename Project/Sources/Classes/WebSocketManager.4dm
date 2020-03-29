
Class constructor
	C_OBJECT:C1216($1)
	This:C1470.client:=$1
	
Function connect
	C_OBJECT:C1216($gateway;$0)
	$gateway:=This:C1470.client.gateway()
	If (OB Instance of:C1731($gateway;cs:C1710.Gateway))
		This:C1470.websocket:=This:C1470.client.gateway().websocket()
		  // $0:=This.websocket.start()
	Else 
		$0:=$gateway  // ie. errors
	End if 