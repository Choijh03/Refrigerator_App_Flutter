import 'package:flutter/material.dart';
import '../my_button.dart';

class DialogBoxRecipe extends StatelessWidget {
  final controller_name;
  final controller_item1;
  final controller_item2;
  final controller_item3;
  final controller_item4;
  final controller_item5;
  final controller_item6;
  final controller_item7;
  final controller_item8;
  final controller_item9;
  final controller_item10;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBoxRecipe({
    super.key,
    required this.controller_name,
    required this.controller_item1,
    required this.controller_item2,
    required this.controller_item3,
    required this.controller_item4,
    required this.controller_item5,
    required this.controller_item6,
    required this.controller_item7,
    required this.controller_item8,
    required this.controller_item9,
    required this.controller_item10,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 156, 152, 152),
      content: SingleChildScrollView(
        child: Container(
          height: 850,
          child: Column(
            children: [
              //get recipe name
              TextField(
                controller: controller_name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new recipe name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '*If less item needed, leave item section as blank or empty.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item1',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item2',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item3',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item4',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item5',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item6,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item6',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item7,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item7',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item8',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item9,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item9',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller_item10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item10',
                ),
              ),

              //buttons -> save + canel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //save button
                  MyButton(text: 'Save', onPressed: onSave),

                  const SizedBox(
                    width: 8,
                  ),

                  //cancel button
                  MyButton(text: 'Cancel', onPressed: onCancel),
                  //cancel button
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
