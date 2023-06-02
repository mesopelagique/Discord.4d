
Function setColor($color : Variant) : cs:C1710.MessageEmbed
	This:C1470.color:=resolveColor($color)
	return This:C1470
	
Function setTitle($title : Text) : cs:C1710.MessageEmbed
	This:C1470.title:=$title
	return This:C1470
	
/**
* ex: https://discord.js.org/
**/
Function setURL($url : Text) : cs:C1710.MessageEmbed
	This:C1470.url:=$url
	return This:C1470
	
/**
* ex: 'Some name', 'https:  //i.imgur.com/wSTFkRM.png', 'https://discord.js.org'
**/
Function setAuthor($author : Variant) : cs:C1710.MessageEmbed
	If (Value type:C1509($author)=Is object:K8:27)
		This:C1470.author:=$author
	Else 
		This:C1470.author:=New object:C1471("name"; String:C10($author))
	End if 
	return This:C1470
	
/**
* ex: 'Some description here'
**/
Function setDescription($description : Text) : cs:C1710.MessageEmbed
	This:C1470.description:=$description
	return This:C1470
	
/**
* ex: 'https://i.imgur.com/wSTFkRM.png'
**/
Function setThumbnail($url : Text) : cs:C1710.MessageEmbed
	This:C1470.thumbnail:=New object:C1471("url"; $url)
	return This:C1470
	
Function addFields($fields : Collection) : cs:C1710.MessageEmbed
	var $field : Object
	For each ($field; $fields)
		This:C1470.addField($field)
	End for each 
	return This:C1470
	
Function addField($field : Object) : cs:C1710.MessageEmbed
	If (This:C1470.fields=Null:C1517)
		This:C1470.fields:=New collection:C1472()
	End if 
	This:C1470.fields.push($field)
	return This:C1470
	
Function setImage($image : Text) : cs:C1710.MessageEmbed  //('https:  //i.imgur.com/wSTFkRM.png')
	This:C1470.image:=New object:C1471("url"; $image)
	return This:C1470
	
Function setFooter($footer : Object) : cs:C1710.MessageEmbed  //('Some footer text here', 'https://i.imgur.com/wSTFkRM.png');
	This:C1470.footer:=$footer
	return This:C1470
	
Function toJSON() : Text
	return JSON Stringify:C1217(This:C1470)