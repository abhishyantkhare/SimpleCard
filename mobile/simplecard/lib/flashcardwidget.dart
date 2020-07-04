import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simplecard/deck.dart';
import 'package:simplecard/flatbluebutton.dart';

class FlashCardWidget extends StatefulWidget {
  @override
  _FlashCardWidgetState createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {
  Future<Deck> futureDeck;
  var url = 'http://localhost:5000/deck';
  int currentCard;

  Future<Deck> fetchDeck() async {
    final response = await http.get(url);
    return Deck.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();
    futureDeck = fetchDeck();
    currentCard = 0;
  }

  void incrementCurrentCard() {
    setState(() {
      currentCard++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DeckWidget(currentCard: this.currentCard),
            FlatBlueButton(
              onPress: this.incrementCurrentCard,
              title: "Next Card",
            )
          ]),
    );
  }
}
