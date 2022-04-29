//! FIFO - first in first out

import 'queue.dart';

void main(List<String> args) {
  final queue = QueueList();

  queue.enqueue(2);
  queue.enqueue(1);

  print(queue);
}
