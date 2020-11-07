import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isHindi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Internationalization'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                isHindi ? 'icons/flags/png/in.png' : 'icons/flags/png/us.png',
                package: 'country_icons',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'message',
                style: TextStyle(
                  fontSize: 18,
                ),
              ).tr(args: ['Flutter']),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Switch to Hindi?'),
                  Switch(
                    value: isHindi,
                    onChanged: (value) {
                      setState(() {
                        this.setState(() {
                          if (value) {
                            context.locale = Locale('hi', 'IN');
                          } else {
                            context.locale = Locale('en', 'US');
                          }
                        });
                        isHindi = value;
                      });
                    },
                    activeTrackColor: Colors.redAccent,
                    activeColor: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
