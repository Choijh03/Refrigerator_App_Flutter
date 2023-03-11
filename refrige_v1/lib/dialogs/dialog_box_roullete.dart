import 'package:flutter/material.dart';

import '../my_button.dart';

class DialogBoxRoullete extends StatelessWidget {
  final controller_item1;
  final controller_item2;
  final controller_item3;
  final controller_item4;
  final controller_item5;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBoxRoullete({
    super.key,
    required this.controller_item1,
    required this.controller_item2,
    required this.controller_item3,
    required this.controller_item4,
    required this.controller_item5,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 156, 152, 152),
      content: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller_item1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new item1',
              ),
            ),
            TextField(
              controller: controller_item2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new item2',
              ),
            ),
            TextField(
              controller: controller_item3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new item3',
              ),
            ),
            TextField(
              controller: controller_item4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new item4',
              ),
            ),
            TextField(
              controller: controller_item5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new item5',
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
    );
  }
}
