#!/usr/bin/env python3
'''
api.py
Rui and Raquel
9 Jun, 2025
Harry Potter API Implementation
Adapted from flask_sample.py and psycopg2-sample.py by Jeff Ondich
'''

import sys
import argparse
import flask
import psycopg2
from flask import request, jsonify, Response
import config

api = flask.Blueprint('api', __name__)

# Import database configuration
try:
    from config import database, user, password
except ImportError:
    print("Error: Could not import database configuration from config.py")
    sys.exit(1)

#get connection with database
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

#return a message to the user when they request nothing
@api.route('/')
def hello():
    return 'Welcome to the Harry Potter API'


@api.route('/characters')
def get_characters():
    '''
    Returns a list of Harry Potter characters with filtering options:
        house: filter by house name
        blood_status: filter by blood status
        species: filter by species
        name: filter by name containing string
        limit: limit number of results (default: 100)
    '''

    house_filter = request.args.get('house', default='', type=str)
    gender_filter  = request.args.get('gender',    default='', type=str)  
    blood_status_filter = request.args.get('blood_status', default='', type=str)
    species_filter = request.args.get('species', default='', type=str)
    name_filter = request.args.get('name', default='', type=str)
    limit_filter = request.args.get('limit', default=100, type=int)

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor() as cursor:
            query = """
                SELECT
                    c.id,
                    c.name,
                    h.name   AS house,
                    bs.status AS blood_status,
                    sp.name  AS species,
                    c.gender,
                    w.description AS wand,      -- include wand description
                    c.patronus,
                    c.hair_color
                FROM characters c
                LEFT JOIN houses h  ON c.house_id = h.id
                LEFT JOIN blood_statuses bs ON c.blood_status_id = bs.id
                LEFT JOIN species sp ON c.species_id = sp.id
                LEFT JOIN public.wands w ON c.wand_id = w.wand_id
                WHERE 1=1
            """
            params = []
            # modify query and params according to the filter needed
            if house_filter:
                query += " AND LOWER(h.name) LIKE LOWER(%s)"
                params.append(f"%{house_filter}%")
            if blood_status_filter:
                query += " AND LOWER(bs.status) LIKE LOWER(%s)"
                params.append(f"%{blood_status_filter}%")
            if gender_filter:                
                query += " AND LOWER(c.gender) LIKE LOWER(%s)"
                params.append(f"%{gender_filter}%")
            if species_filter:
                query += " AND LOWER(sp.name) LIKE LOWER(%s)"
                params.append(f"%{species_filter}%")
            if name_filter:
                query += " AND LOWER(c.name) LIKE LOWER(%s)"
                params.append(f"%{name_filter}%")
            query += " ORDER BY c.name LIMIT %s"
            params.append(limit_filter)

            #get all the matched characters
            cursor.execute(query, params)
            columns = [desc[0] for desc in cursor.description]
            characters = []
            for row in cursor.fetchall():
                character = dict(zip(columns, row))
                characters.append(character)

        return jsonify(characters)

    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {e}'}), 500
    finally:
        conn.close()

@api.route('/spells')
def get_spells():
    '''
    Returns a list of spells with filtering options:
        name: filter by spell name or incantation
        type: filter by spell type
        effect: filter by spell effect
        light: filter by light color
    '''
    name_filter = request.args.get('name', default='', type=str)
    spell_type_filter = request.args.get('type', default='', type=str)
    effect_filter = request.args.get('effect', default='', type=str)
    light_filter = request.args.get('light', default='', type=str)

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor() as cursor:
            query = """
                SELECT
                    s.id,
                    s.name,
                    i.name  AS incantation,
                    st.name AS type,
                    se.name AS effect,
                    s.light
                FROM spells s
                LEFT JOIN incantations i ON s.incantation_id = i.id
                LEFT JOIN spell_types st ON s.type_id= st.id
                LEFT JOIN spell_effects se ON s.effect_id = se.id
                WHERE 1=1
            """
            params = []
            # modify query and params according to the filter needed
            if name_filter:
                query += " AND (LOWER(s.name) LIKE LOWER(%s) OR LOWER(i.name) LIKE LOWER(%s))"
                params.extend([f"%{name_filter}%", f"%{name_filter}%"])
            if spell_type_filter:
                query += " AND LOWER(st.name) LIKE LOWER(%s)"
                params.append(f"%{spell_type_filter}%")
            if effect_filter:
                query += " AND LOWER(se.name) LIKE LOWER(%s)"
                params.append(f"%{effect_filter}%")
            if light_filter:
                query += " AND LOWER(s.light) LIKE LOWER(%s)"
                params.append(f"%{light_filter}%")
            query += " ORDER BY s.name"

            #get all the matched spells
            cursor.execute(query, params)
            columns = [desc[0] for desc in cursor.description]
            spells = [dict(zip(columns, row)) for row in cursor.fetchall()]

        return jsonify(spells)

    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {e}'}), 500
    finally:
        conn.close()

@api.route('/potions')
def get_potions():
    '''
    Returns a list of potions with filtering options:
        name: filter by potion name
        effect: filter by potion effect
        difficulty: filter by difficulty level
    '''
    name_filter = request.args.get('name', default='', type=str)
    effect_filter = request.args.get('effect', default='', type=str)
    difficulty_filter = request.args.get('difficulty', default='', type=str)

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor() as cursor:
            query = """
                SELECT p.id, p.name, p.effect, p.difficulty_level, 
                       p.characteristics
                FROM potions p
                WHERE 1=1
            """
            params = []
            # modify query and params according to the filter needed
            if name_filter:
                query += " AND LOWER(p.name) LIKE LOWER(%s)"
                params.append(f"%{name_filter}%")
            if effect_filter:
                query += " AND LOWER(p.effect) LIKE LOWER(%s)"
                params.append(f"%{effect_filter}%")
            if difficulty_filter:
                query += " AND LOWER(p.difficulty_level) LIKE LOWER(%s)"
                params.append(f"%{difficulty_filter}%") 
            query += " ORDER BY p.name"

             #get all the matched potions
            cursor.execute(query, params)
            potions = []
            for row in cursor.fetchall():
                id_, name, effect, difficulty_level, characteristics = row

                cursor.execute("""
                    SELECT i.name 
                    FROM potions_ingredients pi
                    JOIN ingredients i ON pi.ingredient_id = i.id
                WHERE pi.potion_id = %s
                """, (id_,))
                ingredients = [r[0] for r in cursor.fetchall()]
                potions.append({
                'name': name,             
                'id': id_,
                'effect': effect,
                'difficulty_level': difficulty_level,
                'ingredients' : ingredients,
                'characteristics': characteristics  
                })
            return jsonify(potions)

    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {e}'}), 500
    finally:
        conn.close()

#return a help message to the user
@api.route('/help')
def get_help():
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
        - blood_status, gender, hair_color, house, id, name, patronous, species, wand
    Example:
        request: localhost:5122/characters?species=human&blood_status=Pure-blood&limit=3&house=Slytherin&name=Malfoy
        response:[
                    {
                        "blood_status": "Pure-blood",
                        "gender": "Male",
                        "hair_color": "White-blond",
                        "house": "Slytherin",
                        "id": 47,
                        "name": "Draco Malfoy",
                        "patronus": "Unknown",
                        "species": "Human",
                        "wand": "10\" Hawthorn unicorn hair"
                    },
                    {
                        "blood_status": "Pure-blood",
                        "gender": "Male",
                        "hair_color": "White-blond",
                        "house": "Slytherin",
                        "id": 53,
                        "name": "Lucius Malfoy",
                        "patronus": "Unknown",
                        "species": "Human",
                        "wand": "Elm and dragon heartstring"
                    },
                    {
                        "blood_status": "Pure-blood",
                        "gender": "Female",
                        "hair_color": "Blonde",
                        "house": "Slytherin",
                        "id": 54,
                        "name": "Narcissa Malfoy",
                        "patronus": "Unknown",
                        "species": "Human",
                        "wand": "Unknown"
                    }
                    ]

    REQUEST: /spells[?name={NAME}&type={TYPE}&effect={EFFECT}&light={LIGHT}]
    RESPONSE:
    A list of spells matching the specified GET parameters.
    Each spell is a JSON object with keys:
        - effect, id, incantation, light, name, type
    Example:
        request:localhost:5122/spells?effect=force
        response:[
                    {
                        "effect": "Great Force",
                        "id": 5,
                        "incantation": "Unknown",
                        "light": "None",
                        "name": "Albus Dumbledore's Forceful Spell",
                        "type": "Spell"
                    },
                    {
                        "effect": "Forces target to let go",
                        "id": 228,
                        "incantation": "Relashio",
                        "light": "Purple",
                        "name": "Revulsion Jinx",
                        "type": "Jinx"
                    },
                    {
                        "effect": "Reflects spells and blocks physical forces",
                        "id": 214,
                        "incantation": "Protego",
                        "light": "Invisible on its own, reflects light of spell",
                        "name": "Shield Charm",
                        "type": "Charm"
                    }
                    ]

    REQUEST: /potions[?name={NAME}&effect={EFFECT}&difficulty={LEVEL}]
    RESPONSE:
    A list of potions matching the specified GET parameters.
    Each potion is a JSON object with keys:
        - characteristics, difficulty_level, effect, id, ingredients, name
    Example: 
        request:localhost:5122/potions?effect=induce&difficulty=advanced
        response:[
                    {
                        "characteristics": "Sunshine yellow in colour, Sweet, Aromatic, Emits rainbow when finished",
                        "difficulty_level": "Advanced",
                        "effect": "Induces happiness",
                        "id": 31,
                        "ingredients": [
                        "Shrivelfig",
                        "Porcupine quills",
                        "Peppermint sprigs",
                        "Sopophorous beans",
                        "Wormwood"
                        ],
                        "name": "Elixir to Induce Euphoria"
                    }
                    ]
    
    '''
    return Response(help_text, mimetype='text/plain')

