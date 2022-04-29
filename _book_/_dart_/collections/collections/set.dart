void main(List<String> args) {
  /**
   * Set
   * 
   * To'plamlar noyob elementlar to'plamini 
   * yaratish uchun ishlatiladi. Dartdagi to'plamlar 
   * o'zlarining matematik hamkasblariga o'xshaydi. 
   * Takroriy nusxalarga ruxsat beruvchi ro'yxatlardan 
   * farqli o'laroq, to'plamda dublikatlarga ruxsat berilmaydi.
   */

  //* 1 - Creating a set
  // bad
  final Set<int> someSet1 = {};
  // good
  final someSet2 = <int>{};

  final anotherSet = {1, 2, 3, 1}; // {1, 2, 3}

  //* 2 - Operations on a set
  // Checking the contents
  print(anotherSet.contains(1)); // true
  print(anotherSet.contains(99)); // false

  // Adding single elements
  final someSet = <int>{};
  someSet.add(42);
  someSet.add(2112);
  someSet.add(42); // {42, 2112}

  // Removing elements
  someSet.remove(2112); // {42}

  // Adding multiple elements
  someSet.addAll([1, 2, 3, 4]); // {42, 1, 2, 3, 4}

  // Intersections - kesishmasi
  final setA = {8, 2, 3, 1, 4};
  final setB = {1, 6, 5, 4};
  final intersection = setA.intersection(setB); // {1, 4}

  // Unions - birlashmasi
  final union = setA.union(setB); // {8, 2, 3, 1, 4, 6, 5}

  final dif = setB.difference(setA);

  print("intersection - $intersection");
  print("union - $union");
  print("dif - $dif");
}
