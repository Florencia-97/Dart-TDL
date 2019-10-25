import 'dart:async';
import 'dart:isolate';
import 'dart:io';

var global = 5;

main() async {
  var receivePort = new ReceivePort();
  await Isolate.spawn(reverseMsg, receivePort.sendPort);
  global = 6;
  print('accedo a la variable global desde Isolate Main: $global');
  
  print('Isolate Main: recibi puerto a donde mandar');

  var sendPort;
  receivePort.listen((data) {
    print('Isolate Main: recibi $data');
    
    if(data.toString() == 'SendPort')sendPort = data;
 
    if(data == ''){
      receivePort.close();
      return;
    }
    print("mensaje a enviar o enter para terminar:");
    var line = stdin.readLineSync();
    sendPort.send(line);
  });
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
    var reverse = msg.split('').reversed.join();
    print("Isolate spawn: envio $reverse");
    sendPort.send(reverse);
    if (msg == "") port.close();
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
