import 'package:flutter/material.dart';
import 'package:refrige_v1/databases/freezer_database.dart';
import 'package:refrige_v1/dialogs/dialog_box_freezer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../tiles/freezer_tile.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //reference Hive DataSaver
  final _dataSaver = Hive.box('dateSaver1');
  final _myBox = Hive.box('freezerBox');
  final _itemBox = Hive.box("freezerItemBox");
  FreezerDataBase db = FreezerDataBase();

  @override
  void initState() {
    //if this is the 1st time ever opening the ap, then create default data
    if (_myBox.get("FREEZERLIST") == null) {
      db.createInitialDataFreezer();
    } else {
      //there already exists data
      db.loadDataFreezer();
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
  void checkBoxChanged_freezer(bool? value, int index) {
    setState(() {
      db.freezerList[index][2] = !db.freezerList[index][2];
    });
    db.updateDataBaseFreezer();
  }

  //save new task
  void saveNewItem() {
    setState(() {
      dateTemp = _dataSaver.get("TEXT");
      db.freezerList.add([_controller.text, dateTemp, false]);
      db.freezerItemList.add(_controller.text);
      _controller.clear();
    });
    ResetTextDataBase();
    Navigator.of(context, rootNavigator: true).pop();
    db.updateDataBaseFreezer();
  }

  void close() {
    _controller.clear();
    Navigator.of(context, rootNavigator: true).pop();
    ResetTextDataBase();
  }

  //create new Freezer item
  void createNewFreezerItem() {
    if (_dataSaver.get("TEXT") == null) {
      writeData(formatter.format(_today).toString());
    }
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxFreezer(
          controller2: _controller,
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
      db.freezerList.removeAt(index);
      db.freezerItemList.removeAt(index);
    });
    db.updateDataBaseFreezer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('Freezer List')),
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewFreezerItem,
        backgroundColor: Colors.grey[600],
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.freezerList.length,
        itemBuilder: (context, index) {
          return FreezerTile(
            freezerName: db.freezerList[index][0],
            date_freezer: db.freezerList[index][1],
            freezerCompleted: db.freezerList[index][2],
            onChanged_Freezer: (value) => checkBoxChanged_freezer(value, index),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
