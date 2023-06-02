
/**
* Build a webhook with id and token from object.
**/
Class constructor($data : Object; $client : Object)
	var $key : Text
	For each ($key; $data)
		This:C1470[$key]:=$data[$key]
	End for each 
	If (Count parameters:C259>1)
		If (OB Instance of:C1731($client; cs:C1710.WebhookClient))
			This:C1470._client:=$client
		End if 
	End if 
	
/**
* Return an associated client
**/
Function client() : cs:C1710.WebhookClient
	If (This:C1470._client=Null:C1517)
		This:C1470._client:=cs:C1710.WebhookClient.new(This:C1470)
	End if 
	return This:C1470._client