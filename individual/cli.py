"""
NAME: cli.py - Harry Potter Character Query
MY NAME: Ngozi Raquel Emeka
DESCRIPTION: Shows a list of all the students of a specified gender and/or house.

EXAMPLES:
  python3 cli.py --house Hufflepuff
  python3 cli.py --gender Female
  python3 cli.py --house Slytherin --gender Male
  python3 cli.py -H Hufflepuff
  python3 cli.py -G Female
  python3 cli.py -H Slytherin -G Male
"""

import argparse
import csv

def main():
    parser = argparse.ArgumentParser(description='Query Harry Potter characters.', add_help=False)
    parser.add_argument('--house', '-H', help='Filter by house (e.g. Gryffindor)')
    parser.add_argument('--gender', '-G', help='Filter by gender (e.g. Female)')
    parser.add_argument('--help', '-h', action='help', help='Show this help message')
    args = parser.parse_args()

    if not args.house and not args.gender:
        parser.print_help()
        return

    csv_path = "../data/Characters.csv"
    with open(csv_path, newline='', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';', strict=True) # the csv uses ;
        
        # header
        if args.house and args.gender:
            print(f"\n{args.gender}s in {args.house}:")
        elif args.house:
            print(f"\nAll characters in {args.house}:")
        elif args.gender:
            print(f"\nAll {args.gender}s:")
        
        
        matches = 0
        for row in reader:
            house_match = (not args.house) or (row['House'].lower() == args.house.lower().strip())
            gender_match = (not args.gender) or (row['Gender'].lower() == args.gender.lower().strip())
            
            if house_match and gender_match:
                print(f"- {row['Name']}")
                matches += 1
        
        print(f"\nFound {matches}.")

if __name__ == "__main__":
    main()