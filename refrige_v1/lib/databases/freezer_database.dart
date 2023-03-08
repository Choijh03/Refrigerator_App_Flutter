import 'package:hive_flutter/hive_flutter.dart';

class FreezerDataBase {
  //Freezer List
  List freezerList = [];

  //reference the box
  final _myBox = Hive.box('freezerBox');

  //run this method if this is the 1st time ever opening this app
  void createInitialDataFreezer() {
    freezerList = [
      ["sample1", 'yyyy-mm-dd', false],
      ["sample2", 'yyyy-mm-dd', false],
    ];
  }

  //load the data from database
  void loadDataFreezer() {
    freezerList = _myBox.get("FREEZERLIST");
  }

  //update the database
  void updateDataBaseFreezer() {
    _myBox.put("FREEZERLIST", freezerList);
  }
}
