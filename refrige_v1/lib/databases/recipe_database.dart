import 'package:hive_flutter/hive_flutter.dart';

class RecipeDataBase {
  //list of recipe items
  List recipeList = [];

  //reference the box
  final _myBox = Hive.box('recipeBox');

  //run this method if this is the 1st time ever opening this app
  void createInitialDataRecipe() {
    recipeList = [
      ['Sample Recipe', 'item1', false, 'item2', false, 'item3', false],
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
