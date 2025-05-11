--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20
-- Dumped by pg_dump version 13.20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.potions_ingredients DROP CONSTRAINT potions_ingredients_potion_id_fkey;
ALTER TABLE ONLY public.potions_ingredients DROP CONSTRAINT potions_ingredients_ingredient_id_fkey;
ALTER TABLE ONLY public.incantation_types DROP CONSTRAINT incantation_types_type_id_fkey;
ALTER TABLE ONLY public.incantation_types DROP CONSTRAINT incantation_types_incantation_id_fkey;
ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_species_id_fkey;
ALTER TABLE ONLY public.characters_houses DROP CONSTRAINT characters_houses_house_id_fkey;
ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_house_id_fkey;
ALTER TABLE ONLY public.wands DROP CONSTRAINT wands_pkey;
ALTER TABLE ONLY public.wands DROP CONSTRAINT wands_description_key;
ALTER TABLE ONLY public.spells DROP CONSTRAINT spells_pkey;
ALTER TABLE ONLY public.spell_types DROP CONSTRAINT spell_types_pkey;
ALTER TABLE ONLY public.spell_types DROP CONSTRAINT spell_types_name_key;
ALTER TABLE ONLY public.spell_effects DROP CONSTRAINT spell_effects_pkey;
ALTER TABLE ONLY public.spell_effects DROP CONSTRAINT spell_effects_name_key;
ALTER TABLE ONLY public.species DROP CONSTRAINT species_pkey;
ALTER TABLE ONLY public.species DROP CONSTRAINT species_name_key;
ALTER TABLE ONLY public.potions DROP CONSTRAINT potions_pkey;
ALTER TABLE ONLY public.potions_ingredients DROP CONSTRAINT potions_ingredients_pkey;
ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_pkey;
ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_name_key;
ALTER TABLE ONLY public.incantations DROP CONSTRAINT incantations_pkey;
ALTER TABLE ONLY public.incantations DROP CONSTRAINT incantations_name_key;
ALTER TABLE ONLY public.incantation_types DROP CONSTRAINT incantation_types_pkey;
ALTER TABLE ONLY public.houses DROP CONSTRAINT houses_pkey;
ALTER TABLE ONLY public.houses DROP CONSTRAINT houses_name_key;
ALTER TABLE ONLY public.effects DROP CONSTRAINT effects_pkey;
ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_pkey;
ALTER TABLE ONLY public.blood_statuses DROP CONSTRAINT blood_statuses_status_key;
ALTER TABLE ONLY public.blood_statuses DROP CONSTRAINT blood_statuses_pkey;
ALTER TABLE public.wands ALTER COLUMN wand_id DROP DEFAULT;
ALTER TABLE public.spells ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spell_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spell_effects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.species ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.potions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ingredients ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.incantations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.houses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.effects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.characters ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.blood_statuses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.wands_id_seq;
DROP TABLE public.wands;
DROP SEQUENCE public.spells_id_seq;
DROP TABLE public.spells;
DROP SEQUENCE public.spell_types_id_seq;
DROP TABLE public.spell_types;
DROP SEQUENCE public.spell_effects_id_seq;
DROP TABLE public.spell_effects;
DROP SEQUENCE public.species_id_seq;
DROP TABLE public.species;
DROP TABLE public.potions_ingredients;
DROP SEQUENCE public.potions_id_seq;
DROP TABLE public.potions;
DROP SEQUENCE public.ingredients_id_seq;
DROP TABLE public.ingredients;
DROP SEQUENCE public.incantations_id_seq;
DROP TABLE public.incantations;
DROP TABLE public.incantation_types;
DROP SEQUENCE public.houses_id_seq;
DROP TABLE public.houses;
DROP SEQUENCE public.effects_id_seq;
DROP TABLE public.effects;
DROP SEQUENCE public.characters_id_seq;
DROP TABLE public.characters_houses;
DROP TABLE public.characters;
DROP SEQUENCE public.blood_statuses_id_seq;
DROP TABLE public.blood_statuses;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blood_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blood_statuses (
    id integer NOT NULL,
    status text NOT NULL
);


--
-- Name: blood_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blood_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blood_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blood_statuses_id_seq OWNED BY public.blood_statuses.id;


--
-- Name: characters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    name text,
    gender text,
    job text,
    house_id integer,
    wand_id integer,
    patronus text,
    species_id integer,
    blood_status_id integer,
    hair_color text
);


--
-- Name: characters_houses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.characters_houses (
    characteristics_id integer,
    house_id integer
);


--
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- Name: effects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.effects (
    id integer NOT NULL,
    name text
);


--
-- Name: effects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.effects_id_seq OWNED BY public.effects.id;


--
-- Name: houses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.houses (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.houses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.houses_id_seq OWNED BY public.houses.id;


--
-- Name: incantation_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incantation_types (
    incantation_id integer NOT NULL,
    type_id integer NOT NULL
);


--
-- Name: incantations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incantations (
    id integer NOT NULL,
    name text
);


--
-- Name: incantations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.incantations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: incantations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.incantations_id_seq OWNED BY public.incantations.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name text
);


--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: potions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.potions (
    id integer NOT NULL,
    name text,
    effect text,
    characteristics text,
    difficulty_level text
);


--
-- Name: potions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.potions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: potions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.potions_id_seq OWNED BY public.potions.id;


--
-- Name: potions_ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.potions_ingredients (
    potion_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


--
-- Name: species; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.species (
    id integer NOT NULL,
    name text
);


--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.species_id_seq OWNED BY public.species.id;


--
-- Name: spell_effects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spell_effects (
    id integer NOT NULL,
    name text
);


--
-- Name: spell_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.spell_effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spell_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.spell_effects_id_seq OWNED BY public.spell_effects.id;


--
-- Name: spell_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spell_types (
    id integer NOT NULL,
    name text
);


--
-- Name: spell_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.spell_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spell_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.spell_types_id_seq OWNED BY public.spell_types.id;


--
-- Name: spells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spells (
    id integer NOT NULL,
    name text,
    incantation_id integer,
    type_id integer,
    effect_id integer,
    light text
);


--
-- Name: spells_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.spells_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.spells_id_seq OWNED BY public.spells.id;


--
-- Name: wands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wands (
    wand_id integer NOT NULL,
    description text NOT NULL
);


--
-- Name: wands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wands_id_seq OWNED BY public.wands.wand_id;


--
-- Name: blood_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blood_statuses ALTER COLUMN id SET DEFAULT nextval('public.blood_statuses_id_seq'::regclass);


--
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- Name: effects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effects ALTER COLUMN id SET DEFAULT nextval('public.effects_id_seq'::regclass);


--
-- Name: houses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public.houses_id_seq'::regclass);


--
-- Name: incantations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantations ALTER COLUMN id SET DEFAULT nextval('public.incantations_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: potions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.potions ALTER COLUMN id SET DEFAULT nextval('public.potions_id_seq'::regclass);


--
-- Name: species id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.species ALTER COLUMN id SET DEFAULT nextval('public.species_id_seq'::regclass);


--
-- Name: spell_effects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spell_effects ALTER COLUMN id SET DEFAULT nextval('public.spell_effects_id_seq'::regclass);


--
-- Name: spell_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spell_types ALTER COLUMN id SET DEFAULT nextval('public.spell_types_id_seq'::regclass);


--
-- Name: spells id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spells ALTER COLUMN id SET DEFAULT nextval('public.spells_id_seq'::regclass);


--
-- Name: wands wand_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wands ALTER COLUMN wand_id SET DEFAULT nextval('public.wands_id_seq'::regclass);


--
-- Data for Name: blood_statuses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blood_statuses (id, status) FROM stdin;
1	Half-blood
2	Pure-blood
3	Muggle-born
4	Part-Human (Half-giant)
5	Half-blood or pure-blood
6	Pure-blood or half-blood
7	Pure-blood or Half-blood
8	Unknown
9	Part-Goblin
10	Muggle-born or half-blood[
11	Pure-blood or half-blood
12	Quarter-Veela
13	Half-blood[
14	Muggle
15	Squib
\.


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.characters (id, name, gender, job, house_id, wand_id, patronus, species_id, blood_status_id, hair_color) FROM stdin;
1	Harry James Potter	Male	Student	1	1	Stag	1	1	Black
2	Ronald Bilius Weasley	Male	Student	1	\N	Jack Russell terrier	1	2	Red
3	Hermione Jean Granger	Female	Student	1	3	Otter	1	3	Brown
4	Albus Percival Wulfric Brian Dumbledore	Male	Headmaster	1	4	Phoenix	1	1	Silver| formerly auburn
5	Rubeus Hagrid	Male	Keeper of Keys and Grounds | Professor of Care of Magical Creatures 	1	5	None	2	4	Black
6	Neville Longbottom	Male	Student	1	6	Non-corporeal	1	2	Blond
7	Fred Weasley	Male	Student	1	7	Unknown	1	2	Red
8	George Weasley	Male	Student	1	7	Unknown	1	2	Red
9	Ginevra (Ginny) Molly Weasley	Female	Student	1	7	Horse	1	2	Red
10	Dean Thomas	Male	Student	1	7	Unknown	1	3	Black
11	Seamus Finnigan	Male	Student	1	7	Fox	1	1	Sandy
12	Lily J. Potter	Female	\N	1	8	Doe	1	3	Auburn
13	James Potter	Male	\N	1	9	Stag	1	2	Black
14	Sirius Black	Male	\N	1	7	Unknown	1	2	Black
15	Remus John Lupin	Male	Professor of Defence Against the Dark Arts 	1	10	Wolf	3	1	Light brown flecked with grey
16	Peter Pettigrew	Male	The Servant of Lord Voldemort	1	11	None	1	5	Colourless and balding
17	Percy Ignatius Weasley	Male	Student|Prefect|  Personal assistant to Barty Crouch Snr 	1	7	Unknown	1	2	Red
18	(Bill) William Arthur Weasley	Male	Curse-Breaker for Gringotts Bank	1	7	Unknown	4	2	Red
19	Charles Weasley	Male	Dragonologist	1	12	Unknown	1	2	Red
20	Lee Jordan 	Male	Student	1	7	Unknown	1	7	Black
21	Oliver Wood	Male	Student	1	7	Unknown	1	7	\N
22	Angelina Johnson	Female	Student	1	7	Unknown	1	8	Brown
23	Katie Bell	Female	Student	1	7	Unknown	1	7	Brown
24	Alicia Spinnet	Female	Student	1	7	Unknown	1	7	Brown
25	Lavender Brown	Female	Student	1	7	Unknown	1	2	Blond
26	Parvati Patil	Female	Student	1	7	Unknown	1	7	Dark
27	Romilda Vane	Female	Student	1	7	Unknown	1	7	Black
28	Colin Creevey	Male	Student	1	7	Unknown	1	3	Mousy
29	Cormac McLaggen	Male	Student	1	7	Unknown	1	7	Blond
67	Marcus Belby	Male	Student	2	7	Unknown	1	7	Brown
30	Minerva McGonagall	Female	Professor of Transfiguration | Head of Gryffindor	1	13	Cat	1	1	Black
31	Molly Weasley	Female	\N	1	7	Unknown	1	2	Red
32	Arthur Weasley	Male	Head of the Misuse of Muggle Artefacts Office	1	7	Weasel	1	2	Red
33	Quirinus Quirrell	Male	Defence Against the Dark Arts(1991-1992)	2	14	Non-corporeal	1	1	\N
34	Cho Chang	Female	Student	2	7	Swan	1	7	Black
35	Luna Lovegood	Female	Student	2	7	Hare	1	7	Dirty-blonde
36	Gilderoy Lockhart	Male	Defence Against the Dark Arts(1992-1993)	2	15	Non-corporeal	1	1	Blond
37	Filius Flitwick	Male	Professor of Charms | Head of Ravenclaw	2	7	Non-corporeal	5	9	White
38	Sybill Patricia Trelawney	Female	Professor of Divination	2	16	Non-corporeal	1	1	\N
39	Garrick Ollivander	Male	Wandmaker	2	17	Non-corporeal	1	1	\N
40	Myrtle Elizabeth Warren (Moaning Myrtle)	Female	Student	2	7	Unknown	6	3	\N
41	Padma Patil	Female	Student	2	7	Non-corporeal	1	7	Dark
42	Michael Corner	Male	Student	2	7	Squirrel	1	1	Black
43	Marietta Edgecombe	Female	Student	2	7	Unknown	1	7	Reddish-blonde
44	Terry Boot	Male	Student	2	7	Unknown	1	7	\N
45	Anthony Goldstein	Male	Student	2	7	Non-corporeal	1	1	Blonde
46	Severus Snape	Male	Professor of Potions | Head of Slytherin	3	7	Doe	1	1	Black
47	Draco Malfoy	Male	Student	3	18	Unknown	1	2	White-blond
48	Vincent Crabbe	Male	Student	3	7	Unknown	1	2	Black
49	Gregory Goyle	Male	Student	3	7	Unknown	1	2	Brown
50	Bellatrix Lestrange	Female	\N	3	19	\N	1	2	Black
51	Dolores Jane Umbridge	Female	Professor of Defence Against the Dark Arts | Department of Magical Law Enforcement	3	20	Cat	1	1	Iron grey
52	Horace Eugene Flaccus Slughorn	\N	Professor of Potions 	3	21	Non-corporeal	1	7	Bald
53	Lucius Malfoy	Male	School Governor	3	22	Unknown	1	2	White-blond
54	Narcissa Malfoy	Female	\N	3	7	Unknown	1	2	Blonde
55	Regulus Arcturus Black	Male	\N	3	7	Non-corporeal	1	2	Black
56	Pansy Parkinson	Female	Student	3	7	Unknown	1	7	\N
57	Blaise Zabini	Male	Student	3	7	Unknown	1	7	Black
58	Tom Marvolo Riddle	Male	Student	3	23	Unknown	1	1	Bald
59	Theodore Nott	Male	Student	3	7	Unknown	1	2	Brown
60	Rodolphus Lestrange	Male	\N	3	7	Unknown	1	2	Dark
61	Millicent Bulstrode	Female	Student	3	7	Unknown	1	1	Black
62	Graham Montague	Male	Student	3	7	Unknown	1	7	Brown
63	Bloody Baron	Male	Slytherin House Ghost	3	7	Unknown	6	7	\N
64	Marcus Flint	Male	Student	3	7	Unknown	1	7	Black
65	Penelope Clearwater	Female	Student	2	7	Non-corporeal	1	10	Blonde
66	Roger Davies	Male	Student	2	7	Unknown	1	\N	Dark
68	Salazar Slytherin	Male	Founder of Slytherin	3	24	Unknown	1	2	Grey
69	Godric Gryffindor	Male	Founder of Gryffindor	1	7	Unknown	1	11	Red
70	Rowena Ravenclaw	Female	Founder of Ravenclaw	2	7	Unknown	1	11	Black
71	Nicholas de Mimsy-Porpington	Male	Gryffindor House Ghost	1	7	Unknown	6	\N	Grey
72	Cuthbert Binns	Male	Professor of History of Magic 	\N	7	Unknown	6	\N	White (balding)
73	Barty Crouch Jr.	Male	Professor of Defence Against the Dark Arts (as Alastor Moody) 	\N	7	Unknown	1	7	Straw blond
74	Charity Burbage	Female	Professor of Muggle Studies	\N	7	Non-corporeal	1	7	Blonde
75	Firenze	Male	Professor of Divination	\N	\N	\N	7	\N	White-blond
76	Alecto Carrow	Female	Professor of Muggle Studies	3	7	Unknown	1	7	\N
77	Amycus Carrow	Male	Professor of Dark Arts	3	7	Unknown	1	7	\N
78	Helga Hufflepuff	Female	Founder of Hufflepuff	4	7	Unknown	1	7	Brown
79	Fat Friar	Male	Hufflepuff House Ghost	4	7	Unknown	6	\N	Brown
80	Helena Ravenclaw	Female	Ravenclaw House Ghost	2	7	Unknown	6	7	Black
81	Nymphadora Tonks	Female	Auror	4	7	Jack rabbit, Wolf	1	1	Variable
82	Pomona Sprout	Female	Professor of Herbology | Head of Hufflepuff House	4	7	Non-corporeal	1	7	\N
83	Newton Scamander	Male	Employee in the Beast Division of the Department for the Regulation and Control of Magical Creatures	4	7	Unknown	1	7	Red brown
84	Cedric Diggory	Male	Student	4	25	Unknown	1	2	Dark
85	Justin Finch-Fletchley	Male	Student	4	7	Non-corporeal	1	3	Red
86	Zacharias Smith	Male	Student	4	7	Unknown	1	7	Blonde
87	Hannah Abbott	Female	Student	4	7	Non-corporeal	1	1	Blonde
88	Ernest Macmillan	Male	Student	4	7	Boar	1	2	Blond
89	Susan Bones	Female	Student	4	7	Unknown	1	1	\N
90	Walden Macnair	Male	Executioner for the Committee for the Disposal of Dangerous Creatures	3	7	Unknown	1	7	Black
91	Augustus Rookwood	Male	Unspeakable	3	7	None	1	7	Brown/greying
92	Antonin Dolohov	Male	Death Eater	3	7	None	1	7	Dark
93	Corban Yaxley	Male	Head of the Department of Magical Law Enforcement	3	7	None	1	7	Blonde
94	Igor Karkaroff	Male	Headmaster of Durmstrang Institute	\N	7	None	1	7	Silver| formerly black
95	Kingsley Shacklebolt	Male	Auror  | Minister for Magic	\N	7	Lynx	1	2	Bald
96	Alastor Moody	Male	Auror 	\N	7	Non-corporeal	1	2	Grey
97	Alice Longbottom	Female	Auror	\N	7	Unknown	1	2	Blonde
98	Frank Longbottom	Male	Auror	1	26	Unknown	1	2	Blonde
99	Rufus Scrimgeour	Male	Head of Auror Office| Minister for Magic	\N	7	Non-corporeal	1	\N	Tawny
100	Cornelius Oswald Fudge	Male	Minister for Magic	\N	7	Non-corporeal	1	7	Grey
101	Barty Crouch Sr.	Male	Head of the Department of International Magical Cooperation	\N	7	Non-corporeal	1	2	Grey
102	Amos Diggory	Male	Employee of the Department for the Regulation and Control of Magical Creatures[	\N	7	Non-corporeal	1	7	Brown
103	Dedalus Diggle	Male	\N	\N	7	Non-corporeal	1	7	\N
104	Elphias Doge	Male	Special Advisor to the Wizengamot	\N	7	Non-corporeal	1	2	Silver
105	Fleur Isabelle Delacour	Female	Part-time at Gringotts Wizarding Bank	5	27	Non-corporeal	1	12	Silvery-blonde
106	Aberforth Dumbledore	Male	Owner and Barman of the Hog's Head Inn	\N	7	Goat	1	1	Grey
107	Mundungus Fletcher	Male	Dealer of wizarding artifacts	\N	7	Non-corporeal	1	13	Ginger
108	Sturgis Podmore	Male	Advance Guard	\N	7	Unknown	1	7	Straw-coloured
109	Hestia Jones	Female	Advance Guard	\N	7	Unknown	1	7	Black
110	Marlene McKinnon	Female	\N	\N	7	Unknown	1	\N	Red
111	Fabian Prewett	Male	\N	\N	7	Unknown	1	2	Red
112	Gideon Prewett	Male	\N	\N	7	Unknown	1	2	Red 
113	Emmeline Vance	Female	Advance Guard	\N	7	Unknown	1	\N	\N
114	Edgar Bones	Male	\N	4	7	Unknown	1	7	Reddish-brown
115	Dorcas Meadowes	Female	\N	\N	7	Unknown	1	\N	Black
116	Benjy Fenwick	Male	\N	\N	7	Unknown	1	\N	Black
117	Madame Olympe Maxime	Female	Headmistress of Beauxbatons Academy of Magic	5	7	Unknown	2	4	Brown
118	Gabrielle Delacour	Female	\N	5	7	Unknown	\N	12	Silvery-blonde
119	Viktor Krum	Male	Seeker for the Bulgarian National Quidditch team	6	28	Unknown	\N	7	Dark
120	Petunia Dursley	Female	\N	\N	\N	\N	\N	14	Blonde
121	Vernon Dursley	Male	Director at Grunnings	\N	\N	\N	\N	14	Black
122	Dudley Dursley	Male	\N	\N	\N	\N	\N	14	Blond
123	Marge Dursley	Female	Dog breeder	\N	\N	\N	\N	14	Grey
124	Dennis Creevey	Male	Student	1	7	Unknown	\N	3	Mousy brown
125	Albus Severus Potter	Male	Student	3	7	Unknown	\N	1	Jet-black
126	Scorpius Hyperion Malfoy	Male	Student	3	7	Unknown	\N	2	White blond
127	Edward Remus Lupin	Male	Student	4	7	Unknown	8	1	Variable
128	James Sirius Potter	Male	Student	1	7	Unknown	\N	1	\N
129	Rose Granger-Weasley	Female	Student	1	7	Unknown	\N	1	Red
130	Argus Filch	Male	Caretaker of Hogwarts	\N	\N	\N	\N	15	Grey
131	Poppy Pomfrey	Female	Matron at Hogwarts School	\N	7	Non-corporeal	\N	7	\N
132	Rolanda Hooch	Female	Flying Instructor at Hogwarts	\N	7	Non-corporeal	\N	\N	Grey
133	Irma Pince	Female	Librarian at Hogwarts	\N	7	Non-corporeal	\N	\N	\N
134	Aurora Sinistra	Female	Astronomer at Hogwarts	\N	7	Unknown	\N	7	Dark
135	Septima Vector	Female	Professor of Arithmancyat Hogwarts	\N	7	Unknown	\N	\N	Black
136	Wilhelmina Grubbly-Plank	Female	Substitute professor of Care of Magical Creatures at Hogwarts	\N	7	Non-corporeal	\N	\N	Grey
137	Fenrir Greyback	Male	\N	\N	7	None	3	\N	Grey
138	Gellert Grindelwald	Male	Revolutionary leader(c. 1920s[6] – 1945)	\N	29	\N	\N	7	Blond
139	Dobby	Male	Malfoy family's house-elf (? - 1993),\nHogwarts kitchens worker (December 1994 - 1998)	\N	\N	\N	9	\N	Green
140	Kreacher	Male	\nBlack family's house-elf (?-1996), \nHarry Potter's house-elf, \nHogwarts kitchen worker 	\N	\N	\N	9	\N	White
\.


--
-- Data for Name: characters_houses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.characters_houses (characteristics_id, house_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	2
34	2
35	2
36	2
37	2
38	2
39	2
40	2
41	2
42	2
43	2
44	2
45	2
46	3
47	3
48	3
49	3
50	3
51	3
52	3
53	3
54	3
55	3
56	3
57	3
58	3
59	3
60	3
61	3
62	3
63	3
64	3
65	2
66	2
67	2
68	3
69	1
70	2
71	1
76	3
77	3
78	4
79	4
80	2
81	4
82	4
83	4
84	4
85	4
86	4
87	4
88	4
89	4
90	3
91	3
92	3
93	3
98	1
105	5
114	4
117	5
118	5
119	6
124	1
125	3
126	3
127	4
128	1
129	1
\.


--
-- Data for Name: effects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.effects (id, name) FROM stdin;
\.


--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.houses (id, name) FROM stdin;
1	Gryffindor
2	Ravenclaw
3	Slytherin
4	Hufflepuff
5	Beauxbatons Academy of Magic
6	Durmstrang Institute
\.


--
-- Data for Name: incantation_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.incantation_types (incantation_id, type_id) FROM stdin;
1	1
2	1
3	2
4	1
2	3
5	1
6	4
7	5
2	6
2	7
8	1
9	1
10	8
11	1
12	3
13	1
14	1
15	7
16	10
17	1
18	11
2	10
2	5
19	1
20	1
21	1
22	12
2	9
23	7
24	6
25	1
26	1
27	1
28	1
29	1
30	1
31	5
32	1
33	7
34	1
2	14
35	10
36	7
37	1
38	15
39	5
40	1
41	1
42	1
43	1
44	1
45	1
46	10
47	16
48	1
49	6
50	1
51	5
52	17
53	18
54	1
55	10
56	10
57	1
58	1
59	1
60	7
61	19
62	1
63	1
64	20
65	7
66	1
67	10
68	6
69	6
70	1
71	1
72	6
73	1
74	1
75	1
76	1
77	1
78	1
79	10
80	1
2	21
81	1
82	1
83	1
84	6
85	7
86	1
87	9
88	1
89	1
90	1
91	1
92	22
93	1
94	6
95	10
96	1
97	6
98	23
99	1
100	7
101	1
102	1
103	1
104	1
105	1
106	24
107	25
108	7
2	26
109	1
110	1
111	1
112	7
113	7
114	1
115	10
116	5
117	1
118	1
119	1
120	1
121	9
122	6
123	6
124	9
125	14
126	1
127	1
128	1
129	1
130	1
131	7
132	1
133	10
134	3
135	1
136	1
137	1
138	21
139	1
140	1
141	1
142	1
143	27
144	1
145	7
146	12
147	1
148	6
149	1
150	28
151	1
152	1
153	1
154	1
155	1
156	1
2	29
157	1
158	1
2	30
159	7
160	9
161	1
162	1
163	7
164	1
165	1
166	1
167	5
2	31
168	1
169	25
170	6
171	17
172	1
173	5
174	6
175	6
176	10
177	1
178	1
179	6
180	1
181	32
182	33
183	6
184	1
185	12
\.


--
-- Data for Name: incantations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.incantations (id, name) FROM stdin;
1	Accio
2	Unknown
3	Aguamenti
4	Alarte Ascendare
5	Alohomora
6	Anapneo
7	Anteoculatia
8	Aparecium
9	Appare Vestigium
10	None
11	Aqua Eructo
12	Arania Exumai
13	Arresto Momentum
14	Ascendio
15	Avada Kedavra
16	Avifors
17	Avenseguim
18	Avis
19	Baubillious
20	Bombarda
21	Bombarda Maxima
22	Brackium Emendo
23	Calvorio
24	Cantis
25	Capacious extremis
26	Carpe Retractum
27	Cave inimicum
28	Circumrota
29	Cistem Aperio
30	Colloportus
31	Colloshoo
32	Colovaria
33	Confringo
34	Confundo
35	Crinus Muto
36	Crucio
37	Defodio
38	Deletrius
39	Densaugeo
40	Deprimo
41	Depulso
42	Descendo
43	Diffindo
44	Diminuendo
45	Dissendium
46	Draconifors
47	Ducklifors
48	Duro
49	Ebublio
50	Engorgio
51	Engorgio Skullus
52	Entomorphis
53	Epoximise
54	Erecto
55	Evanesce
56	Evanesco
57	Everte Statum
58	Expecto Patronum
59	Expelliarmus
60	Expulso
61	Ferula
62	Fianto Duri
63	Finestra
64	Finite
65	Flagrante
66	Flagrate
67	Flintifors
68	Flipendo
69	Flipendo Tria
70	Fumos
71	Fumos Duo
72	Furnunculus
73	Geminio
74	Glacius
75	Glacius Duo
76	Glacius Tria
77	Glisseo
78	Harmonia Nectere Passus
79	Herbifors
80	Herbivicus
81	Homenum Revelio
82	Illegibilus
83	Immobulus
84	Impedimenta
85	Imperio
86	Impervius
87	Incarcerous
88	Incendio
89	Incendio Tria
90	Inflatus
91	Informous
92	Locomotor Wibbly
93	Lacarnum Inflamari
94	Langlock
95	Lapifors
96	Legilimens
97	Levicorpus
98	Liberacorpus
99	Locomotor
100	Locomotor Mortis
101	Lumos
102	Lumos Duo
103	Lumos Maxima
104	Lumos Solem
105	Magicus Extremos
106	Melofors
107	Meteolojinx Recanto
108	Mimblewimble
109	Mobiliarbus
110	Mobilicorpus
111	Molliare
112	Morsmordre
113	Mucus ad Nauseam
114	Muffliato
115	Multicorfors
116	Mutatio Skullus
117	Nox
118	Nebulus
119	Oculus Reparo
120	Obliviate
121	Obscuro
122	Oppugno
123	Orbis
124	Orchideous
125	Oscausi
126	Pack
127	Papyrus Reparo
128	Partis Temporus
129	Periculum
130	Peskipiksi Pesternomi
131	Petrificus Totalus
132	Piertotum Locomotor
133	Piscifors
134	Point Me
135	Portus
136	Prior Incantato
137	Protego
138	Protego Diabolica
139	Protego horribilis
140	Protego Maxima
141	Protego totalum
142	Quietus
143	Redactum Skullus
144	Reducio
145	Reducto
146	Reparifors
147	Reverte
148	Relashio
149	Rennervate
150	Reparifarge
151	Reparo
152	Repello Muggletum
153	Repello Inimicum
154	Revelio
155	Rictusempra
156	Riddikulus
157	Salvio hexia
158	Scourgify
159	Sectumsempra
160	Serpensortia
161	Silencio
162	Skurge
163	Slugulus Eructo
164	Sonorus
165	Specialis Revelio
166	Spongify
167	Steleus
168	Stupefy
169	Surgito
170	Tarantallegra
171	Tentaclifors
172	Tergeo
173	Titillando
174	Ventus
175	Ventus Duo
176	Vera Verto
177	Verdillious
178	Verdimillious
179	Vermiculus
180	Vermillious
181	Vipera Evanesca
182	Vulnera Sanentur
183	Waddiwasi
184	Wingardium Leviosa
185	Episkey
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ingredients (id, name) FROM stdin;
1	Newt spleens
2	Bananas
3	Valerian sprigs
4	Aconite
5	Dittany
6	Leaping Toadstools
7	Frog Brains
8	Runespoor eggs
9	Powdered dragon claw
10	Scurvy grass
11	Lovage
12	Sneezewort
13	Bursting mushrooms
14	Salamander blood
15	Wartcap powder
16	Dragon claw
17	Dark yellow in colour
18	Dried nettles
19	6 snake fangs
20	4 horned slugs
21	2 porcupine quills
22	Pungous Onions
23	Flobberworm Mucus
24	Ginger root
25	Shrake spines
26	Bundimun Ooze
27	Streeler shells
28	Dragon liver
29	Hemlock essence
30	Tormentil tincture
31	Cowbane essence
32	Standard potioning water
33	Powdered Root of Asphodel
34	Infusion of Wormwood
35	Valerian root
36	A Sopophorous bean
37	A Sloth brain
38	Powdered moonstone
39	Syrup of Hellebore
40	Powdered Unicorn horn
41	Powdered Porcupine quills
42	Emerald green in colour
43	Glows phosphorescently
44	Philosopher's Stone
45	Shrivelfig
46	Porcupine quills
47	Peppermint sprigs
48	Sopophorous beans
49	Wormwood
50	Bubotuber Pus
51	Gravy
52	Ashwinder egg
53	Squill bulb
54	Murtlap tentacle
55	Tincture of thyme
56	Occamy eggshell
57	Powdered common rue
58	Onion juice
59	Jewelweed
60	Neem oil
61	Repels Flesh-Eating Slugs
62	2 drops of Lethe River Water
63	2 Valerian sprigs
64	2 measures of Standard Ingredient
65	4 mistletoe berries
66	Rat tails
67	Billywig stings
68	Flobberworm mucus
69	Horklump juice
70	Lionfish spines
71	Standard Ingredient
72	Alihotsy leaves
73	Dried billywig stings
74	Peppermint
75	Stewed Mandrake
76	Honeywater
77	Vervain
78	infusion
79	Two scrumples of an unknown ingredient
80	An ingredient used in a furnace
81	Agrimonia
82	Wiggentree twigs
83	Castor oil
84	Extract of Gurdyroot
85	Pale green in colour
86	Murtlap tentacles
87	Bicorn horn
88	Mandrake root
89	Lacewing flies (stewed 21 days)
90	Leeches
91	Powdered bicorn horn
92	Knotgrass
93	Fluxweed (picked at full moon)
94	Shredded Boomslang skin
95	A bit of the person one wants to turn into (typically hair)
96	Bone of the father
97	Flesh of a servant
98	Blood of a foe
99	Snake venom
100	Unicorn blood
101	Minced daisy roots
102	Peeled Shrivelfig
103	Sliced caterpillars
104	One rat spleen
105	A dash of leech juice
106	A splash of cowbane
107	1 Chinese Chomping Cabbage
108	3 Puffer-fish
109	5 Scarab beetles
110	Gomas Barbadensis
111	Asian Dragon Hair
112	Petroleum Jelly
113	4 sprigs of Lavender
114	6 measures of Standard Ingredient
115	2 blobs of Flobberworm Mucus
116	4 Valerian sprigs
117	Powdered  Griffin claw
118	Puffer-fish eyes
119	Dried nettle
120	Bat spleens
121	Jobberknoll feathers
122	4 measures of Standard Ingredient
123	6 dried Billywig stings
124	2 sprigs of Wolfsbane
125	Ground scarab beetles
126	Cut ginger roots
127	Armadillo bile
128	Wolfsbane
\.


--
-- Data for Name: potions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.potions (id, name, effect, characteristics, difficulty_level) FROM stdin;
1	Ageing Potion	Ages drinker temporarily	Green	Advanced
2	Amortentia	Love Potion that causes a powerful infatuation or obsession in the drinker	Mother-of-pearl sheen, Spiralling steam, Scent is multi-faceted and varies based on what the person likes	Advanced
3	Antidote to Veritaserum	Counters the effect of Veritaserum	\N	\N
4	Babbling Beverage	Causes the drinker to speak nonsense	\N	\N
5	Baruffio's Brain Elixir	Allegedly increases one's brain power	Green in colour	\N
6	Befuddlement Draught	Recklessness	Dark green in colour	\N
7	First Love Beguiling Bubbles	Causes the drinker to become infatuated with the giver of the potion	\N	\N
8	Fire Protection Potion	Protects drinker from fire	Purple or Black	Beginner
9	Tolipan Blemish Blitzer	Treats acne	White in colour, Thick paste consistency	\N
10	Blood-Replenishing Potion	Replenishes lost blood	Dark red in colour	\N
11	Bruise removal paste	Heals bruises in an hour	Thick, yellow paste	\N
12	Bundimun Secretion	Doxycide, Bundimun Pomade, Cleaning products	Lime green in colour, Emits vapours	\N
13	Burn-healing paste	Heals burns	Orange	\N
14	Calming Draught	Calms the drinker	Blue in colour	\N
15	Caxambu Style Borborygmus Potion	Provokes stomach growling	\N	\N
16	Chelidonium Miniscula	\N	\N	\N
17	Confusing Concoction	Confusion	\N	Simple to moderate
18	Cough potion	Cures coughing	\N	\N
19	Cupid Crystals	Causes the drinker to become infatuated with the giver of the potion	\N	\N
20	Cure for Boils	Removes boils	Blue, Emits pink smoke	Beginner
21	Death potion	Highly corrosive, death on contact	Black in colour	Advanced
22	Deflating Draught	Deflates the target	\N	\N
23	Developing solution	Develops moving photographs	\N	\N
24	Doxycide	Temporarily stuns Doxies so that the pests can be removed from a home	Black in colour, Typically delivered as a spray	\N
25	Dr Ubbly's Oblivious Unction	Heals wounds left by thoughts	\N	\N
26	Draught of Living Death	Causes the drinker to fall into a deep, death-like slumber	Turns pale lilac colour then clear	Advanced
27	Draught of Peace	Relieves anxiety	Light silver colour and vapour	Advanced
28	Potion for Dreamless Sleep	Drowsiness , dreamless sleep	Purple in colour	\N
29	Emerald Potion	Induces fear, delirium, intense stomach pain and extreme thirst in the drinker	\N	\N
30	Elixir of Life	Immortality	\N	\N
31	Elixir to Induce Euphoria	Induces happiness	Sunshine yellow in colour, Sweet, Aromatic, Emits rainbow when finished	Advanced
32	Everlasting Elixirs	\N	\N	\N
33	Essence of Insanity	\N	\N	\N
34	Fake protective potions	Supposedly protect the drinker from the effects of dark magic (likely useless)	Fraudulent solutions	Beginner
35	Felix Felicis	Makes the drinker lucky, Giddiness and recklessness with overuse, Extremely toxic in large quantities, Highly disastrous if brewed incorrectly	Droplets leap like goldfish above potion's surface when in cauldron	Advanced
36	Fergus Fungal Budge	Treats ringworm, fungicide, Potential negative side effects if used by elves	\N	\N
37	Flesh-Eating Slug Repellent	\N	\N	\N
38	Forgetfulness Potion	Memory loss	Orange in colour	Beginner
39	Garrotting Gas	Causes choking, possibly suffocation	Colourless	\N
40	Hair-Raising Potion	Raises hair up on end	Green colour	\N
41	Heartbreak Teardrops	Causes the drinker to become infatuated with the giver of the potion	Red in colour	\N
42	Herbicide Potion	Kills or damages plants	Green	Advanced
43	Hiccoughing Solution	Presumably causes hiccoughs	\N	\N
44	Invigoration Draught	Energises the drinker	Orange	O.W.L. level
45	Kissing Concoction	Causes the drinker to become infatuated with the giver of the potion	\N	\N
46	Laxative Potion	Laxative	\N	\N
47	Love Potion Antidote	Serves as an antidote for Love Potion	Clear, colourless	\N
48	Madame Glossy's Silver Polish	Polishes silver objects	\N	\N
49	Mandrake Restorative Draught	Returns transfigured or cursed individuals to their original state	\N	\N
50	Mouth Itching Antidote	Cures mouth itching	\N	\N
51	Mrs Skower's All-Purpose Magical Mess Remover	Cleans stains	Strong acrid odour	\N
52	Murtlap Essence	Soothes and heals cuts and abrasions	Blue in colour	\N
53	Pepperup Potion	Warms up the recipient and cures common cold, Steam emits from drinker's ears	\N	\N
54	Polyjuice Potion	Allows a human drinker to temporarily assume the form of another person	Before addition of final ingredient: Thick and mud-like, Bubbles slowly\nAfter addition of final ingredient: Taste and colour vary depending on the person being turned into	Advanced
55	Rat tonic	Healing potion for rats, Abnormal growth of the rat if too much is drunk	Green-coloured	\N
56	Regeneration potion	Helps restore non-corporeal wizards to their bodies	\N	Advanced
57	Rudimentary body potion	Helps restore non-corporeal wizards to a rudimentary bodies/sustains rudimentary bodies	\N	Advanced
58	Shrinking Solution	Causes living beings to shrink to a smaller form	Acid green in colour	\N
59	Skele-Gro	Restores bones	Smokes when poured, Vile taste, Burns on the way down	Above second year
60	Sleekeazy's Hair Potion	Makes hair more manageable	\N	\N
61	Sleeping Draught	Make the drinker quickly fall into a deep but temporary sleep	Dark Purple	Advanced
62	Strengthening Solution	Superhuman strength	Turquoise in colour	Moderate to advanced
63	Swelling Solution	Causes enlargement on contact	\N	Beginner
64	Ten-Second Pimple Vanisher	Treats boils, pimples, blackheads and acne	\N	\N
65	Thick golden potion	Healing, curse quarantining	Golden in colour	\N
66	Truth serum	Drinker tells the truth	\N	\N
67	Veritaserum	Forces drinker to speak the truth	Clear and odourless like water	Advanced
68	Weedosoros	Highly poisonous	Deep brown in colour	\N
69	Wideye Potion	Prevents sleeping, Awakens victim	\N	Beginner
70	Wit-Sharpening Potion	Improves intellect	Purple in colour	Moderate
71	Wolfsbane Potion	Eases the symptoms of lycanthropy; prevents werewolves from losing their minds post-transformation.	Faint blue smoke when completed, Unpleasant taste	Advanced
72	Wound-cleaning potion	Antiseptic	Purple liquid, Smokes on contact, Stings on contact	\N
\.


--
-- Data for Name: potions_ingredients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.potions_ingredients (potion_id, ingredient_id) FROM stdin;
1	1
1	2
4	3
4	4
4	5
5	6
5	7
5	8
5	9
6	10
6	11
6	12
8	13
8	14
8	15
9	16
16	17
17	10
17	11
17	12
20	18
20	19
20	20
20	21
20	22
20	23
20	24
20	25
24	26
24	27
24	28
24	29
24	30
24	31
26	32
26	33
26	34
26	35
26	36
26	37
27	38
27	39
27	40
27	41
29	42
29	43
30	44
31	45
31	46
31	47
31	48
31	49
34	50
34	51
35	52
35	53
35	54
35	55
35	56
35	57
36	58
36	59
36	60
37	61
38	62
38	63
38	64
38	65
40	66
40	46
40	67
42	68
42	69
42	70
42	71
44	72
44	73
44	74
44	75
44	34
44	76
44	77
44	78
44	10
44	11
46	79
46	80
46	81
47	82
47	83
47	84
49	75
50	85
52	86
53	87
53	88
54	89
54	90
54	91
54	92
54	93
54	94
54	95
56	96
56	97
56	98
57	99
57	100
58	101
58	102
58	103
58	104
58	105
58	106
58	49
59	107
59	108
59	109
60	110
60	111
60	112
61	113
61	114
61	115
61	116
62	14
62	117
63	118
63	119
63	120
66	121
69	19
69	122
69	123
69	124
70	125
70	126
70	127
71	128
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.species (id, name) FROM stdin;
1	Human
2	Half-Human/Half-Giant
3	Werewolf
4	Human (Werewolf traits)
5	Human(goblin ancestry)
6	Ghost
7	Centaur
8	Human (Metamorphmagus)
9	House elf
\.


--
-- Data for Name: spell_effects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spell_effects (id, name) FROM stdin;
1	Summons an object
2	Prevents people above or below a certain age from access to a target
3	Conjures water
4	Rockets target upward
5	Great Force
6	Unlocks target
7	Clears airway
8	Grows antlers on head
9	Prevents cheating
10	Prevents Disapparition within a certain area
11	Repels intruders
12	Injuries capable of killing
13	Reveals hidden writing
14	Reveals traces of magic, including footprints and track marks
15	Magically transports the caster
16	Jet of water
17	Repels spiders
18	Slows or stops target's velocity
19	Fires arrows from the caster's wand
20	Lifts caster
21	Instantaneous death
22	Transforms the target into a bird.
23	Turns object into tracking device
24	Conjures birds
25	Uncontrollable babbling
26	Turns target human into a badger
27	Transforms target's bogeys into bats
28	Jet of white sparks
29	Disguises things
30	Charms snowballs to follow and harass a designated target
31	Conjures bluebell flames
32	Jet of blue sparks
33	Small explosion
34	Powerful explosion
35	Mends bones
36	Enhances teammates against foes
37	Conjures bridges
38	Makes a broomstick attempt to buck its rider off
39	Creates bubble protecting the head
40	Creates a stream of non-bursting bubbles
41	Removes victim's hair
42	Makes target sing
43	Increases interior space
44	Pull caster towards object, Pull object towards caster
45	Attacks multiple enemies
46	Sets off a high-pitched shriek if entered
47	Turns a cauldron into a sieve
48	Transforms a cauldron into a badger.
49	Concealment
50	Creates joy
51	Rotates an object
52	Opens chests
53	Locks doors
54	Sticks shoes to floor
55	Changes colour
56	Explosion
57	Confuses the target
58	Irritates eyes
59	Makes skin appear like cornflakes
60	Conjures exploding Wizard Crackers
61	Assists the caster in cheating on written papers.
62	Transforms hair
63	Excruciating pain
64	Carves through material
65	Erases image from Reverse Spell
66	Elongates teeth
67	Blasts holes in ground
68	Sends target away
69	Lowers target
70	Transfigures desks into pigs
71	Impairs foes
72	Cuts objects
73	Shrinks objects
74	Reveals secret passages
75	Disguises target as surroundings
76	Turns object into dragon
77	Dries up small bodies of water
78	Turns organisms to ducks
79	Turns object to stone
80	Transfigures target's ears into kumquats
81	Causes ears to wither
82	Traps target in giant bubble
83	Causes swelling
84	Swells head
85	Turns into insect
86	Expels entrails
87	Bonds two objects
88	Erects a structure
89	Vanishes objects
90	Vanishes things
91	Makes opponent stumble, Causes sharp pain
92	Conjures a spirit guardian
93	Disarms an opponent
94	Blows things up
95	Extinguishes fires
96	Implants a false memory in the victim
97	Minimises object's weight
98	Changes ferrets into humans
99	Bandages target
100	Most likely hardens magical shields
101	Conceals a secret
102	Unleashes cursed fire
103	Shatters glass
104	Terminates all spell effects
105	Removes a person's fingers
106	Ring of fire
107	Causes objects to burn on contact
108	Writes in midair
109	Makes fire harmless
110	Conjures flask
111	Turns target into matchboxes
112	Knocks target back
113	More powerful version of Flipendo
114	Allows an object to fly
115	Defensive smokescreen
116	Multiple concealing smokescreens
117	Causes pimples to erupt
118	Causes fur to grow on someone
119	Duplicates an object
120	Freezes target
121	Freezes the target
122	Freezes target enemy
123	Turns stairs into a slide
124	Jet of green sparks
125	Makes holding easier
126	Causes hair to grow longer and thicker
127	Repairs Vanishing Cabinets
128	Transforms target into flowers
129	Rapidly grows plants
130	Causes boils to spell "SNEAK" on the face of a traitor
131	Offensive spells; will follow their target
132	Reveals human presence
133	When cast onto a map, it enables to track the movements of every person in the mapped area
134	May temporarily change a transformed werewolf back into their human form (according to Gilderoy Lockhart, it cures lycanthropy)
135	Transforms target's tongue into a horn
136	Allow broomsticks to brake more easily
137	Prepared a receptacle to become a Horcrux
138	Jet of hot air
139	Reverses time
140	Makes objects hover
141	Unclear, possibly causes a broomstick to attempt to hurl its rider off.
142	Makes text illegible
143	Stops movement and actions of the target
144	Hinders movement
145	Total control over the victim
146	Invisible barrier
147	Waterproofs an object
148	Presumably conjuresinanimate objects
149	Binds target in ropes
150	Conjures flames
151	Conjures blue flames
152	Inflates target
153	Adds to the Folio Bruti
154	Instantly scalps hair
155	Detects intruders and sounds an alarm
156	Legs become wobbly
157	Dulls mental abilities
158	Fingers become wobbly
159	Puts knees on backward
160	Ignites cloaks
161	Sticks tongue to roof of the mouth
162	Turns target into rabbit
163	Leeks sprout from ears
164	Lets caster see into the mind of another person
165	Suspends people by the ankles
166	Counteracts Levicorpus
167	Moves objects in midair
168	Sticks legs together
169	Illuminates the wand tip
170	Focused beam of light
171	Produces bright light
172	Produces sunlight
173	Temporarily increases casters' spell power
174	Encases head in pumpkin
175	Causes weather effects caused by incantations to cease
176	Ties tongue in knot
177	Produces special fog (for concealment of certain locations)
178	Levitates wooden things
179	Moves bodies
180	Invisible cushion
181	Conjures Dark Mark
182	Nasty cold & runny nose
183	Conceals sound
184	Changes clothes
185	Grows extra heads
186	Extinguishes wandlight
187	Conjures fog
188	Repairs glasses
189	Removes footprints
190	Erases memories
191	Blindfolds target
192	Assaults target with directed object(s)
193	Sucks the target into the ground
194	Conjures flowers
195	Seals mouth
196	Packs luggage
197	Mends torn paper
198	Makes the user daydream for 30 minutes
199	Parts the target
200	Inflicts fiery hot breath
201	Burst of red sparks
202	Sticks object permanently in place
203	Nothing (supposedly captures pixies)
204	Temporary Paralysis
205	Animates target
206	Turns target into fish
207	Places object on target
208	Wand points due north
209	Turns object into Portkey
210	Shows the previous spells cast by a wand
211	Links objects
212	Reflects spells and blocks physical forces
213	Ring of protective black fire that only burns the caster's enemies whilst leaving their allies unharmed
214	Summons a powerful protective barrier
215	Summons a large protective barrier
216	Shields an area
217	Exploding firecrackers
218	Causes yellowish goo to squirt from one's nose
219	Quietens target
220	Shrinks head
221	Shrinks target
222	Destroys solid objects
223	Refills beverage containers
224	Heals minor magically induced ailments
225	Returns objects to their original positions or states
226	Forces target to let go
227	Awakens victim
228	Reverses the effects of an incomplete Transformation spell
229	Fixes broken objects
230	Repels Muggles
231	Repels enemies. If used with Protego Maxima and Fianto Duri, it disintegrates anything that comes in contact with the barrier.
232	Reveals secrets about a person or object
233	Tickles and weakens
234	Turns a Boggart into something amusing
235	Accelerates the growth of a rosebush
236	Causes a rowboat to propel itself.
237	Hex deflection
238	Victim sneezes sardines
239	Conjures sauce
240	Creates fire
241	Cleans objects
242	Seals envelopes
243	Makes tiny spikes erupt all over the victim
244	Lacerates target
245	Used to break down magical shields
246	Small explosion with a gunshot-sound
247	Explosive
248	Conjures snake
249	Silences target
250	Cleans ectoplasm, Frightens ghosts and other spirits
251	Makes object slippery
252	Victim vomits slugs
253	Emits a magnified roar from the tip of the wand
254	Loudens target
255	Reveals spells cast on objects or potions
256	Causes the target's legs to become spongy
257	Softens objects
258	Transfigures writing quills into worms
259	Detects those under magicaldisguise.
260	Causes target to sneeze
261	Stings flesh
262	Expands the target
263	Knocks out target
264	Superior perception
265	Removes enchantments
266	Switches two objects
267	When a word is spoken, the caster is alerted and protective enchantments around the speaker are weakened.
268	Gives the victim a tail
269	Sends legs out of control
270	Transforms a teacup into a tortoise
271	Transforms a teapot into a tortoise
272	Straightens teeth
273	Makes objects teleport elsewhere
274	Turns victim's head into tentacle
275	Cleans up objects
276	Causes its victim's toenails to grow alarmingly fast
277	Tortures, possibly by transfiguring the target to death
278	Trips victim
279	Makes victim's ears twitch
280	Makes object unbreakable
281	Magical vow that is fatal if broken
282	Allows a witch or wizard to fly unaided
283	Cleans an object like a vacuum cleaner
284	Jet of spiralling wind
285	Creates a stronger jet of wind compared to Ventus
286	Transforms animals into water goblets
287	Causes the wand tip to burn like a sparkler whilst damaging the foe.
288	Emits green sparks from the wand that can: Do damage to opponents , Reveal hidden things
289	Turns things into worms
290	Jet of red sparks
291	Vanishes snakes
292	Slows blood flow, Clears residue, Knits wounds
293	Propels wad at the target
294	Cleans dishes
295	Makes objects fly
296	Heals minor injuries
\.


--
-- Data for Name: spell_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spell_types (id, name) FROM stdin;
1	Charm
2	Charm, Conjuration
3	Spell
4	Healing spell, Vanishment
5	Hex
6	Jinx
7	Curse
8	Transportation
9	Conjuration
10	Transfiguration
11	Conjuration, Charm
12	Healing spell, Charm
13	Transformation
14	Dark charm
15	Charm, Counter-charm
16	Transfiguration, Jinx
17	Transfiguration Jinx
18	Transfiguration spell
19	Healing Spell, Charm, Conjuration
20	Counter-spell
21	Dark Arts
22	Curse, Jinx
23	Counter-jinx
24	Conjuration, Jinx
25	Counter-charm
26	Patented Charm
27	Hex, Counter-curse
28	Untransfiguration
29	Charm, Transfiguration
30	Transfiguration jinx
31	Jinx, Hex
32	Vanishment
33	Healing spell, Counter-curse
\.


--
-- Data for Name: spells; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spells (id, name, incantation_id, type_id, effect_id, light) FROM stdin;
1	Summoning Charm	1	1	1	None
2	Age Line	2	1	2	Blue
3	Water-Making Spell	3	2	3	Icy blue
4	Launch an object up into the air	4	1	4	Red
5	Albus Dumbledore's Forceful Spell	2	3	5	None
6	Unlocking Charm	5	1	6	Invisible, blue, yellow, or purple
7	Healing Spell	6	4	7	\N
8	Hex that grows antlers on the head	7	5	8	Red
9	Anti-Cheating Spell	2	1	9	Purple
10	Anti-Disapparition Jinx	2	6	10	\N
11	Anti-intruder jinx	2	6	11	\N
12	Antonin Dolohov's curse	2	7	12	Purple
13	Revealing Charm	8	1	13	\N
14	Tracking spell	9	1	14	Swirl of gold
15	Apparition	10	8	15	None
16	Aqua Eructo Charm	11	1	16	Ice Blue
17	Spider repelling spell	12	3	17	Blue
18	Slowing Charm	13	1	18	None
19	Arrow-shooting spell	\N	9	19	\N
20	Ascendio	14	1	20	None
21	Killing Curse	15	7	21	Green
22	Avifors Spell	16	10	22	Blue
23	Avenseguim	17	1	23	Orange
24	Bird-Conjuring Charm	18	11	24	Blue
25	Babbling Curse	2	7	25	\N
26	Badgering	2	10	26	\N
27	Bat-Bogey Hex	2	5	27	\N
28	Baubillious	19	1	28	White
29	Bedazzling Hex	2	5	29	\N
30	Bewitched Snowballs	2	1	30	\N
31	Bluebell Flames	2	1	31	Bright blue
32	Blue sparks	2	1	32	Blue
33	Exploding Charm	20	1	33	None
34	Exploding Charm 2	21	1	34	White
35	Brackium Emendo	22	12	35	Blue
36	Bravery Charm	2	1	36	\N
37	Bridge-conjuring spell	2	9	37	None
38	Broom jinx	2	6	38	\N
39	Bubble-Head Charm	2	1	39	\N
40	Bubble-producing spell	2	9	40	None
41	Hair Loss Curse	23	7	41	Red or Purple
42	Cantis	24	6	42	Pink
43	Extension Charm	25	1	43	\N
44	Seize and Pull Charm	26	1	44	Orange or Purple
45	Cascading Jinx	2	6	45	Blue
46	Caterwauling Charm	2	1	46	\N
47	Cauldron to Sieve	\N	10	47	\N
48	Cauldron to badger	\N	13	48	\N
49	Cave inimicum	27	1	49	None
50	Cheering Charm	2	1	50	\N
51	Circumrota	28	1	51	\N
52	Cistem Aperio	29	1	52	White
53	Locking Spell	30	1	53	None
54	Stickfast Hex	31	5	54	\N
55	Colour Change Charm	32	1	55	Red
56	Blasting Curse	33	7	56	Fiery Orange
57	Confundus Charm	34	1	57	Pink
58	Conjunctivitis Curse	2	7	58	\N
59	Cornflake skin spell	2	14	59	\N
60	Cracker Jinx	2	6	60	\N
61	Cribbing Spell	2	3	61	\N
62	Crinus Muto	35	10	62	White
63	Cruciatus Curse	36	7	63	Red or None
64	Gouging Spell	37	1	64	\N
65	Eradication Spell	38	15	65	None
66	Densaugeo	39	5	66	Violet
67	Deprimo	40	1	67	Green
68	Banishing Charm	41	1	68	White or Red
69	Descendo	42	1	69	Blue
70	Desk Into Pig	\N	10	70	\N
71	Deterioration Hex	2	5	71	\N
72	Severing Charm	43	1	72	Light green, pink or red
73	Diminuendo	44	1	73	White
74	Dissendium	45	1	74	None
75	Disillusionment Charm	2	1	75	White
76	Draconifors Spell	46	10	76	Fiery orange
77	Drought Charm	2	1	77	\N
78	Ducklifors Jinx	47	16	78	Yellow or Purple
79	Hardening Charm	48	1	79	None
80	Ears to kumquats	\N	10	80	\N
81	Ear-shrivelling Curse	2	7	81	\N
82	Ebublio Jinx	49	6	82	Blue
83	Engorgement Charm	50	1	83	Icy blue
84	Engorgio Skullus	51	5	84	Red or Purple
85	Insect Jinx	52	17	85	Red or Purple
86	Entrail-Expelling Curse	2	7	86	\N
87	Epoximise	53	18	87	\N
88	Erecto	54	1	88	None
89	Evanesce	55	10	89	Bluish-white
90	Vanishing Spell	56	10	90	None
91	Everte Statum	57	1	91	Orange
92	Patronus Charm	58	1	92	Silver
93	Disarming Charm	59	1	93	Scarlet
94	Expulso Curse	60	7	94	Blue
95	Extinguishing Spell	2	1	95	\N
96	False memory charm	2	1	96	\N
97	Feather-light charm	2	1	97	\N
98	Ferret to human	2	10	98	None
99	Bandaging Charm	61	19	99	\N
100	Fianto Duri	62	1	100	Blueish white
101	Fidelius Charm	2	1	101	\N
102	Fiendfyre	2	7	102	Fire
103	Finestra spell	63	1	103	Blue
104	General Counter-Spell	64	20	104	Red
105	Finger-removing jinx	2	6	105	\N
106	Firestorm	2	1	106	Crimson and gold
107	Flagrante Curse	65	7	107	\N
108	Flagrate	66	1	108	Fiery scarlet
109	Flame-Freezing Charm	2	1	109	White
110	Flask-conjuring spell	2	9	110	None
111	Flintifors	67	10	111	\N
112	Knockback Jinx	68	6	112	Blue
113	Knockback Jinx Duo	68	6	112	Red
114	Flipendo Tria	69	6	113	Blue
115	Flying Charm	2	1	114	\N
116	Smokescreen Spell	70	1	115	Grey
117	Fumos Duo	71	1	116	Dark Red
118	Pimple Jinx	72	6	117	Gold
119	Fur spell	2	1	118	\N
120	Doubling Charm	73	1	119	None
121	Freezing Spell	74	1	120	Blue
122	Glacius Duo	75	1	121	Blue
123	Glacius Tria	76	1	122	Blue
124	Glisseo	77	1	123	None
125	Green Sparks	2	1	124	Green
126	Gripping Charm	2	1	125	\N
127	Hair-thickening Charm	2	1	126	\N
128	Harmonia Nectere Passus	78	1	127	None
129	Herbifors Spell	79	10	128	Red or Purple
130	Herbivicus Charm	80	1	129	Green
131	Dumbledore's Army parchment jinx	2	6	130	\N
132	Homing spell	2	21	131	Orange or Green
133	Human Presence Revealing Spell	81	1	132	None
134	Homonculous Charm	2	1	133	\N
135	Homorphus Charm	2	1	134	\N
136	Horn tongue hex	2	5	135	\N
137	Horton-Keitch Braking Charm	2	1	136	\N
138	Horcrux-making spell	2	21	137	\N
139	Hot-Air Charm	2	1	138	None
140	Hour-Reversal Charm	2	1	139	Blue
141	Hover Charm	2	1	140	Pink
142	Hurling Hex	2	5	141	\N
143	Illegibilus	82	1	142	\N
144	Freezing Charm	83	1	143	Blue
145	Impediment Jinx	84	6	144	Turquoise
146	Imperius Curse	85	7	145	None
147	Imperturbable Charm	2	1	146	\N
148	Impervius Charm	86	1	147	None
149	Inanimatus Conjurus Spell	2	10	148	\N
150	Incarcerous Spell	87	9	149	None
151	Fire-Making Spell	88	1	150	Orange and Red
152	Incendio Duo Spell	88	1	150	Green
153	Incendio Tria	89	1	151	Blue
154	Inflating Charm	90	1	152	Blue
155	Informous Spell	91	1	153	Blue
156	Instant Scalping Hex	2	5	154	\N
157	Intruder Charm	2	1	155	\N
158	Jelly-Legs Curse	92	22	156	Orange
159	Jelly-Brain Jinx	2	6	157	\N
160	Jelly-Fingers Curse	2	7	158	\N
161	Knee-reversal hex	2	5	159	\N
162	Lacarnum Inflamari	93	1	160	Orange
163	Langlock	94	6	161	None
164	Lapifors Spell	95	10	162	Green
165	Leek jinx	2	6	163	\N
166	Legilimency Spell	96	1	164	Psychadelic transparent wave
167	Levicorpus	97	6	165	Green
168	Liberacorpus	98	23	166	None
169	Locomotion Charm	99	1	167	None
170	Leg-Locker Curse	100	7	168	Purple
171	Wand-Lighting Charm	101	1	169	White
172	Wand-Lighting Charm Duo	102	1	170	White
173	Lumos Maxima	103	1	171	White
174	Lumos Solem Spell	104	1	172	Bright yellow
175	Magicus Extremos	105	1	173	Pink
176	Melofors Jinx	106	24	174	Orange
177	Meteolojinx Recanto	107	25	175	None
178	Tongue-Tying Curse	108	7	176	Blue
179	Ministry of Magic Fog	2	26	177	\N
180	Mobiliarbus	109	1	178	Blue
181	Mobilicorpus	110	1	179	None
182	Cushioning Charm	111	1	180	\N
183	Dark Mark	112	7	181	Green
184	Curse of the Bogies	113	7	182	Green
185	Muffliato Charm	114	1	183	None
186	Multicorfors Spell	115	10	184	Red
187	Mutatio Skullus	116	5	185	\N
188	Wand-Extinguishing Charm	117	1	186	\N
189	Nebulus	118	1	187	Grey
190	Oculus Reparo	119	1	188	None
191	Obliteration Charm	2	1	189	\N
192	Memory Charm	120	1	190	Green
193	Obscuro	121	9	191	None
194	Oppugno Jinx	122	6	192	None
195	Orbis Jinx	123	6	193	Blue
196	Orchideous	124	9	194	Pink
197	Oscausi	125	14	195	White
198	Pack	126	1	196	None
199	Papyrus Reparo	127	1	197	None
200	Patented Daydream Charm	\N	1	198	\N
201	Partis Temporus	128	1	199	None
202	Pepper breath hex	2	5	200	\N
203	Periculum	129	1	201	Red
204	Permanent Sticking Charm	2	1	202	\N
205	Peskipiksi Pesternomi	130	1	203	None
206	Full Body-Bind Curse	131	7	204	White
207	Piertotum Locomotor	132	1	205	None or Green
208	Piscifors	133	10	206	Blue
209	Placement Charm	2	1	207	\N
210	Four-Point Spell	134	3	208	None
211	Portus	135	1	209	Blue
212	Reverse Spell	136	1	210	Gold
213	Protean Charm	2	1	211	\N
214	Shield Charm	137	1	212	Invisible on its own, reflects light of spell
215	Protego Diabolica	138	21	213	\N
216	Protego horribilis	139	1	214	\N
217	Protego Maxima	140	1	215	White
218	Protego totalum	141	1	216	None
219	Purple Firecrackers	2	1	217	\N
220	Pus-squirting hex	2	5	218	None (bang)
221	Quietening Charm	142	1	219	None
222	Head Shrink Spell	143	27	220	Red or Purple
223	Shrinking Charm	144	1	221	Purple
224	Reductor Curse	145	7	222	Blue
225	Refilling Charm	2	1	223	None
226	Reparifors	146	12	224	Purple
227	Reverte	147	1	225	\N
228	Revulsion Jinx	148	6	226	Purple
229	Reviving Spell	149	1	227	Red
230	Reparifarge	150	28	228	White
231	Mending Charm	151	1	229	None
232	Muggle-Repelling Charm	152	1	230	None (haze)
233	Repello Inimicum	153	1	231	Blueish white
234	Revelio Charm	154	1	232	Blue
235	Tickling Charm	155	1	233	Silver
236	Boggart-Banishing Spell	156	1	234	None
237	Rose Growth	2	29	235	\N
238	Rowboat spell	2	1	236	\N
239	Salvio hexia	157	1	237	None (haze)
240	Sardine hex	2	5	238	\N
241	Sauce-making spell	2	9	239	None
242	Minerva McGonagall's fire-creating spell	2	3	240	Orange
243	Scouring Charm	158	1	241	None
244	Sealant Charm	2	1	242	\N
245	Sea urchin jinx	2	30	243	\N
246	Sectumsempra	159	7	244	White
247	Shield penetration spell	2	3	245	Bluish-white
248	Shooting spell	2	3	246	None
249	Smashing spell	2	7	247	Blue
250	Snake Summons Spell	160	9	248	White
251	Silencing Charm	161	1	249	None
252	Skurge Charm	162	1	250	Green
253	Slippery Jinx	2	6	251	\N
254	Slug-vomiting Charm	163	7	252	Green
255	Sonorous Charm	2	1	253	Orange
256	Amplifying Charm	164	1	254	None
257	Specialis Revelio	165	1	255	None
258	Sponge-Knees Curse	2	7	256	\N
259	Softening Charm	166	1	257	Purple or Orange
260	Squiggle Quill	2	10	258	\N
261	Stealth Sensoring Spell	2	3	259	\N
262	Steleus	167	5	260	Green
263	Stinging Jinx	2	31	261	White
264	Stretching Jinx	2	6	262	\N
265	Stunning Spell	168	1	263	Red
266	Supersensory Charm	2	1	264	\N
267	Surgito	169	25	265	\N
268	Switching Spell	2	10	266	White
269	Taboo	2	7	267	None
270	Tail-growing hex	2	5	268	\N
271	Dancing Feet Spell	170	6	269	\N
272	Teacup to tortoise	2	10	270	Blue
273	Teapot to tortoise	2	10	271	Orange
274	Teeth-straightening spell	2	1	272	\N
275	Teleportation spell	2	3	273	\N
276	Tentaclifors	171	17	274	Purple
277	Tergeo	172	1	275	None
278	Tickling Hex	173	5	233	Purple
279	Toenail-growing hex	2	5	276	\N
280	Transmogrifian Torture	2	7	277	\N
281	Trip Jinx	2	6	278	\N
282	Twitchy-Ears Hex	2	5	279	\N
283	Unbreakable Charm	2	1	280	\N
284	Unbreakable Vow	2	3	281	Red
285	Unsupported flight	2	3	282	\N
286	Vacuum cleaner spell	2	1	283	None
287	Ventus Jinx	174	6	284	Grey
288	Ventus Duo	175	6	285	\N
289	Vera Verto	176	10	286	Crystal clear
290	Verdillious	177	1	287	Green
291	Verdimillious Charm	178	1	288	Green
292	Verdimillious Duo Spell	178	1	288	Green
293	Vermiculus Jinx	179	6	289	Yellow
294	Red Sparks	180	1	290	Red
295	Snake-Vanishing Spell	181	32	291	Black smoke
296	Vulnera Sanentur	182	33	292	None
297	Waddiwasi	183	6	293	None
298	Washing up spell	2	1	294	None
299	Levitation Charm	184	1	295	None
300	White sparks	2	1	28	White
301	Episkey	185	12	296	None
\.


--
-- Data for Name: wands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wands (wand_id, description) FROM stdin;
1	11"  Holly  phoenix feather
2	12" Ash unicorn tail hair
3	10¾"  vine wood dragon heartstring
4	15" Elder Thestral tail hair core
5	16"  Oak unknown core
6	13" Cherry unicorn hair
7	Unknown
8	10¼"  Willow  unknown core
9	11"  Mahogany  unknown core
10	10¼" Cypress unicorn hair
11	9¼" Chestnut dragon heartstring
12	12"  Ash unicorn tail hair
13	9½" Fir dragon heartstring
14	9" Alder unicorn hair bendy
15	9" Cherry dragon heartstring
16	9 ½” hazel unicorn hair core
17	12¾" Hornbeam dragon heartstring
18	10" Hawthorn unicorn hair
19	12¾" Walnut dragon heartstring
20	8" Birch dragon heartstring
21	10¼" Cedar dragon heartstring fairly flexible
22	Elm and dragon heartstring
23	13½" Yew phoenix feather core
24	snakewood, Basilisk horn
25	12¼", Ash, unicorn hair
26	Inherited by his son, Neville. It was broken in battle at the Department of Mysteries.
27	9½", Rosewood, veela hair
28	10¼", Hornbeam, dragon heartstring
29	15", Elder, Thestral tail hair core
\.


--
-- Name: blood_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blood_statuses_id_seq', 1, false);


--
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.characters_id_seq', 1, false);


--
-- Name: effects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.effects_id_seq', 1, false);


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.houses_id_seq', 1, false);


--
-- Name: incantations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.incantations_id_seq', 1, false);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 1, false);


--
-- Name: potions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.potions_id_seq', 1, false);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.species_id_seq', 1, false);


--
-- Name: spell_effects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.spell_effects_id_seq', 1, false);


--
-- Name: spell_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.spell_types_id_seq', 1, false);


--
-- Name: spells_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.spells_id_seq', 1, false);


--
-- Name: wands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wands_id_seq', 1, false);


--
-- Name: blood_statuses blood_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blood_statuses
    ADD CONSTRAINT blood_statuses_pkey PRIMARY KEY (id);


--
-- Name: blood_statuses blood_statuses_status_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blood_statuses
    ADD CONSTRAINT blood_statuses_status_key UNIQUE (status);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: effects effects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effects
    ADD CONSTRAINT effects_pkey PRIMARY KEY (id);


--
-- Name: houses houses_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_name_key UNIQUE (name);


--
-- Name: houses houses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- Name: incantation_types incantation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation_types
    ADD CONSTRAINT incantation_types_pkey PRIMARY KEY (incantation_id, type_id);


--
-- Name: incantations incantations_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantations
    ADD CONSTRAINT incantations_name_key UNIQUE (name);


--
-- Name: incantations incantations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantations
    ADD CONSTRAINT incantations_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_name_key UNIQUE (name);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: potions_ingredients potions_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.potions_ingredients
    ADD CONSTRAINT potions_ingredients_pkey PRIMARY KEY (potion_id, ingredient_id);


--
-- Name: potions potions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.potions
    ADD CONSTRAINT potions_pkey PRIMARY KEY (id);


--
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: spell_effects spell_effects_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spell_effects
    ADD CONSTRAINT spell_effects_name_key UNIQUE (name);


--
-- Name: spell_effects spell_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spell_effects
    ADD CONSTRAINT spell_effects_pkey PRIMARY KEY (id);


--
-- Name: spell_types spell_types_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spell_types
    ADD CONSTRAINT spell_types_name_key UNIQUE (name);


--
-- Name: spell_types spell_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spell_types
    ADD CONSTRAINT spell_types_pkey PRIMARY KEY (id);


--
-- Name: spells spells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spells
    ADD CONSTRAINT spells_pkey PRIMARY KEY (id);


--
-- Name: wands wands_description_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wands
    ADD CONSTRAINT wands_description_key UNIQUE (description);


--
-- Name: wands wands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wands
    ADD CONSTRAINT wands_pkey PRIMARY KEY (wand_id);


--
-- Name: characters characters_house_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_house_id_fkey FOREIGN KEY (house_id) REFERENCES public.houses(id);


--
-- Name: characters_houses characters_houses_house_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters_houses
    ADD CONSTRAINT characters_houses_house_id_fkey FOREIGN KEY (house_id) REFERENCES public.houses(id);


--
-- Name: characters characters_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- Name: incantation_types incantation_types_incantation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation_types
    ADD CONSTRAINT incantation_types_incantation_id_fkey FOREIGN KEY (incantation_id) REFERENCES public.incantations(id);


--
-- Name: incantation_types incantation_types_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation_types
    ADD CONSTRAINT incantation_types_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.spell_types(id);


--
-- Name: potions_ingredients potions_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.potions_ingredients
    ADD CONSTRAINT potions_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- Name: potions_ingredients potions_ingredients_potion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.potions_ingredients
    ADD CONSTRAINT potions_ingredients_potion_id_fkey FOREIGN KEY (potion_id) REFERENCES public.potions(id);


--
-- PostgreSQL database dump complete
--

