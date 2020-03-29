//%attributes = {"invisible":true,"preemptive":"capable"}
C_VARIANT:C1683($1)
C_REAL:C285($0;$color)

Case of 
	: (Value type:C1509($1)=Is text:K8:3)
		ASSERT:C1129(False:C215;"not simplemented")  // #33ccff -> must be converted to 3793392‡
		Case of 
			: ($1="RANDOM")
				  //$0:=Math.floor(Math.random()*(0x00FFFFFF+1))
			: ($1="DEFAULT")
				$color:=0
			Else 
				  // TODO have a map of welknown colors
				$color:=Num:C11(Replace string:C233($1;"#";""))  // TODO convert hexa to base 10
		End case 
		
	: (Value type:C1509($1)=Is collection:K8:32)
		$color:=($1[0] << 16)+($1[1] << 8)+$1[2]  // TODO check in 4d how to to bit operation
	: (Value type:C1509($1)=Is object:K8:27)
		$color:=($1.red[0] << 16)+($1.green[1] << 8)+$1.blue[2]  // TODO check in 4d how to to bit operation
	: (Value type:C1509($1)=Is longint:K8:6)
		$color:=$1
	: (Value type:C1509($1)=Is real:K8:4)
		$color:=$1
	Else 
		ASSERT:C1129(False:C215;"unknown color type")
End case 

If ($color<0)  // check max.? | $color>0x00FFFFFF
	ASSERT:C1129(False:C215;"Invalid color "+String:C10($color))  // throw
End if 

$0:=$color

