from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/card')
def card():
    return jsonify({'content': 'Hello from the backend!'})