import 'dart:async';
import 'dart:isolate';
import 'dart:io';

var global = 5;

testGlobal() {
  print('accedo a la variable global en testGlobal: $global');
}

main() async {
  //puerto para recibir los mensajes
  var receivePort = new ReceivePort();
  //lanzo el isolate que va a revertir los mensajes y devolverlos
  await Isolate.spawn(reverseMsg, receivePort.sendPort);

  global = 6;
  print('accedo a la variable global desde Isolate Main: $global');
  testGlobal();
  
  print('Isolate Main: recibi puerto a donde mandar');

  var sendPort;
  receivePort.listen((data) {
    print('Isolate Main: recibi $data');
    
    if(data.toString() == 'SendPort')sendPort = data;
 
    if(data == ''){//si termina cierro el puerto
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

  global -=1;
  print('accedo a la variable global desde Isolate spawn: $global');
  testGlobal();

  await for (var msg in port) {
    var reverse = msg.split('').reversed.join();
    print("Isolate spawn: envio $reverse");
    sendPort.send(reverse);
    if (msg == "") port.close(); //para terminar cierro el puerto
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
