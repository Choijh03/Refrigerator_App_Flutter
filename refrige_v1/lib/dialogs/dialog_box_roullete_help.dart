import 'package:flutter/material.dart';

class DialogBoxRoulleteHelp extends StatelessWidget {
  const DialogBoxRoulleteHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 156, 152, 152),
      content: Container(
        height: 160,
        child: Column(
          children: const [
            Center(
              child: Text(
                'How To Use Grocery List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '1. Click randomize button to randomize the item list.',
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '2. Click spin button to spin the wheel or spin the wheel by rolling the wheel.',
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
