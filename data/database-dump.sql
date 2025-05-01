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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    surname text,
    given_name text,
    birth_year integer,
    death_year integer
);


--
-- Name: blood_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blood_status (
    id integer NOT NULL,
    name text
);


--
-- Name: blood_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blood_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blood_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blood_status_id_seq OWNED BY public.blood_status.id;


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
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title text,
    publication_year integer
);


--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books_authors (
    book_id integer,
    author_id integer
);


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
-- Name: effect; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.effect (
    id integer NOT NULL,
    description text
);


--
-- Name: effect_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.effect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: effect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.effect_id_seq OWNED BY public.effect.id;


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
-- Name: house; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.house (
    id integer NOT NULL,
    name text
);


--
-- Name: house_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.house_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: house_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.house_id_seq OWNED BY public.house.id;


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
-- Name: incantation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incantation (
    id integer NOT NULL,
    name text
);


--
-- Name: incantation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.incantation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: incantation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.incantation_id_seq OWNED BY public.incantation.id;


--
-- Name: incantation_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incantation_type (
    incantation_id integer NOT NULL,
    type_id integer NOT NULL
);


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
-- Name: type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name text
);


--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- Name: wand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wand (
    id integer NOT NULL,
    description text
);


--
-- Name: wand_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wand_id_seq OWNED BY public.wand.id;


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
-- Name: blood_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blood_status ALTER COLUMN id SET DEFAULT nextval('public.blood_status_id_seq'::regclass);


--
-- Name: blood_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blood_statuses ALTER COLUMN id SET DEFAULT nextval('public.blood_statuses_id_seq'::regclass);


--
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- Name: effect id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effect ALTER COLUMN id SET DEFAULT nextval('public.effect_id_seq'::regclass);


--
-- Name: effects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effects ALTER COLUMN id SET DEFAULT nextval('public.effects_id_seq'::regclass);


--
-- Name: house id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.house ALTER COLUMN id SET DEFAULT nextval('public.house_id_seq'::regclass);


--
-- Name: houses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public.houses_id_seq'::regclass);


--
-- Name: incantation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation ALTER COLUMN id SET DEFAULT nextval('public.incantation_id_seq'::regclass);


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
-- Name: type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- Name: wand id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wand ALTER COLUMN id SET DEFAULT nextval('public.wand_id_seq'::regclass);


--
-- Name: wands wand_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wands ALTER COLUMN wand_id SET DEFAULT nextval('public.wands_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authors (id, surname, given_name, birth_year, death_year) FROM stdin;
0	Willis	Connie	1945	\N
1	Christie	Agatha	1890	1976
2	Morrison	Toni	1931	\N
3	Conger	Kate	1989	\N
4	Mac	Ryan	\N	\N
5	Lewis	Sinclair	1885	1951
6	Austen	Jane	1775	1817
7	Brontë	Charlotte	1816	1855
8	Wodehouse	P.G.	1881	1975
9	Márquez	Gabriel García	1927	2014
10	Kritzer	Naomi	1973	\N
11	Bujold	Lois McMaster	1949	\N
12	Melville	Herman	1819	1891
13	Sterne	Laurence	1713	1768
14	Osman	Richard	1970	\N
15	Brontë	Ann	1820	1849
16	Brontë	Emily	1818	1848
\.


--
-- Data for Name: blood_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blood_status (id, name) FROM stdin;
\.


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
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.books (id, title, publication_year) FROM stdin;
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.books_authors (book_id, author_id) FROM stdin;
\.


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.characters (id, name, gender, job, house_id, wand_id, patronus, species_id, blood_status_id, hair_color) FROM stdin;
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
-- Data for Name: effect; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.effect (id, description) FROM stdin;
\.


--
-- Data for Name: effects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.effects (id, name) FROM stdin;
\.


--
-- Data for Name: house; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.house (id, name) FROM stdin;
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
-- Data for Name: incantation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.incantation (id, name) FROM stdin;
\.


--
-- Data for Name: incantation_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.incantation_type (incantation_id, type_id) FROM stdin;
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
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.type (id, name) FROM stdin;
\.


--
-- Data for Name: wand; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wand (id, description) FROM stdin;
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
-- Name: blood_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blood_status_id_seq', 1, false);


--
-- Name: blood_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blood_statuses_id_seq', 1, false);


--
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.characters_id_seq', 1, false);


--
-- Name: effect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.effect_id_seq', 1, false);


--
-- Name: effects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.effects_id_seq', 1, false);


--
-- Name: house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.house_id_seq', 1, false);


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.houses_id_seq', 1, false);


--
-- Name: incantation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.incantation_id_seq', 1, false);


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
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.type_id_seq', 1, false);


--
-- Name: wand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wand_id_seq', 1, false);


--
-- Name: wands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wands_id_seq', 1, false);


--
-- Name: blood_status blood_status_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blood_status
    ADD CONSTRAINT blood_status_name_key UNIQUE (name);


--
-- Name: blood_status blood_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blood_status
    ADD CONSTRAINT blood_status_pkey PRIMARY KEY (id);


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
-- Name: effect effect_description_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effect
    ADD CONSTRAINT effect_description_key UNIQUE (description);


--
-- Name: effect effect_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effect
    ADD CONSTRAINT effect_pkey PRIMARY KEY (id);


--
-- Name: effects effects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effects
    ADD CONSTRAINT effects_pkey PRIMARY KEY (id);


--
-- Name: house house_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_name_key UNIQUE (name);


--
-- Name: house house_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_pkey PRIMARY KEY (id);


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
-- Name: incantation incantation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation
    ADD CONSTRAINT incantation_name_key UNIQUE (name);


--
-- Name: incantation incantation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation
    ADD CONSTRAINT incantation_pkey PRIMARY KEY (id);


--
-- Name: incantation_type incantation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation_type
    ADD CONSTRAINT incantation_type_pkey PRIMARY KEY (incantation_id, type_id);


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
-- Name: type type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_name_key UNIQUE (name);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- Name: wand wand_description_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wand
    ADD CONSTRAINT wand_description_key UNIQUE (description);


--
-- Name: wand wand_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wand
    ADD CONSTRAINT wand_pkey PRIMARY KEY (id);


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
-- Name: characters characters_blood_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_blood_status_id_fkey FOREIGN KEY (blood_status_id) REFERENCES public.blood_status(id);


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
-- Name: incantation_type incantation_type_incantation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation_type
    ADD CONSTRAINT incantation_type_incantation_id_fkey FOREIGN KEY (incantation_id) REFERENCES public.incantation(id);


--
-- Name: incantation_type incantation_type_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incantation_type
    ADD CONSTRAINT incantation_type_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(id);


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
-- Name: spells spells_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spells
    ADD CONSTRAINT spells_effect_id_fkey FOREIGN KEY (effect_id) REFERENCES public.effect(id);


--
-- Name: spells spells_incantation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spells
    ADD CONSTRAINT spells_incantation_id_fkey FOREIGN KEY (incantation_id) REFERENCES public.incantation(id);


--
-- Name: spells spells_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spells
    ADD CONSTRAINT spells_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(id);


--
-- PostgreSQL database dump complete
--

