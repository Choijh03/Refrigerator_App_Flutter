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
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: freezerCompleted,
                onChanged: onChanged_Freezer,
                activeColor: Colors.black,
              ),
              const SizedBox(
                width: 30,
              ),
              //item name
              Text(
                freezerName,
                style: TextStyle(
                  decoration: freezerCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(date_freezer),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
