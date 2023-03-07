import 'package:flutter/material.dart';
import 'package:refrige_v1/dialogs/dialog_box_refrigerator.dart';

import '../tiles/refrigerator_tile.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  //text controller
  final _controller = TextEditingController();

  //list of Refrigerator items
  List refrigeratorList = [
    ["sample1", 'date', false],
    ["sample2", 'date', false],
  ];

  //checkbox was tapped
  void checkBoxChanged_refrigerator(bool? value, int index) {
    setState(() {
      refrigeratorList[index][2] = !refrigeratorList[index][2];
    });
  }

  //save new task
  void saveNewItem() {
    setState(() {
      refrigeratorList.add([_controller.text, '2023-03-08', false]);
      _controller.clear();
    });
    Navigator.of(context, rootNavigator: true).pop();
  }

  //create new Refrigerator item
  void createNewRefrigeratorItem() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxRefrigerator(
          controller1: _controller,
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
      refrigeratorList.removeAt(index);
    });
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
        itemCount: refrigeratorList.length,
        itemBuilder: (context, index) {
          return RefrigeratorTile(
            refrigeratorName: refrigeratorList[index][0],
            date_refrigerator: refrigeratorList[index][1],
            refrigeratorCompleted: refrigeratorList[index][2],
            onChanged_Refrigerator: (value) =>
                checkBoxChanged_refrigerator(value, index),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
