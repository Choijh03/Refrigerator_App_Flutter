import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('Refrigerator List')),
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
    );
  }
}
