import 'package:hive_flutter/hive_flutter.dart';

class RefrigeratorDataBase {
  //list of Refrigerator items
  List refrigeratorList = [];
  List refrigeratorItemList = [];

  //reference the box
  final _myBox = Hive.box('refrigeratorBox');
  final _itemBox = Hive.box("refrigeratorItemBox");

  //run this method if this is the 1st time ever opening this app
  void createInitialDataRefrigerator() {
    refrigeratorList = [
      ["sample1", 'yyyy-mm-dd', false],
      ["sample2", 'yyyy-mm-dd', false],
    ];

    refrigeratorItemList = ["sample1", "sample2"];
  }

  //load the data from database
  void loadDataRefrigerator() {
    refrigeratorList = _myBox.get("REFRIGERATORLIST");
    refrigeratorItemList = _itemBox.get("REFRIGERATORITEMLIST");
  }

  //update the database
  void updateDataBaseRefrigerator() {
    _myBox.put("REFRIGERATORLIST", refrigeratorList);
    _itemBox.put("REFRIGERATORITEMLIST", refrigeratorItemList);
  }
}
