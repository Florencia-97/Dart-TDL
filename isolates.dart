import 'dart:async';
import 'dart:isolate';
import 'dart:io';

var global = 5;

main() async {
  var receivePort = new ReceivePort();
  await Isolate.spawn(reverseMsg, receivePort.sendPort);
  print('accedo a la variable global desde Isolate Main: $global');

  // The 'echo' isolate sends it's SendPort as the first message
  var sendPort = await receivePort.first;
  print('Isolate Main: recibi puerto a donde mandar');

  var msg;
  while(msg != "") {
    print("mensaje a enviar o enter para terminar:");
    var line = stdin.readLineSync();
    msg = await sendReceive(sendPort, line);
    print('Isolate Main: recibi $msg');
  }
}

// the entry point for the isolate
reverseMsg(SendPort sendPort) async {
  // Open the ReceivePort for incoming messages.
  var port = new ReceivePort();
  print('Isolate spawn: mande puerto que escucho');
  // Notify any other isolates what port this isolate listens to.
  sendPort.send(port.sendPort);

  print('accedo a la variable global desde Isolate spawn: $global');

  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    var reverse = data.split('').reversed.join();
    print("Isolate spawn: envio $reverse");
    replyTo.send(reverse);
    if (data == "") port.close();
  }
}

/// sends a message on a port, receives the response,
/// and returns the message
Future sendReceive(SendPort port, msg) {
  ReceivePort response = new ReceivePort();
  print('Isolate Main: envio $msg');
  port.send([msg, response.sendPort]);
  return response.first;
}
