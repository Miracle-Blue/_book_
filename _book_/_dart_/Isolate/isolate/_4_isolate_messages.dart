import 'dart:isolate';

void main(List<String> args) async {
  final receivePort = ReceivePort(); // create first receivePort
  await Isolate.spawn(isolateCommunication, [receivePort.sendPort,"message from main"]);  // sending the send port 

  SendPort mainSendPort = await receivePort.first; // receive the second send port send via second receive port

  final anotherReceivePort = ReceivePort(); // Third receive port

  mainSendPort.send([
    "this is a message from main second receive port",
    anotherReceivePort.sendPort
  ]); // send message from second send port and sending the third send port

  final messageFromIsolate = await anotherReceivePort.first;
  print(messageFromIsolate);
}

// Top level function
void isolateCommunication(List args) async {
  SendPort responsePort = args[0]; // receive the sendport from first receive port 
  
  ReceivePort isolateReceivePort = ReceivePort(); // create second receive port 

  responsePort.send(isolateReceivePort.sendPort); // send the second send port via first send port

  await for(var message in isolateReceivePort){
    print(message[0]);

    final SendPort mainResponseSendPort = message[1];

    mainResponseSendPort.send("Message received boss");
  }
}