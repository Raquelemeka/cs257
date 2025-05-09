#!/usr/bin/env python3
'''
Harry Potter API Implementation
Adapted from flask_sample.py by Jeff Ondich

Complete database-driven version using PostgreSQL
'''

import sys
import argparse
import flask
import psycopg2
from flask import request, jsonify, Response
import config

# Import database configuration
try:
    from config import database, user, password
except ImportError:
    print("Error: Could not import database configuration from config.py")
    sys.exit(1)

app = flask.Flask(__name__)

def get_db_connection():
    try:
        connection = psycopg2.connect(
            database=database,
            user=user,
            password=password
        )
        return connection
    except psycopg2.Error as e:
        print(f"Error connecting to database: {e}")
        return None

@app.route('/')
def hello():
    return 'Welcome to the Harry Potter API'

@app.route('/characters')
def get_characters():
    '''
    Returns a list of Harry Potter characters with filtering options:
        house: filter by house name
        blood_status: filter by blood status
        species: filter by species
        name: filter by name containing string
        limit: limit number of results (default: 100)
    '''
    house = request.args.get('house', default='', type=str)
    blood_status = request.args.get('blood_status', default='', type=str)
    species = request.args.get('species', default='', type=str)
    name_filter = request.args.get('name', default='', type=str)
    limit = request.args.get('limit', default=100, type=int)

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor() as cursor:
            query = """
                SELECT c.id, c.name, h.name as house, bs.name as blood_status, 
                       sp.name as species, c.gender, c.birth_year, c.death_year,
                       w.wood, w.core, w.length
                FROM characters c
                LEFT JOIN houses h ON c.house_id = h.id
                LEFT JOIN blood_statuses bs ON c.blood_status_id = bs.id
                LEFT JOIN species sp ON c.species_id = sp.id
                LEFT JOIN wands w ON c.wand_id = w.id
                WHERE 1=1
            """
            params = []

            if house:
                query += " AND LOWER(h.name) LIKE LOWER(%s)"
                params.append(f"%{house}%")
            if blood_status:
                query += " AND LOWER(bs.name) LIKE LOWER(%s)"
                params.append(f"%{blood_status}%")
            if species:
                query += " AND LOWER(sp.name) LIKE LOWER(%s)"
                params.append(f"%{species}%")
            if name_filter:
                query += " AND LOWER(c.name) LIKE LOWER(%s)"
                params.append(f"%{name_filter}%")

            query += " ORDER BY c.name LIMIT %s"
            params.append(limit)

            cursor.execute(query, params)
            columns = [desc[0] for desc in cursor.description]
            characters = []
            for row in cursor.fetchall():
                character = dict(zip(columns, row))
                # Convert numeric values to proper types
                if character['birth_year'] is not None:
                    character['birth_year'] = int(character['birth_year'])
                if character['death_year'] is not None:
                    character['death_year'] = int(character['death_year'])
                if character['length'] is not None:
                    character['length'] = float(character['length'])
                characters.append(character)

        return jsonify(characters)

    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {e}'}), 500
    finally:
        conn.close()

@app.route('/spells')
def get_spells():
    '''
    Returns a list of spells with filtering options:
        name: filter by spell name or incantation
        type: filter by spell type
        effect: filter by spell effect
        light: filter by light color
    '''
    name_filter = request.args.get('name', default='', type=str)
    spell_type = request.args.get('type', default='', type=str)
    effect = request.args.get('effect', default='', type=str)
    light = request.args.get('light', default='', type=str)

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor() as cursor:
            query = """
                SELECT s.id, s.name, i.name as incantation, 
                       st.name as type, se.name as effect, 
                       s.light, it.name as incantation_type
                FROM spells s
                LEFT JOIN incantations i ON s.incantation_id = i.id
                LEFT JOIN spell_types st ON s.type_id = st.id
                LEFT JOIN spell_effects se ON s.effect_id = se.id
                LEFT JOIN incantation_types it ON i.type_id = it.id
                WHERE 1=1
            """
            params = []

            if name_filter:
                query += " AND (LOWER(s.name) LIKE LOWER(%s) OR LOWER(i.name) LIKE LOWER(%s))"
                params.extend([f"%{name_filter}%", f"%{name_filter}%"])
            if spell_type:
                query += " AND LOWER(st.name) LIKE LOWER(%s)"
                params.append(f"%{spell_type}%")
            if effect:
                query += " AND LOWER(se.name) LIKE LOWER(%s)"
                params.append(f"%{effect}%")
            if light:
                query += " AND LOWER(s.light) LIKE LOWER(%s)"
                params.append(f"%{light}%")

            query += " ORDER BY i.name"

            cursor.execute(query, params)
            columns = [desc[0] for desc in cursor.description]
            spells = [dict(zip(columns, row)) for row in cursor.fetchall()]

        return jsonify(spells)

    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {e}'}), 500
    finally:
        conn.close()

@app.route('/potions')
def get_potions():
    '''
    Returns a list of potions with filtering options:
        name: filter by potion name
        effect: filter by potion effect
        difficulty: filter by difficulty level
    '''
    name_filter = request.args.get('name', default='', type=str)
    effect = request.args.get('effect', default='', type=str)
    difficulty = request.args.get('difficulty', default='', type=str)

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor() as cursor:
            # Get potions
            query = """
                SELECT p.id, p.name, p.effect, p.difficulty, 
                       p.characteristics, p.side_effects
                FROM potions p
                WHERE 1=1
            """
            params = []

            if name_filter:
                query += " AND LOWER(p.name) LIKE LOWER(%s)"
                params.append(f"%{name_filter}%")
            if effect:
                query += " AND LOWER(p.effect) LIKE LOWER(%s)"
                params.append(f"%{effect}%")
            if difficulty:
                query += " AND LOWER(p.difficulty) LIKE LOWER(%s)"
                params.append(f"%{difficulty}%")

            query += " ORDER BY p.name"

            cursor.execute(query, params)
            columns = [desc[0] for desc in cursor.description]
            potions = [dict(zip(columns, row)) for row in cursor.fetchall()]

            # Get ingredients for each potion
            for potion in potions:
                cursor.execute("""
                    SELECT i.name 
                    FROM potions_ingredients pi
                    JOIN ingredients i ON pi.ingredient_id = i.id
                    WHERE pi.potion_id = %s
                """, (potion['id'],))
                potion['ingredients'] = [row[0] for row in cursor.fetchall()]

        return jsonify(potions)

    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {e}'}), 500
    finally:
        conn.close()

@app.route('/houses')
def get_houses():
    '''Returns a list of all houses'''
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT id, name, founder, animal, colors FROM houses ORDER BY name")
            columns = [desc[0] for desc in cursor.description]
            houses = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return jsonify(houses)
    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {e}'}), 500
    finally:
        conn.close()

@app.route('/help')
def get_help():
    help_text_o = '''
    <h1>Harry Potter API Documentation</h1>
    
    <h2>Available Endpoints:</h2>
    
    <h3>/characters</h3>
    <p>Returns character data with filters for house, blood status, species, and name.</p>
    
    <h3>/spells</h3>
    <p>Returns spell data with filters for name, type, effect, and light color.</p>
    
    <h3>/potions</h3>
    <p>Returns potion data with filters for name, effect, and difficulty.</p>
    
    <h3>/houses</h3>
    <p>Returns list of all houses.</p>
    '''
    help_text = '''\
    All responses are in JSON

    REQUEST: /
    RESPONSE:
    A greeting from this API to you.

    REQUEST: /help
    RESPONSE:
    This message.

    REQUEST: /characters[?house={HOUSE}&blood_status={STATUS}&species={SPECIES}&name={NAME}&limit={LIMIT}]
    RESPONSE:
    A list of characters matching the specified GET parameters.
    Each character is a JSON object with keys:
        - id, name, house, blood_status, species,
        - gender, birth_year, death_year,
        - wood, core, length

    REQUEST: /spells[?name={NAME}&type={TYPE}&effect={EFFECT}&light={LIGHT}]
    RESPONSE:
    A list of spells matching the specified GET parameters.
    Each spell is a JSON object with keys:
        - id, name, incantation, type, effect, light, incantation_type

    REQUEST: /potions[?name={NAME}&effect={EFFECT}&difficulty={LEVEL}]
    RESPONSE:
    A list of potions matching the specified GET parameters.
    Each potion is a JSON object with keys:
        - id, name, effect, difficulty, characteristics, ingredients

    REQUEST: /houses
    RESPONSE:
    A list of all houses.
    Each house is a JSON object with keys:
        - id, name, founder, animal, colors

    '''
    return Response(help_text, mimetype='text/plain')
    #return help_text

if __name__ == '__main__':
    parser = argparse.ArgumentParser('Harry Potter API')
    parser.add_argument('host', help='the host on which this application is running')
    parser.add_argument('port', type=int, help='the port on which this application is listening')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)