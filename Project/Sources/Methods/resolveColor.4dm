//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($data : Variant)->$color : Real

Case of 
	: (Value type:C1509($data)=Is text:K8:3)
		ASSERT:C1129(False:C215; "not simplemented")  // #33ccff -> must be converted to 3793392‡
		Case of 
			: ($data="RANDOM")
				//$0:=Math.floor(Math.random()*(0x00FFFFFF+1))
			: ($data="DEFAULT")
				$color:=0
			Else 
				// TODO have a map of welknown colors
				$color:=Num:C11(Replace string:C233($data; "#"; ""))  // TODO convert hexa to base 10
		End case 
		
	: (Value type:C1509($data)=Is collection:K8:32)
		$color:=($data[0] << 16)+($data[1] << 8)+$data[2]  // TODO check in 4d how to to bit operation
	: (Value type:C1509($data)=Is object:K8:27)
		$color:=($data.red[0] << 16)+($data.green[1] << 8)+$data.blue[2]  // TODO check in 4d how to to bit operation
	: (Value type:C1509($data)=Is longint:K8:6)
		$color:=$data
	: (Value type:C1509($data)=Is real:K8:4)
		$color:=$data
	Else 
		ASSERT:C1129(False:C215; "unknown color type")
End case 

If ($color<0)  // check max.? | $color>0x00FFFFFF
	ASSERT:C1129(False:C215; "Invalid color "+String:C10($color))  // throw
End if 

