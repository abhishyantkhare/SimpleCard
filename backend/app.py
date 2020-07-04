from flask import Flask, jsonify, request
from flask_cors import CORS
from flashcard import FlashCard

app = Flask(__name__)
cors = CORS(app)

CurrentCard = FlashCard()

@app.route('/card')
def card():
    return jsonify({'content': CurrentCard.getContent()})

@app.route('/new_card', methods=['POST'])
def new_card():
    card_json = request.get_json()
    print('old content: {}'.format(CurrentCard.getContent()))
    CurrentCard.setContent(card_json['content'])
    print('new content: {}'.format(CurrentCard.getContent()))
    return '', 200