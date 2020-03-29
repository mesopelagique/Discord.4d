<!-- Type here your summary -->
# Webhook

[Webhooks](https://discordapp.com/developers/docs/resources/webhook) are a low-effort way to post messages to channels in Discord.

## Get a webhook from client

```4d
$webhook:=$hook.webhook() // with $hook a Dicord.WebhookClient class

$name:=$webhook.name
```
