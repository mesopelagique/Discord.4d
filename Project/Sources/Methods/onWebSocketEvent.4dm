//%attributes = {}
C_TEXT:C284($3;$5)
C_TEXT:C284($4)
C_LONGINT:C283($1;$2;$6;$7)

C_OBJECT:C1216($event)
$event:=New object:C1471(\
"server";$1;\
"client";$2;\
"context";JSON Parse:C1218($4);\
"worker";$5;\
"window";$6;\
"process";$7)

C_VARIANT:C1683($ws)
$ws:=cs:C1710.WebSocket.sockets[String:C10($event.client)]
If ($ws#Null:C1517)
	  // recreate classe from object
	If (Value type:C1509($ws)=Is text:K8:3)
		$ws:=JSON Parse:C1218($ws)
	End if 
	If (Not:C34(OB Instance of:C1731($ws;cs:C1710.WebSocket)))
		$ws:=cs:C1710.WebSocket.new($ws)
	End if 
	
	  // send message to socket
	If (OB Instance of:C1731($ws;cs:C1710.WebSocket))
		$ws.receive($event)
	Else 
		  // No sockets?
	End if 
Else 
	  // No sockets?
End if 