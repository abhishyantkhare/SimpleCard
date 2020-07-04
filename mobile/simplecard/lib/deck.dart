import 'flashcard.dart';

class Deck {
  final List cards;

  Deck({this.cards});

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(cards: json['cards'].map((cardJson) => FlashCard.fromJson(cardJson)).toList());
  }
}
