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
  final _controller_item4 = TextEditingController();
  final _controller_item5 = TextEditingController();
  final _controller_item6 = TextEditingController();
  final _controller_item7 = TextEditingController();
  final _controller_item8 = TextEditingController();
  final _controller_item9 = TextEditingController();
  final _controller_item10 = TextEditingController();

  //checkBox1 was tapped
  void checkBox1Changed() {}

  //checkBox2 was tapped
  void checkBox2Changed() {}

  //checkBox3 was tapped
  void checkBox3Changed() {}

  //checkBox4 was tapped
  void checkBox4Changed() {}

  //checkBox5 was tapped
  void checkBox5Changed() {}

  //checkBox6 was tapped
  void checkBox6Changed() {}

  //checkBox7 was tapped
  void checkBox7Changed() {}

  //checkBox8 was tapped
  void checkBox8Changed() {}

  //checkBox9 was tapped
  void checkBox9Changed() {}

  //checkBox10 was tapped
  void checkBox10Changed() {}

  //dismiss
  void close() {
    _controller_name.clear();
    _controller_item1.clear();
    _controller_item2.clear();
    _controller_item3.clear();
    _controller_item4.clear();
    _controller_item5.clear();
    _controller_item6.clear();
    _controller_item7.clear();
    _controller_item8.clear();
    _controller_item9.clear();
    _controller_item10.clear();
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
      bool itemBool4 = false;
      bool itemBool5 = false;
      bool itemBool6 = false;
      bool itemBool7 = false;
      bool itemBool8 = false;
      bool itemBool9 = false;
      bool itemBool10 = false;
      String item1String = db.recipeList[index][1];
      String item2String = db.recipeList[index][3];
      String item3String = db.recipeList[index][5];
      String item4String = db.recipeList[index][7];
      String item5String = db.recipeList[index][9];
      String item6String = db.recipeList[index][11];
      String item7String = db.recipeList[index][13];
      String item8String = db.recipeList[index][15];
      String item9String = db.recipeList[index][17];
      String item10String = db.recipeList[index][19];

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
        if (temp.toLowerCase() == item4String.toLowerCase()) {
          itemBool4 = true;
        }
        if (temp.toLowerCase() == item5String.toLowerCase()) {
          itemBool5 = true;
        }
        if (temp.toLowerCase() == item6String.toLowerCase()) {
          itemBool6 = true;
        }
        if (temp.toLowerCase() == item7String.toLowerCase()) {
          itemBool7 = true;
        }
        if (temp.toLowerCase() == item8String.toLowerCase()) {
          itemBool8 = true;
        }
        if (temp.toLowerCase() == item9String.toLowerCase()) {
          itemBool9 = true;
        }
        if (temp.toLowerCase() == item10String.toLowerCase()) {
          itemBool10 = true;
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
        if (temp.toLowerCase() == item4String.toLowerCase()) {
          itemBool4 = true;
        }
        if (temp.toLowerCase() == item5String.toLowerCase()) {
          itemBool5 = true;
        }
        if (temp.toLowerCase() == item6String.toLowerCase()) {
          itemBool6 = true;
        }
        if (temp.toLowerCase() == item7String.toLowerCase()) {
          itemBool7 = true;
        }
        if (temp.toLowerCase() == item8String.toLowerCase()) {
          itemBool8 = true;
        }
        if (temp.toLowerCase() == item9String.toLowerCase()) {
          itemBool9 = true;
        }
        if (temp.toLowerCase() == item10String.toLowerCase()) {
          itemBool10 = true;
        }
      }

      setState(() {
        db.recipeList[index][2] = itemBool1;
        db.recipeList[index][4] = itemBool2;
        db.recipeList[index][6] = itemBool3;
        db.recipeList[index][8] = itemBool4;
        db.recipeList[index][10] = itemBool5;
        db.recipeList[index][12] = itemBool6;
        db.recipeList[index][14] = itemBool7;
        db.recipeList[index][16] = itemBool8;
        db.recipeList[index][18] = itemBool9;
        db.recipeList[index][20] = itemBool10;
      });
      db.updateDataBaseRecipe();
    }
  }

  //save new recipe
  void saveNewRecipe() {
    bool item1 = false;
    bool item2 = false;
    bool item3 = false;
    bool item4 = false;
    bool item5 = false;
    bool item6 = false;
    bool item7 = false;
    bool item8 = false;
    bool item9 = false;
    bool item10 = false;
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
      if (temp.toLowerCase() == _controller_item4.text.toLowerCase()) {
        item4 = true;
      }
      if (temp.toLowerCase() == _controller_item5.text.toLowerCase()) {
        item5 = true;
      }
      if (temp.toLowerCase() == _controller_item6.text.toLowerCase()) {
        item6 = true;
      }
      if (temp.toLowerCase() == _controller_item7.text.toLowerCase()) {
        item7 = true;
      }
      if (temp.toLowerCase() == _controller_item8.text.toLowerCase()) {
        item8 = true;
      }
      if (temp.toLowerCase() == _controller_item9.text.toLowerCase()) {
        item9 = true;
      }
      if (temp.toLowerCase() == _controller_item10.text.toLowerCase()) {
        item10 = true;
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
      if (temp.toLowerCase() == _controller_item4.text.toLowerCase()) {
        item4 = true;
      }
      if (temp.toLowerCase() == _controller_item5.text.toLowerCase()) {
        item5 = true;
      }
      if (temp.toLowerCase() == _controller_item6.text.toLowerCase()) {
        item6 = true;
      }
      if (temp.toLowerCase() == _controller_item7.text.toLowerCase()) {
        item7 = true;
      }
      if (temp.toLowerCase() == _controller_item8.text.toLowerCase()) {
        item8 = true;
      }
      if (temp.toLowerCase() == _controller_item9.text.toLowerCase()) {
        item9 = true;
      }
      if (temp.toLowerCase() == _controller_item10.text.toLowerCase()) {
        item10 = true;
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
        _controller_item4.text,
        item4,
        _controller_item5.text,
        item5,
        _controller_item6.text,
        item6,
        _controller_item7.text,
        item7,
        _controller_item8.text,
        item8,
        _controller_item9.text,
        item9,
        _controller_item10.text,
        item10,
      ]);

      _controller_name.clear();
      _controller_item1.clear();
      _controller_item2.clear();
      _controller_item3.clear();
      _controller_item4.clear();
      _controller_item5.clear();
      _controller_item6.clear();
      _controller_item7.clear();
      _controller_item8.clear();
      _controller_item9.clear();
      _controller_item10.clear();
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
          controller_item4: _controller_item4,
          controller_item5: _controller_item5,
          controller_item6: _controller_item6,
          controller_item7: _controller_item7,
          controller_item8: _controller_item8,
          controller_item9: _controller_item9,
          controller_item10: _controller_item10,
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
            item4: db.recipeList[index][7],
            item4Available: db.recipeList[index][8],
            item5: db.recipeList[index][9],
            item5Available: db.recipeList[index][10],
            item6: db.recipeList[index][11],
            item6Available: db.recipeList[index][12],
            item7: db.recipeList[index][13],
            item7Available: db.recipeList[index][14],
            item8: db.recipeList[index][15],
            item8Available: db.recipeList[index][16],
            item9: db.recipeList[index][17],
            item9Available: db.recipeList[index][18],
            item10: db.recipeList[index][19],
            item10Available: db.recipeList[index][20],
            onChanged_item1: (value) => checkBox1Changed(),
            onChanged_item2: (value) => checkBox2Changed(),
            onChanged_item3: (value) => checkBox3Changed(),
            onChanged_item4: (value) => checkBox4Changed(),
            onChanged_item5: (value) => checkBox5Changed(),
            onChanged_item6: (value) => checkBox6Changed(),
            onChanged_item7: (value) => checkBox7Changed(),
            onChanged_item8: (value) => checkBox8Changed(),
            onChanged_item9: (value) => checkBox9Changed(),
            onChanged_item10: (value) => checkBox10Changed(),
            deleteFunction: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
