
Function setColor
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	This:C1470.color:=resolveColor ($1)
	$0:=This:C1470  // chained function
	
Function setTitle
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	$0:=This:C1470  // chained function
	This:C1470.title:=$1
	
/**
* ex: https://discord.js.org/
**/
Function setURL
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	$0:=This:C1470  // chained function
	This:C1470.url:=$1
	
/**
* ex: 'Some name', 'https:  //i.imgur.com/wSTFkRM.png', 'https://discord.js.org'
**/
Function setAuthor
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=This:C1470  // chained function
	
	If (Value type:C1509($1)=Is object:K8:27)
		This:C1470.author:=$1
	Else 
		This:C1470.author:=New object:C1471("name";String:C10($1))
	End if 
	
/**
* ex: 'Some description here'
**/
Function setDescription
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	$0:=This:C1470  // chained function
	This:C1470.description:=$1
	
/**
* ex: 'https://i.imgur.com/wSTFkRM.png'
**/
Function setThumbnail
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	$0:=This:C1470  // chained function
	This:C1470.thumbnail:=New object:C1471("url";$1)
	
Function addFields
	C_OBJECT:C1216($0)
	C_COLLECTION:C1488($1)
	$0:=This:C1470  // chained function
	C_OBJECT:C1216($field)
	For each ($field;$1)
		This:C1470.addField($field)
	End for each 
	
Function addField
	C_OBJECT:C1216($0)
	C_OBJECT:C1216($1)
	$0:=This:C1470  // chained function
	
	If (This:C1470.fields=Null:C1517)
		This:C1470.fields:=New collection:C1472()
	End if 
	This:C1470.fields.push($1)
	
Function setImage  //('https:  //i.imgur.com/wSTFkRM.png')
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	$0:=This:C1470  // chained function
	This:C1470.image:=New object:C1471("url";$1)
	
Function setFooter  //('Some footer text here', 'https://i.imgur.com/wSTFkRM.png');
	C_OBJECT:C1216($0)
	C_OBJECT:C1216($1)
	$0:=This:C1470  // chained function
	This:C1470.footer:=$1
	
Function toJSON
	C_TEXT:C284($0)
	$0:=JSON Stringify:C1217(This:C1470)