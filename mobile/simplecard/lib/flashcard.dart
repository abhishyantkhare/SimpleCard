class FlashCard {
  final String content;

  FlashCard({this.content});

  factory FlashCard.fromJson(Map<String, dynamic> json) {
    return FlashCard(content: json['content']);
  }
}