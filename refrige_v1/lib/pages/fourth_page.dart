import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refrige_v1/databases/recipe_database.dart';

import '../dialogs/dialog_box_recipe.dart';
import '../dialogs/dialog_box_recipe_help.dart';
import '../tiles/recipe_tile.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _freezerBox = Hive.box("freezerItemBox");
  final _refrigeratorBox = Hive.box("refrigeratorItemBox");
  final _myBox = Hive.box('recipeBox');
  RecipeDataBase db = RecipeDataBase();

  @override
  void initState() {
    if (_myBox.get("RECIPELIST") == null) {
      db.createInitialDataRecipe();
    } else {
      //there already exists data
      db.loadDataRecipe();
    }
    super.initState();
  }

  //text controller
  final _controller_name = TextEditingController();
  final _controller_item1 = TextEditingController();
  final _controller_item2 = TextEditingController();
  final _controller_item3 = TextEditingController();

  //checkBox1 was tapped
  void checkBox1Changed() {}

  //checkBox2 was tapped
  void checkBox2Changed() {}

  //checkBox2 was tapped
  void checkBox3Changed() {}

  //dismiss
  void close() {
    _controller_name.clear();
    _controller_item1.clear();
    _controller_item2.clear();
    _controller_item3.clear();
    Navigator.of(context, rootNavigator: true).pop();
  }

  //void update refresh the info
  void refreshCheckBox() {
    List freezerItemList = [];
    List refrigeratorItemList = [];
    //check if freezer and refrigerator item hive box is null
    //this case can happen user come straight to the recipe page without
    //checking any other places
    //read freezer and refrigeraotr items data
    if (_freezerBox.get("FREEZERITEMLIST") == null) {
      freezerItemList = ["sample1", "sample2"];
    } else {
      freezerItemList = _freezerBox.get("FREEZERITEMLIST");
    }
    if (_refrigeratorBox.get("REFRIGERATORITEMLIST") == null) {
      refrigeratorItemList = ["sample1", "sample2"];
    } else {
      refrigeratorItemList = _refrigeratorBox.get("REFRIGERATORITEMLIST");
    }

    //go through from first avilable recipe item
    for (int index = 0; index < db.recipeList.length; index++) {
      bool itemBool1 = false;
      bool itemBool2 = false;
      bool itemBool3 = false;
      String item1String = db.recipeList[index][1];
      String item2String = db.recipeList[index][3];
      String item3String = db.recipeList[index][5];

      //compare with item1,itme2,item3 text to see if it's available
      for (var item in freezerItemList) {
        String temp = item;
        if (temp.toLowerCase() == item1String.toLowerCase()) {
          itemBool1 = true;
        }
        if (temp.toLowerCase() == item2String.toLowerCase()) {
          itemBool2 = true;
        }
        if (temp.toLowerCase() == item3String.toLowerCase()) {
          itemBool3 = true;
        }
      }

      for (var item in refrigeratorItemList) {
        String temp = item;
        if (temp.toLowerCase() == item1String.toLowerCase()) {
          itemBool1 = true;
        }
        if (temp.toLowerCase() == item2String.toLowerCase()) {
          itemBool2 = true;
        }
        if (temp.toLowerCase() == item3String.toLowerCase()) {
          itemBool3 = true;
        }
      }

      setState(() {
        db.recipeList[index][2] = itemBool1;
        db.recipeList[index][4] = itemBool2;
        db.recipeList[index][6] = itemBool3;
      });
      db.updateDataBaseRecipe();
    }
  }

  //save new recipe
  void saveNewRecipe() {
    bool item1 = false;
    bool item2 = false;
    bool item3 = false;
    List freezerItemList = [];
    List refrigeratorItemList = [];
    //check if freezer and refrigerator item hive box is null
    //this case can happen user come straight to the recipe page without
    //checking any other places
    //read freezer and refrigeraotr items data
    if (_freezerBox.get("FREEZERITEMLIST") == null) {
      freezerItemList = ["sample1", "sample2"];
    } else {
      freezerItemList = _freezerBox.get("FREEZERITEMLIST");
    }
    if (_refrigeratorBox.get("REFRIGERATORITEMLIST") == null) {
      refrigeratorItemList = ["sample1", "sample2"];
    } else {
      refrigeratorItemList = _refrigeratorBox.get("REFRIGERATORITEMLIST");
    }

    //compare with item1,itme2,item3 text to see if it's available
    for (var item in freezerItemList) {
      String temp = item;
      if (temp.toLowerCase() == _controller_item1.text.toLowerCase()) {
        item1 = true;
      }
      if (temp.toLowerCase() == _controller_item2.text.toLowerCase()) {
        item2 = true;
      }
      if (temp.toLowerCase() == _controller_item3.text.toLowerCase()) {
        item3 = true;
      }
    }

    for (var item in refrigeratorItemList) {
      String temp = item;
      if (temp.toLowerCase() == _controller_item1.text.toLowerCase()) {
        item1 = true;
      }
      if (temp.toLowerCase() == _controller_item2.text.toLowerCase()) {
        item2 = true;
      }
      if (temp.toLowerCase() == _controller_item3.text.toLowerCase()) {
        item3 = true;
      }
    }

    setState(() {
      db.recipeList.add([
        _controller_name.text,
        _controller_item1.text,
        item1,
        _controller_item2.text,
        item2,
        _controller_item3.text,
        item3,
      ]);

      _controller_name.clear();
      _controller_item1.clear();
      _controller_item2.clear();
      _controller_item3.clear();
    });
    Navigator.of(context, rootNavigator: true).pop();
    db.updateDataBaseRecipe();
  }

  //create new recipe
  void createNewRecipe() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxRecipe(
          controller_name: _controller_name,
          controller_item1: _controller_item1,
          controller_item2: _controller_item2,
          controller_item3: _controller_item3,
          onSave: saveNewRecipe,
          onCancel: close,
        );
      },
    );
  }

  //delte Item
  void deleteItem(int index) {
    setState(() {
      db.recipeList.removeAt(index);
    });
    db.updateDataBaseRecipe();
  }

  //show help dialog
  void helpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const DialogBoxRecipeHelp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Center(child: Text('Recipe List')),
        actions: [
          IconButton(
            onPressed: helpDialog, //help dialog
            icon: const Icon(
              Icons.help,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: refreshCheckBox, //refresh the recipe list with this btn
            icon: const Icon(Icons.refresh),
          )
        ],

        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewRecipe,
        backgroundColor: Colors.grey[600],
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.recipeList.length,
        itemBuilder: (context, index) {
          return RecipeTile(
            recipeName: db.recipeList[index][0],
            item1: db.recipeList[index][1],
            item1Available: db.recipeList[index][2],
            item2: db.recipeList[index][3],
            item2Available: db.recipeList[index][4],
            item3: db.recipeList[index][5],
            item3Available: db.recipeList[index][6],
            onChanged_item1: (value) => checkBox1Changed(),
            onChanged_item2: (value) => checkBox2Changed(),
            onChanged_item3: (value) => checkBox3Changed(),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
