class FlashCard {
  final String front;
  final String back;

  FlashCard({this.front, this.back});

  factory FlashCard.fromJson(Map<String, dynamic> json) {
    return FlashCard(front: json['front'], back: json['back']);
  }
}
