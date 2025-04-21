#!/usr/bin/env python3
'''
    Adapted from flask_sample.py by Jeff Ondich
    Original structure and Flask implementation inspired by Jeff's work
    Additional functionality and modifications by Ngozi Raquel Emeka

    api.py - Harry Potter Character Query API
    DESCRIPTION: Provides API endpoints to query Harry Potter characters by house and/or gender
    '''
import sys
import argparse
import flask
import json
import csv

app = flask.Flask(__name__)

@app.route('/')
def hello():
    return 'Welcome to the Harry Potter Character Query API'

@app.route('/characters')
def get_characters():
    ''' Returns a list of Harry Potter characters that match GET parameters:
          house: filter characters by house (e.g. Gryffindor)
          gender: filter characters by gender (e.g. Female)
        If parameters are absent, returns all characters.
    '''
    house = flask.request.args.get('house')
    gender = flask.request.args.get('gender')
    
    csv_path = "../data/Characters.csv"
    characters = []
    
    try:
        with open(csv_path, newline='', encoding='utf-8-sig') as f:
            reader = csv.DictReader(f, delimiter=';', strict=True)
            
            for row in reader:
                house_match = (not house) or (row['House'].lower() == house.lower().strip())
                gender_match = (not gender) or (row['Gender'].lower() == gender.lower().strip())
                
                if house_match and gender_match:
                    character_data = {'name': row['Name']}
                    if house:
                        character_data['house'] = row['House']
                    if gender:
                        character_data['gender'] = row['Gender']
                    if not house and not gender:
                        character_data.update({
                            'house': row['House'],
                            'gender': row['Gender']
                        })
                    characters.append(character_data)
                    
    except FileNotFoundError:
        return json.dumps({'error': 'Data file not found'}), 404
    
    return json.dumps(characters)

@app.route('/help')
def get_help():
    help_text = '''
    <h1>Harry Potter Character Query API</h1>
    
    <h2>Available Endpoints:</h2>
    
    <h3>/characters</h3>
    <p>Returns a list of Harry Potter characters filtered by house and/or gender.</p>
    <p>Parameters:</p>
    <ul>
        <li><strong>house</strong>: Filter by house (e.g. Gryffindor, Slytherin)</li>
        <li><strong>gender</strong>: Filter by gender (e.g. Female, Male)</li>
    </ul>
    
    <h4>Examples:</h4>
    <ul>
        <li><a href="/characters?house=Hufflepuff">/characters?house=Hufflepuff</a> - All Hufflepuff characters</li>
        <li><a href="/characters?gender=Female">/characters?gender=Female</a> - All female characters</li>
        <li><a href="/characters?house=Slytherin&gender=Male">/characters?house=Slytherin&gender=Male</a> - All male Slytherin characters</li>
    </ul>
    '''
    return help_text

if __name__ == '__main__':
    parser = argparse.ArgumentParser('Harry Potter Character Query API')
    parser.add_argument('host', help='the host on which this application is running')
    parser.add_argument('port', type=int, help='the port on which this application is listening')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)