import 'package:hive_flutter/hive_flutter.dart';

class GroceryDataBase {
  //list of Grocery items
  List groceryList = [];

  //reference the box
  final _myBox = Hive.box('groceryBox');

  //run this method if this is the 1st time ever opening this app
  void createInitialDataGrocery() {
    groceryList = [
      ["sample1", false],
      ["sample2", false],
    ];
  }

  //load the data from database
  void loadDataGrocery() {
    groceryList = _myBox.get("GROCERYLIST");
  }

  //update the database
  void updateDataBaseGrocery() {
    _myBox.put("GROCERYLIST", groceryList);
  }
}
