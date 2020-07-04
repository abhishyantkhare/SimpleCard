from flask import Flask, jsonify, request
from flask_cors import CORS
from flashcard import FlashCard
from deck import Deck

app = Flask(__name__)
cors = CORS(app)

CurrentDeck = Deck()


@app.route('/deck')
def deck():
    return jsonify(CurrentDeck.to_dict())


@app.route('/new_card', methods=['POST'])
def new_card():
    card_json = request.get_json()
    front = card_json['front']
    back = card_json['back']
    card = FlashCard(front=front, back=back)
    CurrentDeck.add_card(card)
    return '', 200
