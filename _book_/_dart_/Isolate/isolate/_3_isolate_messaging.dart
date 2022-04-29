import 'dart:isolate';

void main() {
  createIsolate();
}

Future createIsolate() async {
  
  ReceivePort myReceivePort = ReceivePort();

  Isolate.spawn<SendPort>(heavyComputationTask, myReceivePort.sendPort);

  SendPort mikeSendPort = await myReceivePort.first;

  ReceivePort mikeResponseReceivePort = ReceivePort();

  mikeSendPort.send([
    "Mike, I'm taking an Espresso coffee",
    "Espresso",
    mikeResponseReceivePort.sendPort
  ]);

  final mikeResponse = await mikeResponseReceivePort.first;
  print("MIKE'S RESPONSE: ==== $mikeResponse");
}

void heavyComputationTask(SendPort mySendPort) async {
  ReceivePort mikeReceivePort = ReceivePort();

  mySendPort.send(mikeReceivePort.sendPort);

  await for (var message in mikeReceivePort) {
    if (message is List) {
      final myMessage = message[0];
      final coffeeType = message[1];
      print(myMessage);

      final SendPort mikeResponseSendPort = message[2];

      mikeResponseSendPort
          .send("You're taking $coffeeType, and I'm taking Latte");
    }
  }
}
