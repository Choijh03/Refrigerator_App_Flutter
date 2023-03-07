import 'package:flutter/material.dart';
import 'package:refrige_v1/dialogs/dialog_box_freezer.dart';

import '../tiles/freezer_tile.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //text controller
  final _controller = TextEditingController();

  //list of Freezer items
  List freezerList = [
    ["sample1", 'date', false],
    ["sample2", 'date', false],
  ];

  //checkbox was tapped
  void checkBoxChanged_freezer(bool? value, int index) {
    setState(() {
      freezerList[index][2] = !freezerList[index][2];
    });
  }

  //save new task
  void saveNewItem() {
    setState(() {
      freezerList.add([_controller.text, '2023-03-08', false]);
      _controller.clear();
    });
    Navigator.of(context, rootNavigator: true).pop();
  }

  //create new Freezer item
  void createNewFreezerItem() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxFreezer(
          controller2: _controller,
          onSave: saveNewItem,
          //dismiss
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete item
  void deleteItem(int index) {
    setState(() {
      freezerList.removeAt(index);
    });
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
        itemCount: freezerList.length,
        itemBuilder: (context, index) {
          return FreezerTile(
            freezerName: freezerList[index][0],
            date_freezer: freezerList[index][1],
            freezerCompleted: freezerList[index][2],
            onChanged_Freezer: (value) => checkBoxChanged_freezer(value, index),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
