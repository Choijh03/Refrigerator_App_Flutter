import 'package:flutter/material.dart';
import 'package:refrige_v1/dialog_box_grocery.dart';
import '../grocery_tile.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //text controller
  final _controller = TextEditingController();

  //list of Grocery items
  List groceryList = [
    ["sample1", false],
    ["sample2", false],
  ];

  //checkbox was tapped
  void checkBoxChanged_grocery(bool? value, int index) {
    setState(() {
      groceryList[index][1] = !groceryList[index][1];
    });
  }

  //save new task
  void saveNewItem() {
    setState(() {
      groceryList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context, rootNavigator: true).pop();
  }

  //create new Grocery item
  void createNewGroceryItem() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxGrocerry(
          controller: _controller,
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
      groceryList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('Grocery List')),
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewGroceryItem,
        backgroundColor: Colors.grey[600],
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (context, index) {
          return GroceryTile(
            groceryName: groceryList[index][0],
            groceryCompleted: groceryList[index][1],
            onChanged_Grocery: (value) => checkBoxChanged_grocery(value, index),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
