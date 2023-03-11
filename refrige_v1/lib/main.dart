import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open a box
  var dateSaver1 = await Hive.openBox('dateSaver1');
  var dateSaver2 = await Hive.openBox('dateSaver2');
  var groceryBox = await Hive.openBox('groceryBox');
  var freezerBox = await Hive.openBox('freezerBox');
  var refrigeratorBox = await Hive.openBox('refrigeratorBox');
  var recipeBox = await Hive.openBox('recipeBox');
  var freezerTempBox = await Hive.openBox("freezerItemBox");
  var refrigeratorTempBox = await Hive.openBox("refrigeratorItemBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
