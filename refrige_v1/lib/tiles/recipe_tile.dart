import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RecipeTile extends StatelessWidget {
  final String recipeName;
  final bool item1Available;
  final String item1;
  final bool item2Available;
  final String item2;
  final bool item3Available;
  final String item3;
  Function(bool?)? onChanged_item1;
  Function(bool?)? onChanged_item2;
  Function(bool?)? onChanged_item3;
  Function(BuildContext)? deleteFunction;

  RecipeTile({
    super.key,
    required this.recipeName,
    required this.item1,
    required this.item1Available,
    required this.item2,
    required this.item2Available,
    required this.item3,
    required this.item3Available,
    required this.onChanged_item1,
    required this.onChanged_item2,
    required this.onChanged_item3,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        top: 25.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  recipeName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: item1Available,
                      onChanged: onChanged_item1,
                      activeColor: Colors.black,
                    ),
                    Text(item1),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: item2Available,
                      onChanged: onChanged_item2,
                      activeColor: Colors.black,
                    ),
                    Text(item2),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: item3Available,
                      onChanged: onChanged_item3,
                      activeColor: Colors.black,
                    ),
                    Text(item3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
