
property client : 4D:C1709.WebSocket

Class constructor
	This:C1470.open:=False:C215
	
Function connect()
	This:C1470.disconnect()
	
	This:C1470.client:=4D:C1709.WebSocket.new("wss://gateway.discord.gg/?v=6&encording=json"; This:C1470)
	// https://www.youtube.com/watch?v=dR9n1zmw-Go
	// https://github.com/DiasBVAP/Franky-DiscordBot/blob/ced71760909b0851179ce44987a38669d30bf786/logger.py#L30
	
	// 
	// https://www.youtube.com/watch?v=dR9n1zmw-Go
	// https://github.com/DiasBVAP/Franky-DiscordBot/blob/ced71760909b0851179ce44987a38669d30bf786/logger.py#L30
	
	/// Function called when the server starts
Function onOpen($wss : Object; $param : Object)
	This:C1470.open:=True:C214
	
Function onTerminate
	This:C1470.open:=False:C215
	
Function send($object : Object)
	This:C1470.lastSend:=This:C1470.client.send(JSON Stringify:C1217($object))
	
	
	
Function onMessage($wss : Object; $object : Object) : Object
	
	
Function onError($wss : Object; $param : Object)
	
Function disconnect()
	If (This:C1470.client#Null:C1517)
		This:C1470.client.terminate()
		This:C1470.client:=Null:C1517
	End if 