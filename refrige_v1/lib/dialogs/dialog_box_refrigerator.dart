import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../my_button.dart';

class DialogBoxRefrigerator extends StatefulWidget {
  final controller1;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBoxRefrigerator({
    super.key,
    required this.controller1,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBoxRefrigerator> createState() => _DialogBoxRefrigeratorState();
}

class _DialogBoxRefrigeratorState extends State<DialogBoxRefrigerator> {
  //reference Hive DataSaver
  final _dataSaver = Hive.box('dateSaver2');

  //write data
  void writeData(String text) {
    _dataSaver.put("TEXT", text);
  }

  //create datetime variable
  DateTime _dateTime = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  //show date picker method
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _dateTime = value!;
        writeData(formatter.format(_dateTime).toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 156, 152, 152),
      content: Container(
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.controller1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new item',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  formatter.format(_dateTime).toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                MaterialButton(
                  onPressed: _showDatePicker,
                  color: Colors.grey[600],
                  child: const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //buttons -> save + canel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save button
                MyButton(text: 'Save', onPressed: widget.onSave),

                const SizedBox(
                  width: 8,
                ),

                //cancel button
                MyButton(text: 'Cancel', onPressed: widget.onCancel),
                //cancel button
              ],
            )
          ],
        ),
      ),
    );
  }
}
