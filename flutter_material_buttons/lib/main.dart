import 'package:flutter/material.dart';
import 'package:flutter_material_buttons/MaterialButtons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material buttons',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.green,
            textStyle: TextStyle(
              fontSize: 20
            )
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: Colors.red,
              textStyle: TextStyle(
                  fontSize: 20
              )
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              textStyle: TextStyle(
                  fontSize: 20
              )
          ),
        ),
      ),
      home: MaterialButtons(),
    );
  }
}
