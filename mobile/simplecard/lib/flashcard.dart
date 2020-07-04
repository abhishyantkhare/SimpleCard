import 'package:flutter/material.dart';

class FlashCard {
  final String front;
  final String back;

  FlashCard({this.front, this.back});

  factory FlashCard.fromJson(Map<String, dynamic> json) {
    return FlashCard(front: json['front'], back: json['back']);
  }
}

class FlashCardWidget extends StatefulWidget {
  FlashCardWidget({@required this.flashcard, @required this.showBack});
  FlashCard flashcard;
  bool showBack;
  @override
  _FlashCardWidgetState createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {
  @override
  Widget build(BuildContext context) {
    var flashcard = widget.flashcard;
    var flashcardText = flashcard.front;
    if (widget.showBack) {
      flashcardText = flashcard.back;
    }
    return Container(
        child: Card(
          child: Center(child: Text(flashcardText)),
        ),
        width: 300,
        height: 150);
  }
}
