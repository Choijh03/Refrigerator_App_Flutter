import 'package:flutter/material.dart';
import 'package:refrige_v1/databases/refrigerator_database.dart';
import 'package:refrige_v1/dialogs/dialog_box_refrigerator.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../tiles/refrigerator_tile.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  //reference Hive DataSaver
  final _dataSaver = Hive.box('dateSaver2');
  final _myBox = Hive.box('refrigeratorBox');
  final _itemBox = Hive.box("refrigeratorItemBox");
  RefrigeratorDataBase db = RefrigeratorDataBase();

  @override
  void initState() {
    //if this is the 1st time ever opening the ap, then create default data
    if (_myBox.get("REFRIGERATORLIST") == null) {
      db.createInitialDataRefrigerator();
    } else {
      //there already exists data
      db.loadDataRefrigerator();
    }
    super.initState();
  }

  String dateTemp = '2023-03-08';

  //create datetime variable
  DateTime _today = DateTime.now();
  DateTime _dateTime = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  //write data
  void writeData(String text) {
    _dataSaver.put("TEXT", text);
  }

  //reset data base with today's date
  void ResetTextDataBase() {
    _dataSaver.delete("TEXT");
    writeData(formatter.format(_today).toString());
  }

  //text controller
  final _controller = TextEditingController();

  //checkbox was tapped
  void checkBoxChanged_refrigerator(bool? value, int index) {
    setState(() {
      db.refrigeratorList[index][2] = !db.refrigeratorList[index][2];
    });
    db.updateDataBaseRefrigerator();
  }

  //save new task
  void saveNewItem() {
    setState(() {
      dateTemp = _dataSaver.get("TEXT");
      db.refrigeratorList.add([_controller.text, dateTemp, false]);
      db.refrigeratorItemList.add(_controller.text);
      _controller.clear();
    });
    ResetTextDataBase();
    Navigator.of(context, rootNavigator: true).pop();
    db.updateDataBaseRefrigerator();
  }

  void close() {
    _controller.clear();
    Navigator.of(context, rootNavigator: true).pop();
    ResetTextDataBase();
  }

  //create new Refrigerator item
  void createNewRefrigeratorItem() {
    if (_dataSaver.get("TEXT") == null) {
      writeData(formatter.format(_today).toString());
    }
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxRefrigerator(
          controller1: _controller,
          onSave: saveNewItem,
          //dismiss
          onCancel: close,
        );
      },
    );
  }

  //delete item
  void deleteItem(int index) {
    setState(() {
      db.refrigeratorList.removeAt(index);
      db.refrigeratorItemList.removeAt(index);
    });
    db.updateDataBaseRefrigerator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('Refrigerator List')),
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewRefrigeratorItem,
        backgroundColor: Colors.grey[600],
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.refrigeratorList.length,
        itemBuilder: (context, index) {
          return RefrigeratorTile(
            refrigeratorName: db.refrigeratorList[index][0],
            date_refrigerator: db.refrigeratorList[index][1],
            refrigeratorCompleted: db.refrigeratorList[index][2],
            onChanged_Refrigerator: (value) =>
                checkBoxChanged_refrigerator(value, index),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
