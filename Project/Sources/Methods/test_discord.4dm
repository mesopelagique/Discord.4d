//%attributes = {}
C_OBJECT:C1216($config;$configFolder;$bot;$gateway;$hook;$webhook;$exampleEmbed;$result)
$configFolder:=Folder:C1567(fk user preferences folder:K87:10).folder("Discord.4d")

/**
* client
**/
$config:=JSON Parse:C1218($configFolder.file("config.redmine.json").getText())
$bot:=Discord .Client.new()
$bot.login($config.token)
$gateway:=$bot.gateway(New object:C1471("bot";True:C214))

/**
* WEB HOOK
*/

$config:=JSON Parse:C1218($configFolder.file("config.json").getText())
$hook:=Discord .WebhookClient.new($config.id;$config.token)

$webhook:=$hook.webhook()
ASSERT:C1129($webhook#Null:C1517;"Cannot get webhook information. Maybe not configured")

  //$channel:=$hook.channel()
  //ASSERT($channel#Null;"Cannot get channel information. Maybe not authentified or rate limited")

  // send a simple message
$result:=$hook.send("Welcome To The Twilight Zone")

  // send a more complex message
$exampleEmbed:=Discord .MessageEmbed.new()
$exampleEmbed.setColor(16483663)\
.setTitle("Some title")\
.setURL("https://4d.com/")\
.setAuthor(New object:C1471("name";"Some name";"icon_url";"https://fr.4d.com/sites/default/files/unknown_1.png";"url";"https://4d.com/"))\
.setDescription("Some description here")\
.setThumbnail("https://fr.4d.com/sites/default/files/unknown_1.png")\
.addFields(New collection:C1472(\
New object:C1471("name";"Regular field title";"value";"Some value here");\
New object:C1471("name";"📦";"value";"📩");\
New object:C1471("name";"Inline field title";"value";"Some value here";"inline";True:C214);\
New object:C1471("name";"Inline field title";"value";"Some value here";"inline";True:C214)\
))\
.addField(New object:C1471("name";"Inline field title";"value";"Some value here";"inline";True:C214))\
.setImage("https://fr.4d.com/sites/default/files/unknown_1.png")\
.setFooter(New object:C1471("text";"Some footer text here";"url";"https://fr.4d.com/sites/default/files/unknown_1.png"))
$result:=$hook.send($exampleEmbed)

