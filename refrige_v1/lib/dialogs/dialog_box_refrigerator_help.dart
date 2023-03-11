import 'package:flutter/material.dart';

class DialogBoxRefrigeratorHelp extends StatelessWidget {
  const DialogBoxRefrigeratorHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 156, 152, 152),
      content: Container(
        height: 320,
        child: Column(
          children: const [
            Center(
              child: Text(
                'How To Use Refrigerator List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '1. Click circular plus button on the right bottom to add new item.',
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '2. Slide from right to left and click trash bin icon to delete an item.',
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '3. If check box clicked, item has line-through. If unchecked, item has no line-through.',
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '4. Click Choose date button to change the date other than today.',
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '5. Use Bottom navigator buttons to move to other screens.',
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
