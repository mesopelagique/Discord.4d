//%attributes = {}

C_OBJECT:C1216($ws;$status;$options)
$options:=New object:C1471("url";"ws://demos.kaazing.com/echo")
$ws:=Discord .WebSocket.new($options)
  //$ws.on("ping";"test_websocket_callback")

$ws.static_stopSockets()
$ws.static_clearSockets()

$status:=$ws.start()

$status:=$ws.stop()

  // TODO wait message before exit, semaphore? await

/*While (Not(Test semaphore("WaitPing")))
IDLE
End while */