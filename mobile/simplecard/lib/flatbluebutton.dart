import 'package:flutter/material.dart';

class FlatBlueButton extends StatelessWidget {
  FlatBlueButton({@required this.onPress, @required this.title});

  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        this.onPress();
      },
      child: Text(
        this.title,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}