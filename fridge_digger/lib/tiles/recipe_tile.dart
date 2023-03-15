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
  final bool item4Available;
  final String item4;
  final bool item5Available;
  final String item5;
  final bool item6Available;
  final String item6;
  final bool item7Available;
  final String item7;
  final bool item8Available;
  final String item8;
  final bool item9Available;
  final String item9;
  final bool item10Available;
  final String item10;

  Function(bool?)? onChanged_item1;
  Function(bool?)? onChanged_item2;
  Function(bool?)? onChanged_item3;
  Function(bool?)? onChanged_item4;
  Function(bool?)? onChanged_item5;
  Function(bool?)? onChanged_item6;
  Function(bool?)? onChanged_item7;
  Function(bool?)? onChanged_item8;
  Function(bool?)? onChanged_item9;
  Function(bool?)? onChanged_item10;
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
    required this.item4,
    required this.item4Available,
    required this.item5,
    required this.item5Available,
    required this.item6,
    required this.item6Available,
    required this.item7,
    required this.item7Available,
    required this.item8,
    required this.item8Available,
    required this.item9,
    required this.item9Available,
    required this.item10,
    required this.item10Available,
    required this.onChanged_item1,
    required this.onChanged_item2,
    required this.onChanged_item3,
    required this.onChanged_item4,
    required this.onChanged_item5,
    required this.onChanged_item6,
    required this.onChanged_item7,
    required this.onChanged_item8,
    required this.onChanged_item9,
    required this.onChanged_item10,
    required this.deleteFunction,
  });

  bool isTextEmpty(String itemText) {
    if (itemText == '') {
      return true;
    } else {
      return false;
    }
  }

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
            padding: const EdgeInsets.only(right: 24, top: 24, bottom: 24, left: 5),
            child: Column(
              children: [
                Text(
                  recipeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item1) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item1Available,
                            onChanged: onChanged_item1,
                            activeColor: Colors.black,
                          ),
                          Text(item1),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item2) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item2Available,
                            onChanged: onChanged_item2,
                            activeColor: Colors.black,
                          ),
                          Text(item2),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item3) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item3Available,
                            onChanged: onChanged_item3,
                            activeColor: Colors.black,
                          ),
                          Text(item3),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item4) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item4Available,
                            onChanged: onChanged_item4,
                            activeColor: Colors.black,
                          ),
                          Text(item4),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item5) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item5Available,
                            onChanged: onChanged_item5,
                            activeColor: Colors.black,
                          ),
                          Text(item5),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item6) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item6Available,
                            onChanged: onChanged_item6,
                            activeColor: Colors.black,
                          ),
                          Text(item6),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item7) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item7Available,
                            onChanged: onChanged_item7,
                            activeColor: Colors.black,
                          ),
                          Text(item7),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item8) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item8Available,
                            onChanged: onChanged_item8,
                            activeColor: Colors.black,
                          ),
                          Text(item8),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item9) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item9Available,
                            onChanged: onChanged_item9,
                            activeColor: Colors.black,
                          ),
                          Text(item9),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isTextEmpty(item10) ? false : true,
                      child: Row(
                        children: [
                          Checkbox(
                            value: item10Available,
                            onChanged: onChanged_item10,
                            activeColor: Colors.black,
                          ),
                          Text(item10),
                        ],
                      ),
                    )
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
