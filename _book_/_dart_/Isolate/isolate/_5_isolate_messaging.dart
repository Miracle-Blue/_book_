import 'dart:isolate';

void main(List<String> args) async {
  final receivePort = ReceivePort();
  SendPort? sendPort;

  var isolate = await Isolate.spawn(getData, receivePort.sendPort);

  receivePort.listen((message) {
    if (message is SendPort) {
      sendPort = message;
      sendMessage(sendPort!);
    } else if (message is String && message == "end") {
      sendPort!.send('end');
      isolate.kill();
      receivePort.close();
    } else {
      print(message);
    }
  });
}

void sendMessage(SendPort sendPort) {
  sendPort.send('hello - 1');
  sendPort.send('hello - 2');
}

void getData(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  sendPort.send("data - 1");
  sendPort.send("data - 2");
  sendPort.send("data - 3");

  sendPort.send('end');

  receivePort.listen((message) {
    if (message is String && message == "end") {
      receivePort.close();
    } else {
      print(message);
    }
  });
}
