import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:refrige_v1/dialogs/dialog_box_roullete.dart';
import '../dialogs/dialog_box_roullete_help.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  int selected = 0;
  String food = '';

  //choose 5 food from array
  String food1 = 'food item1';
  String food2 = 'food item2';
  String food3 = 'food item3';
  String food4 = 'food item4';
  String food5 = 'food item5';

  //text controller
  final _controller_item1 = TextEditingController();
  final _controller_item2 = TextEditingController();
  final _controller_item3 = TextEditingController();
  final _controller_item4 = TextEditingController();
  final _controller_item5 = TextEditingController();

  //show help dialog
  void helpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const DialogBoxRoulleteHelp();
      },
    );
  }

  //save new recipe
  void saveNewRecipe() {
    setState(() {
      food1 = _controller_item1.text;
      food2 = _controller_item2.text;
      food3 = _controller_item3.text;
      food4 = _controller_item4.text;
      food5 = _controller_item5.text;
    });
    Navigator.of(context, rootNavigator: true).pop();
  }

  //create new Grocery item
  void createNewGroceryItem() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxRoullete(
          controller_item1: _controller_item1,
          controller_item2: _controller_item2,
          controller_item3: _controller_item3,
          controller_item4: _controller_item4,
          controller_item5: _controller_item5,
          onSave: saveNewRecipe,
          //dismiss
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Center(child: Text('Food Recommendation Roullete')),
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
          Icons.edit,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                food,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 350,
                  child: FortuneWheel(
                    animateFirst: false,
                    selected: selected,
                    physics: CircularPanPhysics(
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                    ),
                    onFling: () {
                      setState(() {
                        selected = Random().nextInt(4);
                      });
                    },
                    styleStrategy: const UniformStyleStrategy(
                      borderColor: Colors.white,
                      color: Colors.grey,
                      borderWidth: 5,
                    ),
                    items: [
                      FortuneItem(
                          child: Text(
                        food1,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                      FortuneItem(
                          child: Text(
                        food2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                      FortuneItem(
                          child: Text(
                        food3,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                      FortuneItem(
                          child: Text(
                        food4,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                      FortuneItem(
                          child: Text(
                        food5,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ],
                    onAnimationEnd: () {
                      setState(() {
                        if (selected == 0) {
                          food = food1;
                        } else if (selected == 1) {
                          food = food2;
                        } else if (selected == 2) {
                          food = food3;
                        } else if (selected == 3) {
                          food = food4;
                        } else if (selected == 4) {
                          food = food5;
                        }
                      });
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = Random().nextInt(4);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    left: 25,
                    right: 25,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Click to Spin!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
