import 'package:flutter/material.dart';
import 'flashcardwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlashCards!',
        home: Scaffold(
          appBar: AppBar(
            title: Text('FlashCards!'),
          ),
          body: Center(
            child: FlashCardWidget(),
          ),
        ));
  }
}
