from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/card')
def card():
    return jsonify({'content': 'Hello from the backend!'})


@app.route('/new_card')
def new_card():
    card_json = request.json
    print('card content: {}'.format(card_json['content']))
    return '', 200