import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          child: Center(
            child: Text('Hello!'),
          ),
          width: 300,
          height: 100,
        ),
      ),
    );
  }
}
