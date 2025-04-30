#!/usr/bin/env python3
'''
    convert.py
    Rui Shen and Raquel Emeka, 29 April 2025
    Converts Characters.csv, Potions.csv, and Spells.csv into normalized CSVs.
'''

import csv

def get_id(value, dictionary):
    if not value:
        return None
    if value not in dictionary:
        dictionary[value] = len(dictionary) + 1
    return dictionary[value]

def process_characters(filename):
    houses, wands, species, blood_statuses = {}, {}, {}, {}
    characters = []
    character_houses = []

    with open(filename, newline='', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for i, row in enumerate(reader):
            name = row.get('Name', '').strip()
            gender = row.get('Gender', '').strip()
            job = row.get('Job', '').strip()
            house = row.get('House', '').strip()
            wand = row.get('Wand', '').strip()
            patronus = row.get('Patronus', '').strip()
            species_val = row.get('Species', '').strip()
            blood = row.get('Blood status', '').strip()
            hair = row.get('Hair colour', '').strip()

            house_id = get_id(house, houses)
            wand_id = get_id(wand, wands)
            species_id = get_id(species_val, species)
            blood_id = get_id(blood, blood_statuses)

            character_id = i + 1
            characters.append([
                character_id, name, gender, job,
                house_id, wand_id, patronus,
                species_id, blood_id, hair
            ])

            if house_id:
                character_houses.append([character_id, house_id])

    return characters, houses, wands, species, blood_statuses, character_houses

def process_potions(filename):
    potions = []
    ingredients = {}
    potions_ingredients = []

    with open(filename, newline='', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for i, row in enumerate(reader):
            name = row.get('Name', '').strip()
            known_ingredients = row.get('Known ingredients', '').strip()
            effect = row.get('Effect', '').strip()
            characteristics = row.get('Characteristics', '').strip()
            difficulty = row.get('Difficulty level', '').strip()

            potion_id = i + 1
            potions.append([potion_id, name, effect, characteristics, difficulty])

            if known_ingredients:
                for ing in [i.strip() for i in known_ingredients.split(',')]:
                    if ing:
                        ing_id = get_id(ing, ingredients)
                        potions_ingredients.append([potion_id, ing_id])

    return potions, ingredients, potions_ingredients

def process_spells(filename):
    spells = []
    incantations = {}
    types = {}
    effects = {}
    incantation_types = []

    with open(filename, newline='', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for i, row in enumerate(reader):
            name = row.get('Name', '').strip()
            incantation = row.get('Incantation', '').strip()
            type_ = row.get('Type', '').strip()
            effect = row.get('Effect', '').strip()
            light = row.get('Light', '').strip()

            incantation_id = get_id(incantation, incantations)
            type_id = get_id(type_, types)
            effect_id = get_id(effect, effects)

            spell_id = i + 1
            spells.append([spell_id, name, incantation_id, type_id, effect_id, light])

            if incantation_id and type_id:
                incantation_types.append([incantation_id, type_id])

    return spells, incantations, types, effects, incantation_types

def write_lookup_csv(filename, dictionary):
    with open(filename, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['id', 'name'])
        for value, id in sorted(dictionary.items(), key=lambda x: x[1]):
            writer.writerow([id, value])

def write_csv(filename, rows, headers=None):
    with open(filename, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        if headers:
            writer.writerow(headers)
        for row in rows:
            writer.writerow(row)

def main():
    # Process Characters
    characters, houses, wands, species, blood_statuses, character_houses = process_characters('Characters.csv')
    
    write_lookup_csv('houses.csv', houses)
    write_lookup_csv('wands.csv', wands)
    write_lookup_csv('species.csv', species)
    write_lookup_csv('blood_statuses.csv', blood_statuses)

    write_csv('characters.csv', characters,
             ['id', 'name', 'gender', 'job', 'house_id', 'wand_id', 
              'patronus', 'species_id', 'blood_status_id', 'hair_color'])
    write_csv('characters_houses.csv', character_houses,
             ['character_id', 'house_id'])

    # Process Potions
    potions, ingredients, potions_ingredients = process_potions('Potions.csv')
    write_csv('potions.csv', potions,
             ['id', 'name', 'effect', 'characteristics', 'difficulty_level'])
    write_lookup_csv('ingredients.csv', ingredients)
    write_csv('potions_ingredients.csv', potions_ingredients,
             ['potion_id', 'ingredient_id'])

    # Process Spells
    spells, incantations, types, effects, incantation_types = process_spells('Spells.csv')
    write_csv('spells.csv', spells,
             ['id', 'name', 'incantation_id', 'type_id', 'effect_id', 'light'])
    write_lookup_csv('incantations.csv', incantations)
    write_lookup_csv('spell_types.csv', types)
    write_lookup_csv('spell_effects.csv', effects)
    write_csv('incantation_types.csv', incantation_types,
             ['incantation_id', 'type_id'])

if __name__ == '__main__':
    main()
