'''
    app.py
    Rui, Raquel
    20 May, 2025
    based on books_webapp.py by Jeff Ondich
'''
import flask
import argparse
import api
from flask import render_template, request

app = flask.Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(api.api, url_prefix='/api')

@app.route('/') 
def home():
    return flask.render_template('homepage.html')

@app.route('/character')
def character_detail():
    return render_template('character_detail.html')

@app.route('/potion')
def potion_detail():
    return render_template('potion_detail.html')

@app.route('/spell')
def spell_detail():
    return render_template('spell_detail.html')

@app.route('/filterpage')
def filterpage():
    return render_template('filterpage.html')

@app.route('/help')
def help():
    return render_template('help.html')

if __name__ == '__main__':
    parser = argparse.ArgumentParser('A books-and-authors application, including API & DB')
    parser.add_argument('host', help='the host to run on')
    parser.add_argument('port', type=int, help='the port to listen on')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)
