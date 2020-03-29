
/**
* Build a webhook with id and token from object.
**/
Class constructor
	C_OBJECT:C1216($1;$2)
	For each ($key;$1)
		This:C1470[$key]:=$1[$key]
	End for each 
	If (Count parameters:C259>1)
		If (OB Instance of:C1731($2;cs:C1710.WebhookClient))
			This:C1470._client:=$2
		End if 
	End if 
	
/**
* Return an associated client
**/
Function client
	If (This:C1470._client=Null:C1517)
		This:C1470._client:=cs:C1710.WebhookClient.new(This:C1470)
	End if 
	$0:=This:C1470._client