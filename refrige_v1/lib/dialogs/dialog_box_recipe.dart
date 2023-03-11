import 'package:flutter/material.dart';
import '../my_button.dart';

class DialogBoxRecipe extends StatelessWidget {
  final controller_name;
  final controller_item1;
  final controller_item2;
  final controller_item3;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBoxRecipe({
    super.key,
    required this.controller_name,
    required this.controller_item1,
    required this.controller_item2,
    required this.controller_item3,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 156, 152, 152),
      content: Container(
        height: 370,
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
