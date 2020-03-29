

Class constructor
	C_VARIANT:C1683($1)
	Case of 
		: (Value type:C1509($1)=Is text:K8:3)
			This:C1470.url:=$1
		: (Value type:C1509($1)=Is object:K8:27)
			This:C1470.url:=$1.url
	End case 
	If (This:C1470.url#Null:C1517)
		C_OBJECT:C1216($options)
		$options:=New object:C1471("method";"onWebSocketEvent";"url";This:C1470.url)
		If (Value type:C1509($1)=Is object:K8:27)
			copyProps ($options;$1)  // copy other parameters
		End if 
		
		copyProps (This:C1470;Websocket client ($options))  // copy to class
		This:C1470.eventListeners:=New object:C1471()
	End if 
	
	Use (cs:C1710.WebSocket)
		If (cs:C1710.WebSocket.sockets=Null:C1517)
			cs:C1710.WebSocket.sockets:=New shared object:C1526()
		End if 
		cs:C1710.WebSocket.sockets[String:C10(This:C1470.ref)]:=JSON Stringify:C1217(This:C1470)  // XXX we cannot store instance... (maybe make a global instance cache)
		
	End use 
	
Function start
	C_OBJECT:C1216($0)
	OB REMOVE:C1226(This:C1470;"eventListeners")
	$0:=Websocket client start (This:C1470)
	
Function stop
	C_OBJECT:C1216($0)
	$0:=Websocket client stop (This:C1470)
	
Function clear
	C_OBJECT:C1216($0)
	$0:=Websocket client clear (This:C1470)
	
	Use (cs:C1710.WebSocket)
		OB REMOVE:C1226(cs:C1710.WebSocket.sockets;String:C10(This:C1470.ref))
	End use 
	
Function send
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	C_BLOB:C604($data)
	Case of 
		: (Value type:C1509($1)=Is text:K8:3)
			TEXT TO BLOB:C554($1;$data)
		: (Value type:C1509($1)=Is BLOB:K8:12)
			$data:=$1
		Else 
			ASSERT:C1129(False:C215;"Wrong data type")
	End case 
	
	If ($data#Null:C1517)
		$0:=Websocket client send (This:C1470;$data)
	End if 
	
Function receive
	C_OBJECT:C1216($1)
	
	If (This:C1470.eventListeners[$1.type]#Null:C1517)
		C_VARIANT:C1683($eventListener)
		For each ($eventListener;This:C1470.eventListeners[$1.type])
			
			C_VARIANT:C1683($result)
			EXECUTE METHOD:C1007($eventListener;$result;$1;This:C1470)
			
		End for each 
	End if 
	
Function on
	C_TEXT:C284($1)
	C_VARIANT:C1683($2)  // or formula?
	
	If (This:C1470.eventListeners[$1]=Null:C1517)
		This:C1470.eventListeners[$1]:=New collection:C1472()
	End if 
	This:C1470.eventListeners[$1].push($2)
	
	  // Just recopy again in cache because we cannot store this object instance
	Use (cs:C1710.WebSocket)
		cs:C1710.WebSocket.sockets[String:C10(This:C1470.ref)]:=JSON Stringify:C1217(This:C1470)  // XXX we cannot store instance... (maybe make a global instance cache)
		
	End use 
	
/*****
	
Class functions, need an instance
	
******/
	
Function static_sockets
	C_OBJECT:C1216($0)
	If (cs:C1710.WebSocket.sockets=Null:C1517)
		$0:=New shared object:C1526
	Else 
		$0:=cs:C1710.WebSocket.sockets
	End if 
	
Function static_clearSockets
	C_OBJECT:C1216($entry)
	Use (cs:C1710.WebSocket)
		
		For each ($entry;OB Entries:C1720(This:C1470.static_sockets()))
			Websocket client clear (JSON Parse:C1218($entry.value))
			OB REMOVE:C1226(cs:C1710.WebSocket.sockets;$entry.key)
		End for each 
		
	End use 
	
Function static_startSockets
	C_TEXT:C284($ws)
	Use (cs:C1710.WebSocket)
		For each ($ws;OB Values:C1718(This:C1470.static_sockets()))
			Websocket client start (JSON Parse:C1218($ws))
		End for each 
	End use 
	
Function static_stopSockets
	C_TEXT:C284($ws)
	Use (cs:C1710.WebSocket)
		For each ($ws;OB Values:C1718(This:C1470.static_sockets()))
			Websocket client stop (JSON Parse:C1218($ws))
		End for each 
	End use 
	