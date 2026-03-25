# Harry Potter Data Exploration Website (CS257)
This repository contains homework for CS257 at Carleton College (Spring 2025).

A Flask-based web application for exploring characters, spells, and potions from the Harry Potter universe. Users can search, filter, and view detailed information about their favorite magical elements.

## Features

- **Character Search**: Look up characters by name with autocomplete, view detailed attributes including house, blood status, wand, and patronus
- **Spell Filtering**: Filter spells by type (charm, curse, jinx, etc.) or effect, with detailed incantation information
- **Potion Browsing**: Browse potions with ingredients, effects, and difficulty levels
- **Responsive Design**: Magic-themed interface with wand cursor and immersive backgrounds

## Data Sources

The application uses datasets from Kaggle, including:
- Characters.csv – Character information (name, house, blood status, wand, patronus, etc.)
- Spells.csv – Spell data (incantation, type, effect, etc.)
- Potions.csv – Potion information (ingredients, effects, difficulty, etc.)

## To run the Web App

### 1. Navigate to the web app folder
```bash
cd webapp

### 2. Install  dependencies (You need these to run the webapp)
```bash
pip3 install flask pandas

### 3. Start the application
```bash
python3 app.py

### 4. Open/View in your browser
```bash
Navigate to: http://localhost:5000
