void main(List<String> args) {
  /**
   * Map
   * 
   * Dartdagi xaritalar kalit-qiymat juftligini 
   * saqlash uchun foydalaniladigan ma'lumotlar 
   * strukturasidir. Ular boshqa tillardagi 
   * HashMaps va Lug'atlarga o'xshaydi
   */

  //* 1 - Creating an empty map
  final Map<String, int> emptyMap1 = {};
  // good
  final emptyMap2 = <String, int>{};
  // bad
  final emptySomething = {}; // Map<dynamic, dynamic>

  // Initializing a Map with values
  final inventory = {
    'cakes': 20,
    'pies': 14,
    'donuts': 37,
    'cookies': 141,
  }; // Map<String, int>

  final digitToWord = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
  }; // Map<int, String>

  // Unique keys
  final treasureMap1 = {
    'garbage': 'in the dumpster',
    'glasses': 'on your head',
    'gold': 'in the cave',
    'gold': 'under your mattress',
  }; // Map<String, String>
  //? if we need to add two or more value in one key, do this 👇🏻
  final treasureMap2 = {
    'garbage': ['in the dumpster'],
    'glasses': ['on your head'],
    'gold': ['in the cave', 'under your mattress'],
  }; // Map<String, List<String>>

  //* 2 - Operations on a map
  // Accessing elements from a map
  final numberOfCakes = inventory['cakes']; // int?
  numberOfCakes?.isEven; //! null-aware access operator

  // Adding elements to a map
  inventory['brownies'] =
      3; // {cakes: 20, pies: 14, donuts: 37, cookies: 141, brownies: 3}

  // Updating an element
  inventory['cakes'] =
      1; // {cakes: 1, pies: 14, donuts: 37, cookies: 141, brownies: 3}

  // Removing elements from a map
  inventory.remove('cookies'); // {cakes: 1, pies: 14, donuts: 37, brownies: 3}

  //* 3 - Map properties
  inventory.isEmpty; // false
  inventory.isNotEmpty; // true
  inventory.length; // 4

  print(inventory.keys); // (cakes, pies, donuts, brownies)
  print(inventory.values); // (1, 14, 37, 3)

  // Checking for key or value existence
  print(inventory.containsKey('pies')); // true
  print(inventory.containsValue(42)); // false

  // Looping over elements of a map
  //! Error
  // for (var item in inventory) {
  //    print(inventory[item]);
  //  }

  for (var item in inventory.keys) {
    print(inventory[item]);
  }

  inventory.forEach((key, value) => print('$key ->$value'));

  for (final entry in inventory.entries) {
    print('${entry.key} -> ${entry.value}');
  }

}
