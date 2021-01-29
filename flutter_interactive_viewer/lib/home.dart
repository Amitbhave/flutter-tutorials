import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  void _handleInteractionStart() {
    print('Interaction started..');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Interactive Viewer'
        ),
      ),
      body: SafeArea(
        child: Center(
          child: InteractiveViewer(
            child: Image.asset('assets/tesla.jpg'),
            boundaryMargin: EdgeInsets.all(20),
            onInteractionStart: (_) => _handleInteractionStart,
            maxScale: 5,
            minScale: 0.5,
          ),
        ),
      ),
    );
  }

}