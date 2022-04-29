void main(List<String> args) {
  /**
   * List --- [] <- This is called a //! list literal.
   * 
   * Bir turga mansub juda kop obyectlarni 
   * tartibli saqlash uchun ishlatilinadigan 
   * malumot tuzulmasi. 
   */

  //* 1 - Creating a List
  var desserts = ['cookies', 'cupcakes', 'donuts', 'pie']; // List<String>
  desserts = []; // it still - List<String>

  var snacks = []; // List<dynamic> - this causes you to lose type safety
  // if you need an empty list, you should specify the type like so:
  List<String> goodSnacks = [];
  var nicerSnacks = <String>[];

  // printing List
  desserts = [
    'cookies',
    'cupcakes',
    'donuts',
    'pie'
  ]; // [cookies, cupcakes, donuts, pie]

  // Accessing elements
  final secondElement = desserts[1]; // 'cupcakes'

  // Assigning values to list elements (Updating)
  desserts[1] = 'cake';

  // Adding elements to a list
  desserts.add('brownies'); // [cookies, cake, donuts, pie, brownies]

  // Removing elements from a list
  desserts.remove('cake'); // [cookies, donuts, pie, brownies]

  // Mutable and immutable lists
  var mutableDesserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  mutableDesserts = [];
  mutableDesserts = ['cookies', 'cupcakes', 'donuts', 'pie'];

  final immutableDesserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  //! immutableDesserts = []; // not allowed
  //! immutableDesserts = ['cake', 'ice cream']; // not allowed
  //! immutableDesserts = desserts; // not allowed

  immutableDesserts.remove('cookies'); // OK
  immutableDesserts.remove('cupcakes'); // OK
  immutableDesserts.add('ice cream'); // OK

  // Deeply immutable - 1
  const deepImmutableDesserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  //! deepImmutableDesserts.add('brownie'); // not allowed
  //! deepImmutableDesserts.remove('pie'); // not allowed
  //! deepImmutableDesserts[0] = 'fudge'; // not allowed

  // Deeply immutable - 2  // modifiable unmodifiable
  final deepImmutWithFDesserts = const ['cookies', 'cupcakes', 'donuts', 'pie'];

  final modifiableList = [DateTime.now(), DateTime.now()];
  final unmodifiableList = List.unmodifiable(modifiableList);

  modifiableList.add(DateTime.now()); // OK
  unmodifiableList.add(DateTime.now()); // Error

  // * 2 - List properties
  const drinks = ['water', 'milk', 'juice', 'soda'];

  drinks.first; // water
  drinks.last; // soda

  // Checking if a list contains any elements
  drinks.isEmpty; // false
  drinks.isNotEmpty; // true

  drinks.length == 0; // false
  drinks.length > 0; // true
  // ! don't use this with if statement, Use firstOne

  // Looping over the elements of a list
  for (var dessert in desserts) {
    print(dessert);
  }

  // bad
  desserts.forEach((dessert) => print(dessert));

  // good
  desserts.forEach(print); // This is known as a tear-off

  // Spread operator (...)
  const pastries = ['cookies', 'croissants'];
  const candy = ['Junior Mints', 'Twizzlers', 'M&Ms'];

  const dessertsWithSpreed = ['donuts', ...pastries, ...candy];
  //?  [donuts, cookies, croissants, Junior Mints, Twizzlers, M&Ms]

  // null spread operator (...?),
  List<String>? coffees;
  final hotDrinks = ['milk tea', ...?coffees];

  // Collection if  //! Recomended case
  const peanutAllergy = true;
  const candyWithIf = [
    'Junior Mints',
    'Twizzlers',
    if (!peanutAllergy) 'Reeses'
  ];
  //? [Junior Mints, Twizzlers]

  // Collection for
  const deserts = ['gobi', 'sahara', 'arctic'];
  var bigDeserts = [
    'ARABIAN',
    for (var desert in deserts) desert.toUpperCase(),
  ]; // [ARABIAN, GOBI, SAHARA, ARCTIC]

}
