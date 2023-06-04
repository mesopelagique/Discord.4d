//%attributes = {}

var $client : cs:C1710.BotClient
$client:=cs:C1710.BotClient.new()
$client.connect()

var $token : Text
$token:="TMxMTM0NDE4MzM1MTgyODU4.GQn-9B.DbsVB_YnQQTuxkhUsW-"

var $message; $payload : Object

var $op : Integer
$op:=2  // https://discord.com/developers/docs/topics/opcodes-and-status-codes#gateway-gateway-opcodes

$payload:=New object:C1471("token"; $token; "properties"; New object:C1471("$os"; "windows"; "$browser"; "chrome"; "$device"; "pc"))

$message:=New object:C1471("op"; $op; \
"d"; $payload)
// if $op=0 "s" and "t" is required

$client.send($message)








//$client.disconnect()