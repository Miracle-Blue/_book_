void main(List<String> args) {
  //* *** Mapping over a collection
  const numbers = [1, 2, 3, 4];
  final squares = numbers.map((number) => number * number); // (1, 4, 9, 16)
  // 👆🏻 it's an Iterable<int>

  // Iterable convert to toList()/toSet()
  squares.toList(); // [1, 4, 9, 16]
  squares.toSet(); // {1, 4, 9, 16}

  //* *** Filtering a collection
  final evens = squares.where((square) => square.isEven); // (4, 16)
  // 👆🏻 it's an Iterable<int>

  var objects = [1, 'a', 2, 'b', 3];
  var ints1 = objects.where((e) => e is int); // bad
  // 👆🏻 it's an Iterable<Object>
  var ints2 = objects.whereType<int>(); // good
  // 👆🏻 it's an Iterable<int>

  //* *** Using reduce
  const amounts = [199, 299, 299, 199, 499];
  final totalReduce = amounts.reduce((sum, element) => sum + element); // 1495
  // 👆🏻 it's an int

  //* *** Using fold
  final totalFold = amounts.fold(0, (int sum, element) => sum + element);
  //? fold doing this
  /**
   * var value = initialValue;
   * 
   * for (E element in this) {
   *   value = combine(value, element);
   * }
   * 
   * return value;
   */

  //* *** Sorting a list
  final desserts = ['cookies', 'pie', 'donuts', 'brownies'];
  desserts.sort(); // [brownies, cookies, donuts, pie]

  //* *** Reversing a list
  var dessertsReversed = desserts.reversed; // (pie, donuts, cookies, brownies)
  // 👆🏻 it's an Iterable<String>

  //* *** Performing a custom sort
  desserts.sort((d1, d2) => d1.length.compareTo(d2.length));

  //* *** Combining higher order methods
  final bigTallDesserts = desserts
      .where((dessert) => dessert.length > 5)
      .map((dessert) => dessert.toUpperCase());

  //! Tacks
  final scores = [89, 77, 46, 93, 82, 67, 32, 88];
  // 1 - sort method dan foydalanib min va max ni toping
  // 2 - where method dan foydalanib 80 va 90 orasidagi sonlarin toping
}
