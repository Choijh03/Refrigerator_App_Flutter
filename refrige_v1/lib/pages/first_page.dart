import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refrige_v1/databases/grocery_database.dart';
import 'package:refrige_v1/dialogs/dialog_box_grocerry_help.dart';
import 'package:refrige_v1/dialogs/dialog_box_grocery.dart';
import '../tiles/grocery_tile.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //reference the hive box
  final _myBox = Hive.box('groceryBox');
  GroceryDataBase db = GroceryDataBase();

  @override
  void initState() {
    //if this is the 1st time ever opening the ap, then create default data
    if (_myBox.get("GROCERYLIST") == null) {
      db.createInitialDataGrocery();
    } else {
      //there already exists data
      db.loadDataGrocery();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //checkbox was tapped
  void checkBoxChanged_grocery(bool? value, int index) {
    setState(() {
      db.groceryList[index][1] = !db.groceryList[index][1];
    });
    db.updateDataBaseGrocery();
  }

  //save new task
  void saveNewItem() {
    setState(() {
      db.groceryList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context, rootNavigator: true).pop();
    db.updateDataBaseGrocery();
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
      db.groceryList.removeAt(index);
    });
    db.updateDataBaseGrocery();
  }

  //show help dialog
  void helpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const DialogBoxGrocerryHelp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Center(child: Text('Grocery List')),
        actions: [
          IconButton(
            onPressed: helpDialog, //help dialog
            icon: const Icon(
              Icons.help,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewGroceryItem,
        backgroundColor: Colors.grey[600],
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.groceryList.length,
        itemBuilder: (context, index) {
          return GroceryTile(
            groceryName: db.groceryList[index][0],
            groceryCompleted: db.groceryList[index][1],
            onChanged_Grocery: (value) => checkBoxChanged_grocery(value, index),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
