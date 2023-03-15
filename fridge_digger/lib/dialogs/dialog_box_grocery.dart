import 'package:flutter/material.dart';

import '../my_button.dart';

class DialogBoxGrocerry extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBoxGrocerry({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 156, 152, 152),
      content: SingleChildScrollView(
        child: Container(
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                maxLength: 18,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new item',
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
