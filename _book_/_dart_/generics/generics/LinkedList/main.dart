import 'linked_list.dart';

void main(List<String> args) {
  // - Push
  final listPush = LinkedList<int>();

  listPush.push(3);
  listPush.push(2);
  listPush.push(1);

  print(listPush);

  // - Append
  final listAppend = LinkedList<int>();

  listAppend.append(3);
  listAppend.append(2);
  listAppend.append(1);

  print(listAppend);

  // - Insert At
  final listInsertAt = LinkedList<int>();

  listInsertAt.push(3);
  listInsertAt.push(2);
  listInsertAt.push(1);

  print("\nBefore: $listInsertAt");

  listInsertAt.insertAfter(listInsertAt.nodeAt(0)!, 88);

  print("After: $listInsertAt");

  // - Pop
  final listPop = LinkedList<int>();

  listPop.push(3);
  listPop.push(2);
  listPop.push(1);

  print("\nBefore: $listPop");

  final popedValue = listPop.pop();

  print("After: $listPop");
  print("Poped value: $popedValue");

  // Remove Last
  final listRemuveLast = LinkedList<int>();

  listRemuveLast.push(3);
  listRemuveLast.push(2);
  listRemuveLast.push(1);

  print("\nBefore: $listRemuveLast");

  final removedValue = listRemuveLast.removeLast();

  print("After: $listRemuveLast");
  print("Removed value: $removedValue");

  // Removing Middle
  final listMiddleRemove = LinkedList<int>();

  listMiddleRemove.push(3);
  listMiddleRemove.push(2);
  listMiddleRemove.push(1);

  print("\nBefore: $listMiddleRemove");

  final firstNode = listMiddleRemove.nodeAt(0);
  final middleRemovedValue = listRemuveLast.removeAfter(firstNode!);

  print("After: $listMiddleRemove");
  print("Removed value: $middleRemovedValue");

  // Iterator
  final listIterator = LinkedList<int>();

  listIterator.push(3);
  listIterator.push(2);
  listIterator.push(1);

  print("\n");
  for (final element in listIterator) {
    print(element);
  }

  // Printing Reverse
  final firstChallange = LinkedList<int>();

  firstChallange.push(3);
  firstChallange.push(2);
  firstChallange.push(1);

  print("\nList: $firstChallange");
  print("Reversed list: ${firstChallange.reverse}");

  // Middle Node
  final middleOfList = LinkedList<int>();

  middleOfList.push(3);
  middleOfList.push(2);
  middleOfList.push(1);

  print("\nAll list elements: $middleOfList");
  print("middle element: ${middleOfList.middle}");
  print("Get middle: ${getMiddle(middleOfList)}");

  // Remove All (2) <- element
  final remFolEleOfList = LinkedList<int>();

  remFolEleOfList.push(3);
  remFolEleOfList.push(2);
  remFolEleOfList.push(2);
  remFolEleOfList.push(1);

  print("\nBefore: $remFolEleOfList");

  remFolEleOfList.removeAll(2);

  print("After: $remFolEleOfList");
} 
