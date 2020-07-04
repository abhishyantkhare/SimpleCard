import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simplecard/deck.dart';
import 'package:simplecard/flatbluebutton.dart';

class DeckDisplay extends StatefulWidget {
  @override
  _DeckDisplayState createState() => _DeckDisplayState();
}

class _DeckDisplayState extends State<DeckDisplay> {
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
