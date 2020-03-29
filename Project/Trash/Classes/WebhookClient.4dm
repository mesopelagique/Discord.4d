

Class constructor
	C_VARIANT:C1683($1;$2)
	Case of 
		: (Value type:C1509($1)=Is object:K8:27)
			This:C1470.id:=$1.id
			This:C1470.token:=$1.token
		: (Value type:C1509($1)=Is text:K8:3)
			If (Count parameters:C259>1)
				This:C1470.id:=$1
				This:C1470.token:=$2
			Else   // expect url
				This:C1470.id:=Replace string:C233($1;"https://discordapp.com/api/webhooks/";"")
				C_COLLECTION:C1488($tmpCol)
				$tmpCol:=Split string:C1554(This:C1470.id;"/")
				If ($tmpCol.length=2)
					This:C1470.id:=$tmpCol[0]
					This:C1470.token:=$tmpCol[1]
				Else 
					ASSERT:C1129(False:C215;"In valid webhook url")
				End if 
			End if 
		Else 
			ASSERT:C1129(False:C215;"Wrong webhook client parameter. Must be an object or string")
	End case 
	
Function url
	C_TEXT:C284($0)
	$0:="https://discordapp.com/api/webhooks/"+String:C10(This:C1470.id)+"/"+String:C10(This:C1470.token)
	
Function send
	C_VARIANT:C1683($1)
	C_OBJECT:C1216($0)
	C_OBJECT:C1216($body)
	
	If (Value type:C1509($1)=Is object:K8:27)
		If (OB Class:C1730($1).name="MessageEmbed")
			$body:=New object:C1471("embeds";New collection:C1472($1))
		Else 
			$body:=$1
		End if 
	Else 
		
		$body:=New object:C1471("content";String:C10($1))
		
	End if 
	
	C_OBJECT:C1216($response)
	C_LONGINT:C283($code)
	$code:=HTTP Request:C1158(HTTP POST method:K71:2;This:C1470.url();$body;$response)
	
	$0:=$response