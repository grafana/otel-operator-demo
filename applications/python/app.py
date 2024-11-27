from random import randint
from flask import Flask, request
import logging

app = Flask(__name__)

@app.route("/rolldice")
def roll_dice():
    player = request.args.get('player', default=None, type=str)
    result = str(roll())
    if player:
        print("%s is rolling the dice: %s" % (player, result))
    else:
        print("Anonymous player is rolling the dice: %s" % (result))
    return result


def roll():
    return randint(1, 6)
