#!/usr/bin/env python3
'''
Harry Potter API Implementation
Adapted from flask_sample.py by Jeff Ondich

Original structure and Flask implementation inspired by Jeff's work
Additional functionality and modifications by Ngozi Raquel Emeka and Rui Shen

api.py - Harry Potter API
DESCRIPTION: Provides API endpoints to query Harry Potter characters and spells
'''

import sys
import argparse
import flask
import json
import csv
from flask import request, jsonify

app = flask.Flask(__name__)

# Helper function for case-insensitive string comparison
def case_insensitive_contains(full_string, substring):
    return substring.lower() in full_string.lower()

@app.route('/')
def hello():
    return 'Welcome to the Harry Potter API'

@app.route('/characters')
def get_characters():
    '''
    Returns a list of Harry Potter characters that match GET parameters:
        house: filter characters by house (e.g. Gryffindor)
        gender: filter characters by gender (e.g. Female)
        name: filter characters by name containing string (e.g. Potter)
        number: limit number of results (default: 150)
    Returns: JSON list of character names sorted alphabetically
    '''
    # Get all parameters with defaults
    house = request.args.get('house', default='', type=str)
    gender = request.args.get('gender', default='', type=str)
    name_filter = request.args.get('name', default='', type=str)
    limit = request.args.get('number', default=150, type=int)
    
    csv_path = "../data/Characters.csv"
    characters = []
    
    try:
        with open(csv_path, newline='', encoding='utf-8-sig') as f:
            reader = csv.DictReader(f, delimiter=';', strict=True)
            
            for row in reader:
                # Apply all filters
                house_match = (not house) or case_insensitive_contains(row['House'], house)
                gender_match = (not gender) or case_insensitive_contains(row['Gender'], gender)
                name_match = (not name_filter) or case_insensitive_contains(row['Name'], name_filter)
                
                if house_match and gender_match and name_match:
                    characters.append(row['Name'])
                    
        # Sort alphabetically by first name
        characters.sort(key=lambda x: x.split()[0])
        
        # Apply limit
        characters = characters[:limit]
        
    except FileNotFoundError:
        return jsonify({'error': 'Characters data file not found'}), 404
    
    return jsonify(characters)

@app.route('/spells')
def get_spells():
    '''
    Returns a list of Harry Potter spells that match GET parameters:
        name: filter by spell name or incantation containing string
        type: filter by spell type (e.g. charm, hex)
    Returns: JSON list of spell dictionaries sorted by incantation
    '''
    name_filter = request.args.get('name', default='', type=str)
    spell_type = request.args.get('type', default='', type=str)
    
    csv_path = "../data/Spells.csv"
    spells = []
    
    try:
        with open(csv_path, newline='', encoding='utf-8-sig') as f:
            reader = csv.DictReader(f, delimiter=';', strict=True)
            
            for row in reader:
                # Apply all filters
                name_match = (not name_filter) or (
                    case_insensitive_contains(row['Name'], name_filter) or 
                    case_insensitive_contains(row['Incantation'], name_filter)
                )
                type_match = (not spell_type) or case_insensitive_contains(row['Type'], spell_type)
                
                if name_match and type_match:
                    spells.append({
                        'name': row['Name'],
                        'incantation': row['Incantation'],
                        'type': row['Type'],
                        'effect': row['Effect']
                    })
        
        # Sort alphabetically by incantation
        spells.sort(key=lambda x: x['incantation'])
        
    except FileNotFoundError:
        return jsonify({'error': 'Spells data file not found'}), 404
    
    return jsonify(spells)

@app.route('/help')
def get_help():
    help_text = '''
    <h1>Harry Potter API Documentation</h1>
    
    <h2>Available Endpoints:</h2>
    
    <h3>/help</h3>
    <p>Returns this documentation page.</p>
    
    <h3>/characters</h3>
    <p>Returns a list of Harry Potter characters.</p>
    <p>Parameters:</p>
    <ul>
        <li><strong>house</strong>: Filter by house (e.g. Gryffindor)</li>
        <li><strong>gender</strong>: Filter by gender (e.g. Female)</li>
        <li><strong>name</strong>: Filter by name containing string (e.g. Potter)</li>
        <li><strong>number</strong>: Limit number of results (default: 150)</li>
    </ul>
    <p>Returns: JSON list of character names sorted alphabetically</p>
    
    <h4>Examples:</h4>
    <ul>
        <li><a href="/characters?house=Gryffindor">/characters?house=Gryffindor</a></li>
        <li><a href="/characters?gender=Female&name=Lily">/characters?gender=Female&name=Lily</a></li>
    </ul>
    
    <h3>/spells</h3>
    <p>Returns a list of Harry Potter spells.</p>
    <p>Parameters:</p>
    <ul>
        <li><strong>name</strong>: Filter by spell name or incantation</li>
        <li><strong>type</strong>: Filter by spell type (e.g. charm, hex)</li>
    </ul>
    <p>Returns: JSON list of spell dictionaries sorted by incantation</p>
    
    <h4>Examples:</h4>
    <ul>
        <li><a href="/spells?name=accio">/spells?name=accio</a></li>
        <li><a href="/spells?type=hex">/spells?type=hex</a></li>
    </ul>
    '''
    return help_text

if __name__ == '__main__':
    parser = argparse.ArgumentParser('Harry Potter API')
    parser.add_argument('host', help='the host on which this application is running')
    parser.add_argument('port', type=int, help='the port on which this application is listening')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)