class Deck:
    
    def __init__(self, cards=[]):
        self._cards = []

    def get_cards(self):
        return self._cards
    
    def add_card(self, _card):
        self._cards.append(_card)

    def to_dict(self):
        return {'cards': [card.to_dict() for card in self._cards]}