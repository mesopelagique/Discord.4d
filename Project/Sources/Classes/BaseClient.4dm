
Class constructor
	This:C1470.baseURL:="https://discordapp.com/api/"
	
Function gateway
	C_OBJECT:C1216($response)
	C_LONGINT:C283($code)
	C_OBJECT:C1216($0;$1)
	
	C_TEXT:C284($url)
	$url:=This:C1470.baseURL+"gateway"
	If (Bool:C1537($1.bot))
		$url:=$url+"/bot"
	End if 
	
	ARRAY TEXT:C222($headerKeys;1)
	ARRAY TEXT:C222($headerValues;1)
	$headerKeys{1}:="Authorization"
	$headerValues{1}:="Bot "+This:C1470.token
	
	$code:=HTTP Request:C1158(HTTP GET method:K71:1;$url;"";$response;$headerKeys;$headerValues)
	If ($code=200)
		$0:=cs:C1710.Gateway($response)
	Else 
		$0:=$response
	End if 