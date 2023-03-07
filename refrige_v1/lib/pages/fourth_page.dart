import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('Recipe List')),
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
    );
  }
}
