import 'package:flutter/material.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('Food Recommendation Roullete')),
        backgroundColor: Colors.grey,
        elevation: 0, //removing shadow
      ),
    );
  }
}
