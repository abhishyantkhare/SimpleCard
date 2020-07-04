from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app)

@app.route('/card')
def card():
    return jsonify({'content': 'Hello from the backend!'})

@app.route('/new_card', methods=['POST'])
def new_card():
    card_json = request.get_json()
    print('card content: {}'.format(card_json['content']))
    return '', 200