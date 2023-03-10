import 'package:hive_flutter/hive_flutter.dart';

class FreezerDataBase {
  //Freezer List
  List freezerList = [];
  List freezerItemList = [];

  //reference the box
  final _myBox = Hive.box('freezerBox');
  final _itemBox = Hive.box("freezerItemBox");

  //run this method if this is the 1st time ever opening this app
  void createInitialDataFreezer() {
    freezerList = [
      ["sample1", 'yyyy-mm-dd', false],
      ["sample2", 'yyyy-mm-dd', false],
    ];

    freezerItemList = ["sample1", "sample2"];
  }

  //load the data from database
  void loadDataFreezer() {
    freezerList = _myBox.get("FREEZERLIST");
    freezerItemList = _itemBox.get("FREEZERITEMLIST");
  }

  //update the database
  void updateDataBaseFreezer() {
    _myBox.put("FREEZERLIST", freezerList);
    _itemBox.put("FREEZERITEMLIST", freezerItemList);
  }
}
