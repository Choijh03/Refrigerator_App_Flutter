import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RefrigeratorTile extends StatelessWidget {
  final String refrigeratorName;
  final String date_refrigerator;
  final bool refrigeratorCompleted;
  Function(bool?)? onChanged_Refrigerator;
  Function(BuildContext)? deleteFunction;

  RefrigeratorTile({
    super.key,
    required this.refrigeratorName,
    required this.date_refrigerator,
    required this.refrigeratorCompleted,
    required this.onChanged_Refrigerator,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
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
              //checkbox
              Checkbox(
                value: refrigeratorCompleted,
                onChanged: onChanged_Refrigerator,
                activeColor: Colors.black,
              ),
              //item name
              Text(
                refrigeratorName,
                style: TextStyle(
                  decoration: refrigeratorCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                date_refrigerator,
                style: const TextStyle(
                  fontSize: 13,
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
