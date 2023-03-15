import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FreezerTile extends StatelessWidget {
  final String freezerName;
  final String date_freezer;
  final bool freezerCompleted;
  Function(bool?)? onChanged_Freezer;
  Function(BuildContext)? deleteFunction;

  FreezerTile({
    super.key,
    required this.freezerName,
    required this.date_freezer,
    required this.freezerCompleted,
    required this.onChanged_Freezer,
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
                value: freezerCompleted,
                onChanged: onChanged_Freezer,
                activeColor: Colors.black,
              ),
              //item name
              Text(
                freezerName,
                style: TextStyle(
                  decoration: freezerCompleted
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
                date_freezer,
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
