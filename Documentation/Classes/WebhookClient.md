<!-- Type here your summary -->
# WebhookClient

[Webhooks](https://discordapp.com/developers/docs/resources/webhook) are a low-effort way to post messages to channels in Discord.

A Webhook provide an url which contains id and token.

```
https://discordapp.com/api/webhooks/<id>/<token>
```

## Create a client

### Using the url

```4d
$hook:=Discord .WebhookClient.new("https://discordapp.com/api/webhooks/<id>/<token>")
```

### Using the id and token

```4d
$hook:=Discord .WebhookClient.new("<id>";"<token>")
```

or

```4d
$config:=New object("id"; "<id>"; "token"; "<token>") // Could be read from configuration file
$hook:=Discord .WebhookClient.new(config)
```

## Send a message

```4d
$hook.send("Hello World")
```

or an embed message

```4d
$exampleEmbed:=Discord .MessageEmbed.new()
$exampleEmbed.setColor(16483663)\
.setTitle("Some title")\
.setURL("https://4d.com/")\
.addField(New object("name";"my field";"value";"Some value here"))

$result:=$hook.send($exampleEmbed)
```

For more fancy stuff see [MessageEmbed](MessageEmbed.md)
