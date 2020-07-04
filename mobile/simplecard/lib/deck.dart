import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'flashcard.dart';
import 'dart:convert';

class Deck {
  final List cards;

  Deck({this.cards});

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
        cards: json['cards']
            .map((cardJson) => FlashCard.fromJson(cardJson))
            .toList());
  }
}

class DeckWidget extends StatefulWidget {
  DeckWidget({@required this.currentCard});
  int currentCard;
  @override
  _DeckWidgetState createState() => _DeckWidgetState();
}

class _DeckWidgetState extends State<DeckWidget> {
  Future<Deck> futureDeck;
  var url = 'http://localhost:5000/deck';

  Future<Deck> fetchDeck() async {
    final response = await http.get(url);
    return Deck.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();
    futureDeck = fetchDeck();
  }

  @override
  Widget build(BuildContext context) {
    var currentCard = widget.currentCard;
    return Container(
      child: Card(
        child: Center(
          child: FutureBuilder<Deck>(
            future: futureDeck,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List cards = snapshot.data.cards;
                FlashCard card = cards[currentCard % cards.length];
                return Text(card.content);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
      width: 300,
      height: 150,
    );
  }
}
