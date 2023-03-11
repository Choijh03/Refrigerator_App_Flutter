import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  int selected = 0;
  List<String> foods = [
    'MCDONALDs',
    'SUBWAY',
    'TACO BELL',
    'CHICK-FIL-A',
    'WENDYs',
    'BURGER KING',
    'DOMINO',
    'PIZZA HUT',
    'CHIPOTLE',
    'SONIC DRIVE-IN',
    'KFC',
    'ARBYs',
    'LITTLE CAESARS',
    'JACK IN THE BOX',
    'PANDA EXPRESS',
    'POPEYES',
    'PAPA JOHNs',
    'FIVE GUYS',
    'CARLs JR',
    'WINGSTOP',
    'RAISING CANEs',
    'IN-N-OUT',
    'EL POLLO LOCO',
    'DEL TACO',
    'PAPA MURPHYs',
    'CHURCHs CHICKEN',
    'DAIRY QUEEN',
    'JIMMY JOHNs',
    'JERSEY MIKEs',
    'HARDEEs',
    'WINGSTOP',
    'FIREHOUSE SUBS',
    'SHAKE SHACK',
    'SUSHI',
    'RAMEN',
    'UDON',
    'K-BBQ',
    'BBQ Chicken',
    'INSTANT NOODLE',
    'BUFFALO WILD WINGS',
    'CA PIZZA KITCHEN',
    'OLIVE GARDEN',
    "BUFFET",
    "SEAFOOD",
    'TEXAS BBQ',
    'PHO',
    'THAI',
    'OVEN CHICKEN',
  ];
  String food = '';

  //choose 5 food from array
  String food1 = 'food item1';
  String food2 = 'food item2';
  String food3 = 'food item3';
  String food4 = 'food item4';
  String food5 = 'food item5';

  //randomize the array and choose first five items
  void randomFood(List<String> list) {
    list.shuffle();

    food1 = list[0];
    food2 = list[1];
    food3 = list[2];
    food4 = list[3];
    food5 = list[4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Center(child: Text('Food Recommendation Roullete')),
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            food,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.grey[400],
              onPressed: () {
                setState(() {
                  randomFood(foods);
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Click to randomize the list!'),
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
    );
  }
}
