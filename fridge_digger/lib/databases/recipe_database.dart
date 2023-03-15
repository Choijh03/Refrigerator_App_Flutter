import 'package:hive_flutter/hive_flutter.dart';

class RecipeDataBase {
  //list of recipe items
  List recipeList = [];

  //reference the box
  final _myBox = Hive.box('recipeBox');

  //run this method if this is the 1st time ever opening this app
  void createInitialDataRecipe() {
    recipeList = [
      [
        'Sample Recipe',
        'item1',
        true,
        'item2',
        true,
        'item3',
        true,
        'item4',
        false,
        'item5',
        false,
        'item6',
        false,
        'item7',
        false,
        'item8',
        false,
        'item9',
        false,
        'item10',
        false,
      ],
    ];
  }

  //load the data from database
  void loadDataRecipe() {
    recipeList = _myBox.get('RECIPELIST');
  }

  //update the database
  void updateDataBaseRecipe() {
    _myBox.put("RECIPELIST", recipeList);
  }
}
