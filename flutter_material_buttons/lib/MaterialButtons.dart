import 'package:flutter/material.dart';

class MaterialButtons extends StatelessWidget {
  void displayMessageWithAction(
      BuildContext context, String message, VoidCallback action) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            message,
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                //Navigator.of(context).pop();
                action();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Buttons'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => displayMessageWithAction(context,
                      'This is Text Button', () => Navigator.of(context).pop()),
                  child: Text('TextButton'),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () => displayMessageWithAction(
                    context,
                    'This is Outlined Button',
                    () => Navigator.of(context).pop(),
                  ),
                  child: Text('OutlinedButton'),
                  onLongPress: () => displayMessageWithAction(
                    context,
                    'You have pressed this button for too long',
                        () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => displayMessageWithAction(
                    context,
                    'This is Elevated Button',
                        () => Navigator.of(context).pop(),
                  ),
                  child: Text('ElevatedButton'),
                  onLongPress: () => displayMessageWithAction(
                    context,
                    'You have pressed this button for too long',
                        () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
