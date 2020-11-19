import 'package:flutter/material.dart';
/// For this code to work, make sure you are on beta channel, as ScaffoldMessenger is not available on stable channel yet (as of 19/11/2020).
void main() {
  runApp(new MaterialApp(
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => HomePage(),
      '/second': (BuildContext context) => SecondPage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
          await Future.delayed(Duration(seconds: 5));
          ScaffoldFeatureController controller = scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Snack-tastic')),
          );
          final result = await controller.closed;
          print(result);
        },
        child: const Text('GO!'),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container()),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text.rich(
                TextSpan(
                    children:[
                      TextSpan(text: 'Pressing GO initiates\n'),
                      TextSpan(
                        text: 'ScaffoldMessenger.showSnackBar\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'after a 5 second delay.'),
                    ]
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(height: 100),
          RaisedButton(
            child: Text('push Page 2'),
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
          ),
          Container(height: 50),
          RaisedButton(
            child: Text('popAndPush Page 2'),
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/second');
            },
          ),
          Container(height: 50),
          RaisedButton(
            child: Text('pushReplacement Page 2'),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/second');
            },
          ),
          Expanded(child: Container(), flex: 2),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool canPop = ModalRoute.of(context)?.canPop ?? false;
    return Scaffold(
        appBar: AppBar(title: Text('Second')),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Second Page'),
            if (!canPop) RaisedButton(
              child: Text('Start Over'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ))
    );
  }
}
