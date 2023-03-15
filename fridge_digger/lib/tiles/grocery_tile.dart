import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroceryTile extends StatelessWidget {
  final String groceryName;
  final bool groceryCompleted;
  Function(bool?)? onChanged_Grocery;
  Function(BuildContext)? deleteFunction;

  GroceryTile({
    super.key,
    required this.groceryName,
    required this.groceryCompleted,
    required this.onChanged_Grocery,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 25.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
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
          padding: const EdgeInsets.only(right: 24, top: 24, bottom: 24, left: 5),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //check box
              Checkbox(
                value: groceryCompleted,
                onChanged: onChanged_Grocery,
                activeColor: Colors.black,
              ),

              Text(
                groceryName,
                style: TextStyle(
                  decoration: groceryCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
