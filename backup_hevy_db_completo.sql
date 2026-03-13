--
-- PostgreSQL database dump
--

\restrict 1o7C5BePIUBjf5ueLXwxh1UJQHC41PDYWirz7jFkzi2SjhzFO1l1kSMtUbdpM9W

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-1.pgdg13+1)

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

ALTER TABLE ONLY public.workout_set DROP CONSTRAINT workout_set_workout_id_fkey;
ALTER TABLE ONLY public.workout_set DROP CONSTRAINT workout_set_exercise_id_fkey;
ALTER TABLE ONLY public.exercise_muscle_map DROP CONSTRAINT exercise_muscle_map_muscle_id_fkey;
ALTER TABLE ONLY public.exercise_muscle_map DROP CONSTRAINT exercise_muscle_map_exercise_id_fkey;
ALTER TABLE ONLY public.workout_set DROP CONSTRAINT workout_set_pkey;
ALTER TABLE ONLY public.workout DROP CONSTRAINT workout_pkey;
ALTER TABLE ONLY public.muscle DROP CONSTRAINT muscle_pkey;
ALTER TABLE ONLY public.muscle DROP CONSTRAINT muscle_name_key;
ALTER TABLE ONLY public.exercise DROP CONSTRAINT exercise_pkey;
ALTER TABLE ONLY public.exercise DROP CONSTRAINT exercise_name_key;
ALTER TABLE ONLY public.exercise_muscle_map DROP CONSTRAINT exercise_muscle_map_pkey;
ALTER TABLE public.workout_set ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.workout ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.muscle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.exercise ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.workout_set_id_seq;
DROP TABLE public.workout_set;
DROP SEQUENCE public.workout_id_seq;
DROP TABLE public.workout;
DROP SEQUENCE public.muscle_id_seq;
DROP TABLE public.muscle;
DROP TABLE public.exercise_muscle_map;
DROP SEQUENCE public.exercise_id_seq;
DROP TABLE public.exercise;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: exercise; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.exercise (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.exercise OWNER TO "user";

--
-- Name: exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_id_seq OWNER TO "user";

--
-- Name: exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.exercise_id_seq OWNED BY public.exercise.id;


--
-- Name: exercise_muscle_map; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.exercise_muscle_map (
    exercise_id integer NOT NULL,
    muscle_id integer NOT NULL,
    multiplier double precision
);


ALTER TABLE public.exercise_muscle_map OWNER TO "user";

--
-- Name: muscle; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.muscle (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.muscle OWNER TO "user";

--
-- Name: muscle_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.muscle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.muscle_id_seq OWNER TO "user";

--
-- Name: muscle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.muscle_id_seq OWNED BY public.muscle.id;


--
-- Name: workout; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.workout (
    id integer NOT NULL,
    name character varying,
    date timestamp without time zone,
    gym character varying
);


ALTER TABLE public.workout OWNER TO "user";

--
-- Name: workout_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.workout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workout_id_seq OWNER TO "user";

--
-- Name: workout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.workout_id_seq OWNED BY public.workout.id;


--
-- Name: workout_set; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.workout_set (
    id integer NOT NULL,
    workout_id integer,
    exercise_id integer,
    set_order integer,
    reps integer,
    weight double precision,
    set_type character varying
);


ALTER TABLE public.workout_set OWNER TO "user";

--
-- Name: workout_set_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.workout_set_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workout_set_id_seq OWNER TO "user";

--
-- Name: workout_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.workout_set_id_seq OWNED BY public.workout_set.id;


--
-- Name: exercise id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.exercise ALTER COLUMN id SET DEFAULT nextval('public.exercise_id_seq'::regclass);


--
-- Name: muscle id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.muscle ALTER COLUMN id SET DEFAULT nextval('public.muscle_id_seq'::regclass);


--
-- Name: workout id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.workout ALTER COLUMN id SET DEFAULT nextval('public.workout_id_seq'::regclass);


--
-- Name: workout_set id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.workout_set ALTER COLUMN id SET DEFAULT nextval('public.workout_set_id_seq'::regclass);


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.exercise (id, name) FROM stdin;
1	Pullover (Machine)
2	Lateral Raise (Machine)
3	Triceps Extension (Cable)
4	Leg Press Horizontal (Machine)
5	Standing Calf Raise (Smith)
6	Back Extension (Hyperextension)
7	Leg Extension (Machine)
8	Incline Chest Press (Machine)
9	Upright Row (Barbell)
10	Back Extension (Weighted Hyperextension)
11	Triceps Dip
12	Seated Calf Raise
13	Lying Leg Curl (Machine)
14	Bicep Curl (Cable)
15	Triceps Pushdown
16	Lateral Raise (Dumbbell)
17	Knee Raise Parallel Bars
18	Shoulder Press (Machine Plates)
19	Chest Fly (Machine)
20	Standing Calf Raise (Machine)
21	Iso-Lateral High Row (Machine)
22	Hip Abduction (Machine)
23	Chest Supported Incline Row (Dumbbell)
24	Calf Press (Machine)
25	Single Leg Extensions
26	Lunge (Barbell)
27	Seated Dip Machine
28	Hammer Curl (Dumbbell)
29	Chest Press (Machine)
30	Upright Row (Cable)
31	Rear Delt Reverse Fly (Machine)
32	Chin Up
33	Lat Pulldown (Cable)
34	Seated Cable Row - Bar Wide Grip
35	Deadlift (Smith Machine)
36	Chest Supported Reverse Fly (Dumbbell)
37	Decline Bench Press (Machine)
38	EZ Bar Biceps Curl
39	Cable Fly Crossovers
40	Pullover (Dumbbell)
41	Seated Leg Curl (Machine)
42	Bench Press (Barbell)
43	Iso-Lateral Low Row
44	Lat Pulldown (Machine)
45	Standing Leg Curls
46	Seated Cable Row - Bar Grip
47	Hack Squat (Machine)
48	Lateral Raise (Cable)
49	Single Arm Triceps Pushdown (Cable)
50	Sissy Squat (Weighted)
51	Triceps Pressdown
52	Behind the Back Bicep Wrist Curl (Barbell)
53	Iso-Lateral Row (Machine)
54	Bent Over Row (Barbell)
55	Overhead Press (Smith Machine)
56	Leg Raise Parallel Bars
57	Pull Up (Assisted)
58	Incline Bench Press (Barbell)
59	Romanian Deadlift (Barbell)
60	Chest Dip (Assisted)
61	Pendulum Squat (Machine)
62	Decline Crunch
63	Hip Thrust (Machine)
64	Preacher Curl (Dumbbell)
65	Seated Incline Curl (Dumbbell)
66	Hammer Curl (Cable)
67	Preacher Curl (Barbell)
68	Hip Adduction (Machine)
69	Triceps Dip (Assisted)
70	Crunch (Machine)
71	Lunge (Dumbbell)
72	Shrug (Cable)
73	Deadlift (Trap bar)
74	Butterfly (Pec Deck)
75	Push Up
76	Seated Shoulder Press (Machine)
77	Pull Up
78	Preacher Curl (Machine)
79	Bicep Curl (Dumbbell)
80	Bench Press (Dumbbell)
81	Low Cable Fly Crossovers
82	Rear Delt Reverse Fly (Cable)
83	Chest Dip
84	Rope Straight Arm Pulldown
85	Face Pull
86	Triceps Rope Pushdown
87	Overhead Press (Dumbbell)
88	Single Leg Press (Machine)
89	Bench Press (Cable)
90	Leg Press (Machine)
91	Straight Leg Deadlift
92	Deadlift (Barbell)
93	Skullcrusher (Dumbbell)
94	Romanian Deadlift (Dumbbell)
95	Incline Bench Press (Dumbbell)
96	Chest Fly (Dumbbell)
97	Bicep Curl (Barbell)
98	Triceps Extension (Dumbbell)
99	Overhead Press (Barbell)
100	Seated Chest Flys (Cable)
101	Triceps Dip (Weighted)
102	Squat (Smith Machine)
103	Skullcrusher (Barbell)
104	Reverse Curl (Cable)
105	Treadmill
106	Stair Machine (Floors)
107	Cable Crunch
108	Chin Up (Weighted)
109	Reverse Grip Lat Pulldown (Cable)
110	Shrug (Machine)
111	Bulgarian Split Squat
112	Reverse Curl (Barbell)
113	Shrug (Barbell)
114	Upright Row (Dumbbell)
\.


--
-- Data for Name: exercise_muscle_map; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.exercise_muscle_map (exercise_id, muscle_id, multiplier) FROM stdin;
\.


--
-- Data for Name: muscle; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.muscle (id, name) FROM stdin;
\.


--
-- Data for Name: workout; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.workout (id, name, date, gym) FROM stdin;
1	Treinamento noturno 🏋️	2026-03-03 22:00:00	Boa Forma
2	Treinamento de madrugada 🌙	2026-03-02 22:42:00	Skyfit
3	Treinamento noturno 🏋️	2026-02-26 20:25:00	Boa Forma
4	Treinamento noturno 🏋️	2026-02-24 21:14:00	Skyfit
5	Treinamento noturno 🏋️	2026-02-20 22:11:00	Skyfit
6	Treinamento noturno 🏋️	2026-02-19 22:11:00	Boa Forma
7	Treinamento de madrugada 🌙	2026-02-06 22:35:00	Skyfit
8	Treinamento noturno 🏋️	2026-01-29 20:07:00	Boa Forma
9	Treinamento da tarde 💪	2026-01-25 17:54:00	Outra
10	Treinamento noturno 🏋️	2026-01-22 21:23:00	Boa Forma
11	Treinamento noturno 🏋️	2026-01-20 21:27:00	Skyfit
12	Treinamento de madrugada 🌙	2026-01-13 22:39:00	Skyfit
13	Treinamento da tarde 💪	2026-01-11 17:38:00	Outra
14	Treinamento de madrugada 🌙	2026-01-07 21:58:00	Boa Forma
15	Treinamento de madrugada 🌙	2026-01-05 22:55:00	Skyfit
16	Treinamento noturno 🏋️	2026-01-02 21:39:00	Boa Forma
17	Treinamento noturno 🏋️	2025-12-30 22:18:00	Boa Forma
18	Treinamento noturno 🏋️	2025-12-26 22:22:00	Boa Forma
19	Treinamento noturno 🏋️	2025-12-23 22:22:00	Boa Forma
20	Treinamento noturno 🏋️	2025-12-19 22:18:00	Boa Forma
21	Treinamento de madrugada 🌙	2025-12-15 21:40:00	Skyfit
22	Treinamento noturno 🏋️	2025-12-12 21:22:00	Boa Forma
23	Treinamento de madrugada 🌙	2025-12-10 22:36:00	Skyfit
24	Treinamento noturno 🏋️	2025-12-09 20:59:00	Skyfit
25	Treinamento da tarde 💪	2025-12-06 16:27:00	Skyfit
26	Treinamento de madrugada 🌙	2025-12-01 22:18:00	Outra
27	Treinamento de madrugada 🌙	2025-11-25 22:13:00	Boa Forma
28	Treinamento noturno 🏋️	2025-11-24 21:44:00	Skyfit
29	Treinamento noturno 🏋️	2025-11-19 20:08:00	Skyfit
30	Treinamento noturno 🏋️	2025-11-17 20:10:00	Outra
31	Treinamento de madrugada 🌙	2025-11-11 22:57:00	Outra
32	Treinamento de madrugada 🌙	2025-11-10 22:34:00	Outra
33	Treinamento noturno 🏋️	2025-11-05 20:58:00	Skyfit
34	FB2(45-65 minutos)	2025-11-03 21:44:00	Outra
35	Treinamento noturno 🏋️	2025-10-30 21:32:00	Skyfit
36	Treinamento de madrugada 🌙	2025-10-28 22:41:00	Outra
37	Treinamento noturno 🏋️	2025-10-23 21:39:00	Boa Forma
38	Treinamento noturno 🏋️	2025-10-22 20:37:00	Outra
39	Treinamento noturno 🏋️	2025-10-20 20:43:00	Skyfit
40	Treinamento de madrugada 🌙	2025-10-16 22:46:00	Outra
41	Treinamento de madrugada 🌙	2025-10-14 22:16:00	Skyfit
42	Treinamento de madrugada 🌙	2025-10-13 23:07:00	Skyfit
43	Treinamento de madrugada 🌙	2025-10-09 20:46:00	Skyfit
44	Treinamento noturno 🏋️	2025-10-07 20:12:00	Skyfit
45	Treinamento noturno 🏋️	2025-10-02 20:53:00	Skyfit
46	Treinamento noturno 🏋️	2025-09-30 21:54:00	Outra
47	Treinamento noturno 🏋️	2025-09-29 21:41:00	Skyfit
48	Treinamento noturno 🏋️	2025-09-25 18:58:00	Boa Forma
49	Treinamento noturno 🏋️	2025-09-23 20:06:00	Outra
50	Treinamento da tarde 💪	2025-09-20 15:58:00	Skyfit
51	Treinamento noturno 🏋️	2025-09-18 20:28:00	Skyfit
52	Treinamento noturno 🏋️	2025-09-16 20:18:00	Skyfit
53	Treinamento noturno 🏋️	2025-09-11 18:56:00	Boa Forma
54	Treinamento noturno 🏋️	2025-09-09 19:04:00	Boa Forma
55	Treinamento noturno 🏋️	2025-09-04 20:40:00	Skyfit
56	Treinamento noturno 🏋️	2025-09-02 19:06:00	Skyfit
57	Treinamento da tarde 💪	2025-09-01 21:54:00	Skyfit
58	Treinamento da tarde 💪	2025-08-30 17:01:00	Skyfit
59	Treinamento da tarde 💪	2025-08-26 19:51:00	Skyfit
60	Treinamento noturno 🏋️	2025-08-21 21:45:00	Skyfit
61	Treinamento noturno 🏋️	2025-08-19 20:47:00	Skyfit
62	Treinamento noturno 🏋️	2025-08-18 21:20:00	Skyfit
63	Treinamento da tarde 💪	2025-08-16 15:41:00	Skyfit
64	Treinamento noturno 🏋️	2025-08-12 18:58:00	Boa Forma
65	Treinamento noturno 🏋️	2025-08-05 21:48:00	Skyfit
66	Treinamento da tarde 💪	2025-07-29 18:54:00	Boa Forma
67	Treinamento de madrugada 🌙	2025-07-28 21:34:00	Skyfit
68	Treinamento da tarde 💪	2025-07-25 17:29:00	Boa Forma
69	Treinamento noturno 🏋️	2025-07-22 19:03:00	Boa Forma
70	Treinamento da tarde 💪	2025-07-17 17:38:00	Boa Forma
71	Treinamento da tarde 💪	2025-07-16 19:40:00	Skyfit
72	Treinamento da tarde 💪	2025-07-14 17:12:00	Boa Forma
73	Treinamento da tarde 💪	2025-07-10 18:41:00	Boa Forma
74	Treinamento da tarde 💪	2025-07-05 14:19:00	Skyfit
75	Treinamento de madrugada 🌙	2025-07-03 22:15:00	Outra
76	Treinamento de madrugada 🌙	2025-07-01 22:35:00	Skyfit
77	Treinamento da tarde 💪	2025-06-29 14:25:00	Skyfit
78	Treinamento noturno 🏋️	2025-06-27 19:50:00	Outra
79	Treinamento da tarde 💪	2025-06-20 17:54:00	Skyfit
80	Treinamento noturno 🏋️	2025-06-18 20:29:00	Skyfit
81	Treinamento de madrugada 🌙	2025-06-17 22:11:00	Outra
82	Treinamento noturno 🏋️	2025-06-16 19:30:00	Boa Forma
83	Treinamento de madrugada 🌙	2025-06-10 22:17:00	Skyfit
84	Treinamento de madrugada 🌙	2025-06-09 22:41:00	Skyfit
85	Treinamento noturno 🏋️	2025-06-06 18:49:00	Outra
86	Treinamento noturno 🏋️	2025-06-03 19:06:00	Skyfit
87	Treinamento da tarde 💪	2025-06-02 18:19:00	Outra
88	Treinamento da tarde 💪	2025-05-31 17:27:00	Skyfit
89	Treinamento noturno 🏋️	2025-05-29 19:26:00	Outra
90	Treinamento de madrugada 🌙	2025-05-27 22:34:00	Skyfit
91	Treinamento noturno 🏋️	2025-05-26 19:42:00	Outra
92	Treinamento noturno 🏋️	2025-05-23 19:32:00	Outra
93	Treinamento de madrugada 🌙	2025-05-21 22:45:00	Outra
94	Treinamento de madrugada 🌙	2025-05-20 21:55:00	Skyfit
95	Treinamento de madrugada 🌙	2025-05-19 23:23:00	Skyfit
96	Treinamento da tarde 💪	2025-05-17 14:44:00	Outra
97	Treinamento noturno 🏋️	2025-05-16 22:17:00	Outra
98	Treinamento de madrugada 🌙	2025-05-13 21:56:00	Outra
99	Treinamento noturno 🏋️	2025-05-12 19:29:00	Outra
100	Treinamento de madrugada 🌙	2025-05-06 21:45:00	Skyfit
101	Treinamento noturno 🏋️	2025-05-05 21:34:00	Outra
102	Treinamento da tarde 💪	2025-05-03 15:34:00	Skyfit
103	Treinamento noturno 🏋️	2025-04-29 18:40:00	Outra
104	Treinamento de madrugada 🌙	2025-04-28 21:46:00	Outra
105	Treinamento de madrugada 🌙	2025-04-25 21:53:00	Skyfit
106	Treinamento noturno 🏋️	2025-04-23 18:36:00	Outra
107	Treinamento de madrugada 🌙	2025-04-22 22:48:00	Outra
108	Treinamento da tarde 💪	2025-04-21 14:16:00	Outra
109	Treinamento da tarde 💪	2025-04-19 17:01:00	Skyfit
110	Treinamento de madrugada 🌙	2025-04-15 23:16:00	Outra
111	Treinamento noturno 🏋️	2025-04-14 20:34:00	Skyfit
112	Treinamento de madrugada 🌙	2025-04-10 23:16:00	Outra
113	Treinamento de madrugada 🌙	2025-04-08 22:36:00	Outra
114	Treinamento noturno 🏋️	2025-04-07 21:23:00	Outra
115	Treinamento de madrugada 🌙	2025-04-04 21:40:00	Outra
116	Treinamento da tarde 💪	2025-04-03 18:36:00	Outra
117	Treinamento de madrugada 🌙	2025-04-01 22:42:00	Skyfit
118	Treinamento noturno 🏋️	2025-03-31 20:06:00	Outra
119	Treinamento noturno 🏋️	2025-03-27 19:14:00	Skyfit
120	Treinamento de madrugada 🌙	2025-03-25 22:43:00	Outra
121	Treinamento de madrugada 🌙	2025-03-24 22:07:00	Outra
122	Treinamento noturno 🏋️	2025-03-21 22:34:00	Outra
123	Treinamento noturno 🏋️	2025-03-19 22:17:00	Outra
124	Treinamento da tarde 💪	2025-03-18 19:02:00	Skyfit
125	Treinamento noturno 🏋️	2025-03-14 21:12:00	Outra
126	Treinamento noturno 🏋️	2025-03-13 19:48:00	Outra
127	Treinamento noturno 🏋️	2025-03-11 19:44:00	Skyfit
128	Treinamento noturno 🏋️	2025-03-10 19:48:00	Outra
129	Treinamento da tarde 💪	2025-03-09 14:04:00	Skyfit
130	Treinamento noturno 🏋️	2025-03-07 21:42:00	Skyfit
131	Treinamento noturno 🏋️	2025-03-06 19:52:00	Outra
132	Treinamento noturno 🏋️	2025-03-05 20:59:00	Outra
133	Treinamento noturno 🏋️	2025-03-03 21:28:00	Outra
134	Treinamento noturno 🏋️	2025-02-26 20:49:00	Skyfit
135	Treinamento de madrugada 🌙	2025-02-25 22:08:00	Skyfit
136	Treinamento noturno 🏋️	2025-02-21 19:10:00	Outra
137	Treinamento noturno 🏋️	2025-02-20 20:41:00	Skyfit
138	Treinamento noturno 🏋️	2025-02-17 21:07:00	Outra
139	Treinamento Matinal ☀️	2025-02-16 12:29:00	Skyfit
140	Treinamento de madrugada 🌙	2025-02-12 21:51:00	Outra
141	Treinamento da tarde 💪	2025-02-11 19:03:00	Skyfit
142	Treinamento da tarde 💪	2025-02-09 13:49:00	Skyfit
143	Treinamento noturno 🏋️	2025-02-05 19:02:00	Skyfit
144	Treinamento de madrugada 🌙	2025-02-04 21:18:00	Skyfit
145	Treinamento da tarde 💪	2025-02-01 17:20:00	Outra
146	Treinamento noturno 🏋️	2025-01-30 19:15:00	Skyfit
147	Treinamento noturno 🏋️	2025-01-29 19:28:00	Skyfit
148	Treinamento da tarde 💪	2025-01-27 18:56:00	Skyfit
149	Treinamento da tarde 💪	2025-01-26 13:12:00	Skyfit
150	Treinamento de madrugada 🌙	2025-01-24 22:10:00	Skyfit
151	Treinamento noturno 🏋️	2025-01-22 19:08:00	Bem Estar
152	Treinamento da tarde 💪	2025-01-20 18:35:00	Bem Estar
153	Treinamento Matinal ☀️	2025-01-19 12:36:00	Skyfit
154	Treinamento noturno 🏋️	2025-01-16 19:22:00	Bem Estar
155	Treinamento noturno 🏋️	2025-01-15 21:05:00	Skyfit
156	Treinamento da tarde 💪	2025-01-13 18:54:00	Boa Forma
157	Treinamento Matinal ☀️	2025-01-11 11:42:00	Outra
158	Hoje	2025-01-09 20:12:00	Skyfit
159	Treinamento da tarde 💪	2025-01-07 18:42:00	Outra
160	Treinamento da tarde 💪	2024-12-01 14:05:00	Skyfit
161	Treinamento noturno 🏋️	2024-11-28 19:40:00	Skyfit
162	Treinamento noturno 🏋️	2024-11-27 18:54:00	Skyfit
163	Treinamento da tarde 💪	2024-11-26 19:11:00	Skyfit
164	Treinamento da tarde 💪	2024-11-25 19:08:00	Outra
165	L	2024-11-23 16:17:00	Outra
166	U1	2024-11-22 18:41:00	Outra
167	Treinamento da tarde 💪	2024-11-15 14:15:00	Skyfit
\.


--
-- Data for Name: workout_set; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.workout_set (id, workout_id, exercise_id, set_order, reps, weight, set_type) FROM stdin;
1	1	1	\N	6	12.5	warmup
2	1	1	\N	6	25	warmup
3	1	1	\N	10	30	failure
4	1	1	\N	7	30	failure
5	1	1	\N	6	30	dropset
6	1	2	\N	6	15	warmup
7	1	2	\N	4	20	warmup
8	1	2	\N	7	25	normal
9	1	2	\N	11	20	normal
10	1	3	\N	5	20	warmup
11	1	3	\N	3	22.5	warmup
12	1	3	\N	8	25	normal
13	1	3	\N	8	20	normal
14	2	4	\N	8	85	warmup
15	2	4	\N	10	110	warmup
16	2	4	\N	9	65	normal
17	2	4	\N	10	65	normal
18	2	5	\N	9	60	warmup
19	2	5	\N	11	80	normal
20	2	5	\N	11	80	normal
21	2	6	\N	20	94	normal
22	2	6	\N	20	94	normal
23	3	7	\N	5	20	warmup
24	3	7	\N	6	30	warmup
25	3	7	\N	5	40	warmup
26	3	7	\N	10	50	normal
27	3	7	\N	10	50	normal
28	3	1	\N	6	20	warmup
29	3	1	\N	6	25	warmup
30	3	1	\N	10	30	failure
31	3	1	\N	6	30	failure
32	3	1	\N	5	30	dropset
33	3	8	\N	6	20	warmup
34	3	8	\N	3	30	warmup
35	3	8	\N	2	30	failure
36	3	8	\N	10	20	normal
37	3	8	\N	11	20	failure
38	3	9	\N	8	15	normal
39	3	9	\N	10	25	normal
40	3	9	\N	15	15	normal
41	4	10	\N	13	94	normal
42	4	10	\N	6	20	warmup
43	4	10	\N	9	25	normal
44	4	10	\N	9	25	normal
45	4	11	\N	8	94	warmup
46	4	11	\N	12	94	normal
47	4	12	\N	6	35	warmup
48	4	12	\N	3	55	warmup
49	4	12	\N	8	55	normal
50	4	12	\N	7	55	normal
51	4	12	\N	7	45	dropset
52	4	12	\N	6	40	dropset
53	4	13	\N	6	35	warmup
54	4	13	\N	3	55	warmup
55	4	13	\N	8	55	normal
56	4	13	\N	8	55	failure
57	4	13	\N	7	45	dropset
58	4	3	\N	8	15	warmup
59	4	3	\N	3	22.5	warmup
60	4	3	\N	8	22.5	normal
61	4	3	\N	8	22.5	normal
62	4	14	\N	6	22.5	warmup
63	4	14	\N	3	25	warmup
64	4	14	\N	8	27.5	normal
65	4	14	\N	6	27.5	failure
66	4	15	\N	8	27.5	normal
67	4	2	\N	5	12.5	warmup
68	4	2	\N	4	15	warmup
69	4	2	\N	4	15	warmup
70	4	2	\N	4	15	warmup
71	4	2	\N	4	15	normal
72	4	2	\N	4	15	warmup
73	4	2	\N	4	15	normal
74	4	16	\N	10	12	failure
75	5	10	\N	12	94	normal
76	5	10	\N	12	15	normal
77	5	17	\N	12	94	normal
78	5	17	\N	12	94	normal
79	5	18	\N	6	17.5	warmup
80	5	18	\N	6	22.5	normal
81	5	18	\N	8	27.5	failure
82	5	18	\N	8	27.5	normal
83	5	18	\N	8	22.5	normal
84	5	19	\N	8	60	warmup
85	5	19	\N	4	70	warmup
86	5	19	\N	4	70	warmup
87	5	19	\N	4	70	dropset
88	5	19	\N	4	55	warmup
89	5	19	\N	4	55	warmup
90	5	19	\N	4	55	failure
91	5	13	\N	6	35	warmup
92	5	13	\N	5	45	warmup
93	5	13	\N	2	55	warmup
94	5	13	\N	7	55	normal
95	5	13	\N	7	55	normal
96	5	2	\N	5	12.5	warmup
97	5	2	\N	4	15	warmup
98	5	2	\N	4	15	warmup
99	5	2	\N	4	15	warmup
100	5	2	\N	4	15	dropset
101	5	2	\N	4	12.5	warmup
102	5	2	\N	4	12.5	failure
103	6	1	\N	8	15	warmup
104	6	1	\N	6	25	warmup
105	6	1	\N	10	30	normal
106	6	1	\N	4	30	warmup
107	6	1	\N	4	30	warmup
108	6	1	\N	4	30	warmup
109	6	1	\N	4	30	dropset
110	6	1	\N	4	25	warmup
111	6	1	\N	4	25	warmup
112	6	1	\N	4	25	failure
113	6	20	\N	9	50	warmup
114	6	20	\N	5	65	warmup
115	6	20	\N	12	65	normal
116	6	20	\N	12	65	normal
117	6	20	\N	8	65	normal
118	6	21	\N	5	15	warmup
119	6	21	\N	3	22.5	warmup
120	6	21	\N	8	27.5	normal
121	6	21	\N	7	27.5	normal
122	6	22	\N	8	40	normal
123	6	22	\N	10	40	normal
124	6	22	\N	20	30	normal
125	6	22	\N	20	30	normal
126	7	8	\N	8	20	warmup
127	7	8	\N	8	25	warmup
128	7	8	\N	7	30	normal
129	7	8	\N	5	30	normal
130	7	8	\N	4	25	warmup
131	7	8	\N	4	25	warmup
132	7	8	\N	4	25	dropset
133	7	8	\N	4	20	warmup
134	7	8	\N	4	20	warmup
135	7	8	\N	4	20	normal
136	7	23	\N	5	40	warmup
137	7	23	\N	5	45	warmup
138	7	23	\N	12	45	normal
139	7	23	\N	8	45	normal
140	7	23	\N	4	40	warmup
141	7	23	\N	4	40	warmup
142	7	23	\N	4	40	normal
143	7	23	\N	4	40	warmup
144	7	23	\N	4	40	warmup
145	7	23	\N	4	40	normal
146	7	24	\N	4	110	warmup
147	7	24	\N	4	110	warmup
148	7	24	\N	4	110	dropset
149	7	24	\N	4	100	warmup
150	7	24	\N	4	100	warmup
151	7	24	\N	4	100	normal
152	8	13	\N	6	30	warmup
153	8	13	\N	6	40	warmup
154	8	13	\N	4	50	warmup
155	8	13	\N	12	50	normal
156	8	13	\N	11	50	normal
157	8	13	\N	6	40	dropset
158	8	7	\N	9	30	warmup
159	8	7	\N	6	40	warmup
160	8	7	\N	12	46	normal
161	8	7	\N	8	46	normal
162	8	1	\N	10	5	warmup
163	8	1	\N	6	20	warmup
164	8	1	\N	5	25	warmup
165	8	1	\N	10	32	normal
166	8	1	\N	10	32	normal
167	8	1	\N	12	30	warmup
168	8	1	\N	12	24	dropset
169	8	20	\N	8	50	warmup
170	8	20	\N	10	65	normal
171	8	20	\N	10	65	normal
172	8	20	\N	13	65	normal
173	8	2	\N	10	9	normal
174	8	2	\N	10	9	normal
175	8	16	\N	10	12.5	failure
176	8	16	\N	10	12.5	failure
177	9	21	\N	10	15	warmup
178	9	21	\N	8	25	normal
179	9	21	\N	10	25	normal
180	9	23	\N	8	40	normal
181	9	23	\N	8	45	normal
182	9	23	\N	8	45	normal
183	9	22	\N	12	35	normal
184	9	22	\N	13	35	normal
185	9	22	\N	12	35	normal
186	9	25	\N	7	25	normal
187	9	25	\N	10	30	normal
188	9	25	\N	8	30	normal
189	9	26	\N	8	30	normal
190	9	26	\N	8	30	normal
191	9	18	\N	8	10	warmup
192	9	18	\N	8	15	normal
193	9	18	\N	7	20	failure
194	10	27	\N	12	60	warmup
195	10	27	\N	8	80	normal
196	10	27	\N	7	90	normal
197	10	27	\N	7	90	dropset
198	10	27	\N	8	90	normal
199	10	27	\N	6	90	dropset
200	10	28	\N	9	15	warmup
201	10	28	\N	9	20	normal
202	10	28	\N	9	20	failure
203	10	3	\N	8	25	normal
204	10	3	\N	7	25	normal
205	10	21	\N	5	22.5	warmup
206	10	21	\N	8	27.5	normal
207	10	21	\N	8	27.5	normal
208	10	21	\N	4	22.5	dropset
209	11	23	\N	12	20	warmup
210	11	23	\N	5	40	warmup
211	11	23	\N	3	45	warmup
212	11	23	\N	10	45	normal
213	11	23	\N	9	45	normal
214	11	23	\N	4	40	dropset
215	11	29	\N	8	25	warmup
216	11	29	\N	6	35	normal
217	11	29	\N	10	37.5	normal
218	11	29	\N	9	37.5	normal
219	11	29	\N	8	32.5	normal
220	11	14	\N	6	20	warmup
221	11	14	\N	13	25	normal
222	11	14	\N	9	25	normal
223	11	30	\N	10	22.5	warmup
224	11	30	\N	9	22.5	normal
225	11	30	\N	7	22.5	normal
226	11	16	\N	10	12	failure
227	11	16	\N	10	12	failure
228	11	31	\N	12	55	normal
229	11	31	\N	12	55	failure
230	11	31	\N	7	40	dropset
231	12	11	\N	5	94	warmup
232	12	11	\N	14	94	normal
233	12	11	\N	9	94	normal
234	12	32	\N	5	94	normal
235	12	32	\N	8	94	failure
236	12	6	\N	10	94	warmup
237	12	6	\N	20	94	normal
238	12	6	\N	20	94	normal
239	12	33	\N	7	65	normal
240	12	33	\N	9	60	normal
241	12	5	\N	8	60	warmup
242	12	5	\N	10	80	normal
243	12	5	\N	10	80	normal
244	12	16	\N	12	12	normal
245	12	16	\N	10	12	normal
246	12	16	\N	8	10	normal
247	12	16	\N	5	10	dropset
248	13	25	\N	6	20	normal
249	13	25	\N	8	25	normal
250	13	25	\N	8	30	normal
251	13	25	\N	9	35	normal
252	13	13	\N	8	35	warmup
253	13	13	\N	7	60	normal
254	13	13	\N	6	50	dropset
255	13	13	\N	12	50	normal
256	13	13	\N	12	50	failure
257	13	13	\N	5	40	dropset
258	13	12	\N	8	40	warmup
259	13	12	\N	11	50	normal
260	13	12	\N	10	50	normal
261	13	12	\N	5	40	dropset
262	14	18	\N	12	3	warmup
263	14	18	\N	8	10	warmup
264	14	18	\N	11	15	normal
265	14	18	\N	10	15	normal
266	14	18	\N	8	94	normal
267	14	28	\N	8	12.5	warmup
268	14	28	\N	8	15	warmup
269	14	28	\N	8	17.5	normal
270	14	28	\N	6	20	normal
271	14	28	\N	4	20	normal
272	14	28	\N	3	17.5	dropset
273	14	1	\N	8	15	warmup
274	14	1	\N	12	30	normal
275	14	1	\N	12	30	normal
276	14	1	\N	12	30	normal
277	14	27	\N	6	70	warmup
278	14	27	\N	6	90	normal
279	14	27	\N	6	90	dropset
280	14	27	\N	5	80	normal
281	14	27	\N	5	80	dropset
282	14	16	\N	12	12.5	normal
283	14	16	\N	12	10	dropset
284	15	13	\N	8	35	warmup
285	15	13	\N	12	45	normal
286	15	13	\N	12	50	normal
287	15	13	\N	10	50	normal
288	15	12	\N	8	35	warmup
289	15	12	\N	8	45	warmup
290	15	12	\N	11	50	failure
291	15	12	\N	10	50	normal
292	15	19	\N	12	55	warmup
293	15	19	\N	8	65	warmup
294	15	19	\N	12	70	normal
295	15	19	\N	10	70	normal
296	15	34	\N	8	45	warmup
297	15	34	\N	11	60	normal
298	15	34	\N	8	60	normal
299	15	34	\N	6	45	dropset
300	15	34	\N	8	50	normal
301	15	3	\N	10	7.5	normal
302	15	3	\N	7	7.5	normal
303	15	3	\N	10	5	normal
304	16	27	\N	10	60	warmup
305	16	27	\N	12	80	normal
306	16	27	\N	12	80	normal
307	16	27	\N	12	80	normal
308	16	21	\N	10	17.5	warmup
309	16	21	\N	8	25	normal
310	16	21	\N	9	27.5	normal
311	16	21	\N	8	27.5	normal
312	16	21	\N	8	22.5	normal
313	16	12	\N	10	30	warmup
314	16	12	\N	10	50	normal
315	16	12	\N	11	50	failure
316	16	12	\N	8	50	normal
317	16	12	\N	3	50	dropset
318	16	35	\N	6	40	normal
319	16	35	\N	8	80	normal
320	16	13	\N	6	50	normal
321	16	13	\N	11	50	normal
322	16	13	\N	7	50	normal
323	16	13	\N	3	40	dropset
324	16	16	\N	10	12.5	normal
325	16	16	\N	10	12.5	normal
326	16	16	\N	7	9	dropset
327	17	20	\N	8	50	warmup
328	17	20	\N	15	60	normal
329	17	20	\N	13	60	normal
330	17	20	\N	8	60	normal
331	17	21	\N	8	15	warmup
332	17	21	\N	7	22.5	warmup
333	17	21	\N	8	27.5	normal
334	17	21	\N	9	27.5	normal
335	17	8	\N	10	20	normal
336	17	8	\N	12	30	normal
337	17	8	\N	9	35	normal
338	17	8	\N	7	35	normal
339	17	36	\N	10	8	failure
340	17	36	\N	10	9	normal
341	18	21	\N	6	17.5	warmup
342	18	21	\N	6	22.5	warmup
343	18	21	\N	9	27.5	normal
344	18	21	\N	8	27.5	normal
345	18	20	\N	8	55	warmup
346	18	20	\N	12	60	normal
347	18	20	\N	12	60	normal
348	18	20	\N	12	60	normal
349	18	8	\N	10	20	normal
350	18	8	\N	6	25	normal
351	18	8	\N	6	20	normal
352	18	16	\N	15	10	normal
353	19	7	\N	9	30	warmup
354	19	7	\N	7	40	warmup
355	19	7	\N	12	46	normal
356	19	7	\N	12	46	normal
357	19	1	\N	15	20	warmup
358	19	1	\N	12	30	normal
359	19	1	\N	10	30	normal
360	19	34	\N	6	40	warmup
361	19	34	\N	10	60	normal
362	19	34	\N	8	60	normal
363	19	34	\N	4	60	dropset
364	20	7	\N	8	30	warmup
365	20	7	\N	6	40	warmup
366	20	7	\N	10	46	normal
367	20	7	\N	12	46	normal
368	20	20	\N	6	60	warmup
369	20	20	\N	12	60	normal
370	20	20	\N	11	60	normal
371	20	20	\N	12	60	normal
372	20	1	\N	12	5	warmup
373	20	1	\N	12	20	warmup
374	20	1	\N	12	30	normal
375	20	1	\N	9	30	normal
376	20	27	\N	10	80	normal
377	20	27	\N	12	80	normal
378	20	27	\N	8	80	normal
379	20	27	\N	7	70	dropset
380	20	27	\N	7	70	dropset
381	20	2	\N	10	20	normal
382	20	2	\N	10	20	normal
383	21	33	\N	9	40	warmup
384	21	33	\N	9	65	normal
385	21	33	\N	9	65	normal
386	21	33	\N	9	65	normal
387	21	37	\N	8	30	warmup
388	21	37	\N	6	45	normal
389	21	37	\N	6	50	normal
390	21	37	\N	6	45	normal
391	21	37	\N	8	40	normal
392	21	12	\N	9	30	warmup
393	21	12	\N	8	42.5	warmup
394	21	12	\N	10	50	failure
395	21	12	\N	10	50	normal
396	21	12	\N	8	50	normal
397	21	12	\N	7	40	dropset
398	21	16	\N	9	12	normal
399	21	16	\N	9	12	normal
400	21	16	\N	9	12	normal
401	21	9	\N	10	25	normal
402	21	9	\N	10	25	normal
403	21	9	\N	11	25	normal
404	21	38	\N	10	25	normal
405	21	38	\N	10	25	normal
406	21	38	\N	8	25	normal
407	22	7	\N	6	20	warmup
408	22	7	\N	8	30	warmup
409	22	7	\N	10	45	normal
410	22	7	\N	10	45	normal
411	22	20	\N	11	50	warmup
412	22	20	\N	11	60	normal
413	22	20	\N	11	60	normal
414	22	20	\N	11	60	normal
415	22	21	\N	7	20	warmup
416	22	21	\N	9	27.5	normal
417	22	21	\N	8	27.5	normal
418	22	39	\N	6	20	warmup
419	22	39	\N	12	35	normal
420	22	39	\N	15	40	normal
421	22	39	\N	15	40	normal
422	22	23	\N	10	15	normal
423	22	23	\N	15	25	normal
424	22	23	\N	15	25	normal
425	23	32	\N	5	94	normal
426	23	32	\N	5	94	failure
427	23	32	\N	5	94	normal
428	23	15	\N	6	20	warmup
429	23	15	\N	11	25	normal
430	23	15	\N	10	25	normal
431	23	15	\N	6	20	dropset
432	23	14	\N	12	25	normal
433	23	14	\N	9	25	normal
434	23	14	\N	5	20	dropset
435	23	36	\N	10	8	failure
436	23	36	\N	10	8	normal
437	23	36	\N	10	8	normal
438	23	28	\N	5	18	normal
439	23	28	\N	6	18	normal
440	23	28	\N	4	18	normal
441	24	7	\N	6	20	warmup
442	24	7	\N	7	30	warmup
443	24	7	\N	9	40	normal
444	24	7	\N	9	45	normal
445	24	18	\N	12	20	warmup
446	24	18	\N	9	25	normal
447	24	18	\N	5	27	normal
448	24	1	\N	8	15	warmup
449	24	1	\N	6	25	warmup
450	24	1	\N	11	28	normal
451	24	1	\N	12	28	normal
452	24	35	\N	6	40	normal
453	24	35	\N	6	60	normal
454	24	35	\N	10	80	normal
455	24	35	\N	10	100	normal
456	24	22	\N	12	26	normal
457	24	22	\N	12	26	normal
458	24	22	\N	12	26	normal
459	24	16	\N	8	12.5	normal
460	24	16	\N	8	12.5	normal
461	24	16	\N	8	12.5	normal
462	25	32	\N	9	94	normal
463	25	32	\N	9	94	failure
464	25	27	\N	10	70	normal
465	25	27	\N	9	75	normal
466	25	27	\N	7	75	normal
467	25	27	\N	8	60	dropset
468	25	23	\N	5	40	warmup
469	25	23	\N	9	45	normal
470	25	23	\N	7	45	normal
471	25	8	\N	10	25	normal
472	25	8	\N	7	25	normal
473	26	4	\N	8	60	warmup
474	26	4	\N	8	65	normal
475	26	4	\N	8	65	normal
476	26	37	\N	8	17.5	warmup
477	26	37	\N	6	27.5	normal
478	26	37	\N	9	40	normal
479	26	37	\N	6	50	normal
480	26	37	\N	9	40	normal
481	26	37	\N	3	40	dropset
482	26	23	\N	5	40	warmup
483	26	23	\N	10	45	normal
484	26	23	\N	8	45	normal
485	26	23	\N	4	40	dropset
486	26	23	\N	8	40	normal
487	26	23	\N	3	40	dropset
488	26	40	\N	8	22	normal
489	26	40	\N	15	26	normal
490	26	40	\N	15	26	normal
491	26	40	\N	15	26	normal
492	26	16	\N	7	12	normal
493	26	16	\N	7	12	normal
494	26	16	\N	7	12	normal
495	26	5	\N	10	60	warmup
496	26	5	\N	10	80	normal
497	26	5	\N	6	80	dropset
498	27	21	\N	6	20	warmup
499	27	21	\N	8	27.5	normal
500	27	21	\N	7	27.5	normal
501	27	21	\N	8	25	normal
502	27	20	\N	10	50	warmup
503	27	20	\N	10	60	normal
504	27	20	\N	10	60	normal
505	27	20	\N	10	55	normal
506	27	7	\N	8	20	warmup
507	27	7	\N	6	30	warmup
508	27	7	\N	8	40	normal
509	27	7	\N	8	40	normal
510	27	9	\N	10	27	normal
511	27	9	\N	10	27	normal
512	27	9	\N	11	27	normal
513	28	33	\N	8	40	warmup
514	28	33	\N	8	65	normal
515	28	33	\N	8	65	normal
516	28	33	\N	8	65	normal
517	28	41	\N	8	55	warmup
518	28	41	\N	12	75	normal
519	28	41	\N	10	85	normal
520	28	41	\N	8	85	normal
521	28	42	\N	8	40	warmup
522	28	42	\N	5	50	normal
523	28	42	\N	7	60	normal
524	28	42	\N	7	60	normal
525	28	2	\N	11	12.5	normal
526	28	2	\N	11	12.5	normal
527	28	2	\N	10	12.5	normal
528	28	2	\N	7	10	dropset
529	28	2	\N	7	7.5	dropset
530	29	1	\N	15	15	warmup
531	29	1	\N	10	25	normal
532	29	1	\N	10	28	normal
533	29	1	\N	11	28	normal
534	29	1	\N	9	28	failure
535	29	43	\N	8	13	warmup
536	29	43	\N	8	20	normal
537	29	43	\N	8	30	normal
538	29	43	\N	8	35	normal
539	29	43	\N	8	35	normal
540	29	43	\N	8	35	normal
541	29	8	\N	10	2.5	normal
542	29	8	\N	10	12.5	normal
543	29	8	\N	10	22.5	normal
544	29	8	\N	10	32.5	normal
545	29	8	\N	8	32.5	normal
546	29	2	\N	8	15	warmup
547	29	2	\N	8	20	normal
548	29	2	\N	8	20	normal
549	29	2	\N	9	20	normal
550	29	2	\N	9	20	normal
551	29	2	\N	6	15	dropset
552	30	44	\N	8	30	warmup
553	30	44	\N	8	50	normal
554	30	44	\N	8	60	normal
555	30	44	\N	9	60	failure
556	30	11	\N	6	94	warmup
557	30	11	\N	14	94	normal
558	30	13	\N	8	35	warmup
559	30	13	\N	8	45	warmup
560	30	13	\N	15	50	normal
561	30	13	\N	8	55	failure
562	30	27	\N	8	75	normal
563	30	27	\N	6	75	normal
564	30	27	\N	2	65	dropset
565	30	27	\N	7	55	dropset
566	30	12	\N	8	30	warmup
567	30	12	\N	9	40	warmup
568	30	12	\N	8	50	failure
569	30	12	\N	8	40	normal
570	30	12	\N	9	40	normal
571	31	18	\N	8	15	warmup
572	31	18	\N	6	20	warmup
573	31	18	\N	8	25	normal
574	31	18	\N	9	25	normal
575	31	23	\N	10	20	warmup
576	31	23	\N	8	35	warmup
577	31	23	\N	9	45	normal
578	31	23	\N	7	45	failure
579	31	40	\N	10	22	normal
580	31	40	\N	15	26	normal
581	31	40	\N	15	26	normal
582	32	45	\N	12	10	normal
583	32	45	\N	5	12.5	warmup
584	32	45	\N	13	15	normal
585	32	45	\N	10	15	failure
586	32	46	\N	12	45	warmup
587	32	46	\N	11	65	normal
588	32	46	\N	5	70	failure
589	32	46	\N	10	55	dropset
590	32	47	\N	6	40	warmup
591	32	47	\N	1	50	normal
592	32	27	\N	8	65	warmup
593	32	27	\N	13	75	normal
594	32	27	\N	9	75	normal
595	32	27	\N	7	65	dropset
596	32	27	\N	7	60	dropset
597	32	27	\N	6	60	dropset
598	33	33	\N	8	45	warmup
599	33	33	\N	3	65	normal
600	33	33	\N	10	60	normal
601	33	33	\N	8	65	normal
602	33	33	\N	8	60	normal
603	33	8	\N	9	17.5	normal
604	33	8	\N	7	25	normal
605	33	8	\N	9	27.5	normal
606	33	8	\N	6	27.5	normal
607	33	8	\N	7	25	normal
608	33	48	\N	6	2.5	normal
609	33	48	\N	7	5	failure
610	33	48	\N	6	5	normal
611	33	48	\N	7	2.5	dropset
612	33	48	\N	21	2.5	dropset
613	33	49	\N	10	7.5	normal
614	33	49	\N	6	7.5	failure
615	33	14	\N	11	25	normal
616	33	14	\N	9	25	normal
617	34	13	\N	15	35	warmup
618	34	13	\N	13	50	normal
619	34	13	\N	13	50	normal
620	34	13	\N	11	50	normal
621	34	50	\N	12	94	normal
622	34	50	\N	12	94	normal
623	34	50	\N	12	94	normal
624	34	11	\N	14	94	normal
625	34	11	\N	9	94	normal
626	34	17	\N	15	94	normal
627	34	17	\N	12	94	normal
628	34	32	\N	10	94	normal
629	34	32	\N	7	94	normal
630	34	33	\N	8	60	normal
631	34	51	\N	5	22.5	normal
632	34	51	\N	8	17.5	normal
633	34	51	\N	8	15	normal
634	34	52	\N	10	10	normal
635	34	52	\N	10	10	normal
636	34	52	\N	10	12.5	normal
637	34	52	\N	10	12.5	normal
638	34	2	\N	10	12.5	failure
639	34	2	\N	9	10	normal
640	34	2	\N	10	7.5	normal
641	34	2	\N	4	7.5	dropset
642	34	2	\N	12	7.5	normal
643	34	2	\N	10	5	normal
644	35	40	\N	12	20	normal
645	35	40	\N	20	24	normal
646	35	40	\N	15	26	normal
647	35	40	\N	15	26	normal
648	35	18	\N	8	20	warmup
649	35	18	\N	8	25	normal
650	35	18	\N	8	25	normal
651	35	18	\N	6	20	dropset
652	35	53	\N	8	40	warmup
653	35	53	\N	10	50	normal
654	35	53	\N	9	50	normal
655	35	5	\N	15	60	warmup
656	35	5	\N	12	80	normal
657	35	5	\N	10	80	normal
658	35	27	\N	11	60	warmup
659	35	27	\N	10	75	normal
660	35	27	\N	8	75	normal
661	35	27	\N	6	60	dropset
662	35	27	\N	4	60	dropset
663	36	54	\N	12	30	normal
664	36	54	\N	12	50	normal
665	36	54	\N	8	60	normal
666	36	54	\N	7	60	normal
667	36	41	\N	10	55	warmup
668	36	41	\N	11	75	normal
669	36	41	\N	13	65	normal
670	36	41	\N	6	65	dropset
671	36	55	\N	10	20	normal
672	36	55	\N	7	25	normal
673	36	55	\N	7	35	normal
674	36	55	\N	5	35	normal
675	36	55	\N	2	30	dropset
676	36	4	\N	20	85	warmup
677	36	4	\N	22	110	normal
678	37	1	\N	8	15	warmup
679	37	1	\N	12	25	normal
680	37	1	\N	10	28	normal
681	37	1	\N	9	28	normal
682	37	1	\N	11	25	normal
683	37	1	\N	8	25	normal
684	37	18	\N	8	10	warmup
685	37	18	\N	10	15	normal
686	37	18	\N	8	15	normal
687	37	18	\N	7	15	normal
688	37	21	\N	7	20	warmup
689	37	21	\N	12	25	normal
690	37	21	\N	8	25	normal
691	37	21	\N	10	20	normal
692	37	28	\N	6	17.5	warmup
693	37	28	\N	5	20	normal
694	37	28	\N	6	17.5	normal
695	38	10	\N	11	94	normal
696	38	10	\N	12	20	normal
697	38	10	\N	10	20	normal
698	38	10	\N	5	10	dropset
699	38	10	\N	7	20	normal
700	38	10	\N	6	10	dropset
701	38	56	\N	11	94	normal
702	38	56	\N	16	94	normal
703	38	56	\N	11	94	normal
704	38	12	\N	8	30	warmup
705	38	12	\N	8	40	warmup
706	38	12	\N	8	50	normal
707	38	12	\N	9	45	normal
708	38	12	\N	6	35	dropset
709	38	47	\N	12	30	warmup
710	38	47	\N	6	50	normal
711	38	47	\N	12	70	normal
712	38	47	\N	10	80	normal
713	39	54	\N	15	35	normal
714	39	54	\N	8	55	normal
715	39	54	\N	8	62	normal
716	39	54	\N	7	62	normal
717	39	8	\N	8	17.5	normal
718	39	8	\N	6	22.5	normal
719	39	8	\N	7	27.5	normal
720	39	8	\N	9	25	normal
721	39	8	\N	7	25	normal
722	39	44	\N	7	50	normal
723	39	44	\N	8	60	normal
724	39	44	\N	8	60	normal
725	39	44	\N	6	50	dropset
726	39	2	\N	8	7.5	warmup
727	39	2	\N	19	10	normal
728	39	2	\N	7	7.5	normal
729	39	2	\N	9	5	normal
730	40	57	\N	10	35	warmup
731	40	57	\N	11	40	normal
732	40	40	\N	10	18	warmup
733	40	40	\N	11	20	normal
734	40	40	\N	12	24	normal
735	40	40	\N	11	26	normal
736	40	58	\N	8	30	warmup
737	40	58	\N	8	40	normal
738	40	58	\N	6	50	normal
739	41	13	\N	15	35	warmup
740	41	13	\N	6	50	warmup
741	41	13	\N	14	50	normal
742	41	13	\N	13	50	normal
743	41	24	\N	12	75	warmup
744	41	24	\N	6	110	warmup
745	41	24	\N	12	110	failure
746	41	24	\N	10	110	normal
747	41	24	\N	5	110	dropset
748	41	4	\N	20	75	warmup
749	41	4	\N	15	110	normal
750	41	4	\N	20	110	normal
751	41	4	\N	10	55	normal
752	41	7	\N	3	100	warmup
753	41	7	\N	12	115	normal
754	41	7	\N	12	115	failure
755	41	7	\N	8	95	dropset
756	41	7	\N	5	85	dropset
757	41	10	\N	8	20	normal
758	41	10	\N	12	20	normal
759	41	10	\N	8	94	dropset
760	41	10	\N	12	94	normal
761	42	57	\N	15	35	normal
762	42	57	\N	12	40	normal
763	42	19	\N	15	50	warmup
764	42	19	\N	7	65	warmup
765	42	19	\N	12	70	normal
766	42	19	\N	9	70	normal
767	42	18	\N	8	17.5	warmup
768	42	18	\N	8	22.5	normal
769	42	18	\N	8	25	normal
770	42	18	\N	6	25	normal
771	42	46	\N	8	50	warmup
772	42	46	\N	9	65	normal
773	42	46	\N	7	65	normal
774	42	15	\N	11	25	normal
775	42	15	\N	7	25	normal
776	42	15	\N	3	22.5	dropset
777	42	14	\N	10	25	normal
778	42	28	\N	8	16	warmup
779	42	28	\N	5	20	normal
780	42	28	\N	2	18	dropset
781	43	33	\N	10	35	warmup
782	43	33	\N	8	55	warmup
783	43	33	\N	11	60	normal
784	43	33	\N	7	60	normal
785	43	33	\N	3	60	dropset
786	43	33	\N	7	25	normal
787	43	33	\N	6	25	normal
788	43	33	\N	3	20	dropset
789	43	3	\N	7	17.5	warmup
790	43	3	\N	7	22.5	normal
791	43	3	\N	7	20	dropset
792	43	19	\N	6	65	warmup
793	43	19	\N	12	70	normal
794	43	19	\N	8	70	normal
795	43	19	\N	10	60	normal
796	43	31	\N	8	40	warmup
797	43	31	\N	12	55	failure
798	43	31	\N	10	55	normal
799	44	54	\N	10	40	normal
800	44	54	\N	12	50	normal
801	44	54	\N	8	62	normal
802	44	54	\N	7	62	normal
803	44	10	\N	12	94	warmup
804	44	10	\N	12	10	normal
805	44	11	\N	7	94	warmup
806	44	59	\N	8	80	normal
807	44	59	\N	10	90	normal
808	44	7	\N	9	95	warmup
809	44	7	\N	11	115	normal
810	44	7	\N	12	110	failure
811	44	7	\N	8	90	dropset
812	45	60	\N	10	40	normal
813	45	60	\N	7	50	normal
814	45	40	\N	10	16	warmup
815	45	40	\N	10	18	normal
816	45	40	\N	10	22	normal
817	45	40	\N	10	24	normal
818	45	46	\N	8	50	warmup
819	45	46	\N	10	65	normal
820	45	46	\N	7	65	normal
821	45	46	\N	6	40	dropset
822	45	9	\N	8	25	normal
823	45	9	\N	10	30	normal
824	45	9	\N	10	30	normal
825	45	9	\N	10	30	normal
826	46	61	\N	10	94	warmup
827	46	61	\N	8	10	warmup
828	46	61	\N	15	20	normal
829	46	20	\N	12	50	normal
830	46	20	\N	12	60	normal
831	46	20	\N	10	55	normal
832	46	7	\N	6	40	warmup
833	46	7	\N	12	50	normal
834	46	7	\N	10	50	failure
835	46	7	\N	9	40	dropset
836	47	44	\N	10	30	warmup
837	47	44	\N	8	50	normal
838	47	44	\N	8	60	normal
839	47	44	\N	7	60	normal
840	47	44	\N	5	50	dropset
841	47	29	\N	8	40	warmup
842	47	29	\N	6	55	normal
843	47	29	\N	9	50	normal
844	47	29	\N	3	40	dropset
845	47	2	\N	10	7.5	normal
846	47	2	\N	12	7.5	normal
847	47	2	\N	9	10	normal
848	47	2	\N	11	7.5	normal
849	47	2	\N	4	5	dropset
850	47	34	\N	10	55	normal
851	47	34	\N	8	60	normal
852	47	34	\N	8	45	dropset
853	47	3	\N	8	22.5	normal
854	47	3	\N	12	17.5	normal
855	47	3	\N	9	17.5	normal
856	47	28	\N	8	20	normal
857	47	28	\N	5	20	normal
858	47	28	\N	6	18	normal
859	48	61	\N	10	10	warmup
860	48	61	\N	14	20	normal
861	48	61	\N	12	20	normal
862	48	6	\N	20	94	normal
863	48	6	\N	20	94	normal
864	48	6	\N	10	94	normal
865	48	6	\N	10	94	dropset
866	48	62	\N	20	94	normal
867	48	62	\N	10	94	normal
868	48	62	\N	20	94	dropset
869	48	31	\N	8	25	warmup
870	48	31	\N	12	40	failure
871	48	31	\N	8	45	normal
872	48	53	\N	8	25	warmup
873	48	53	\N	12	35	normal
874	48	53	\N	12	40	normal
875	48	3	\N	6	17.5	warmup
876	48	3	\N	10	25	normal
877	48	3	\N	9	25	normal
878	48	14	\N	7	20	normal
879	48	14	\N	12	17.5	failure
880	48	14	\N	10	15	normal
881	48	14	\N	9	15	normal
882	48	14	\N	13	17.5	normal
883	49	32	\N	3	94	warmup
884	49	32	\N	5	94	warmup
885	49	32	\N	7	94	normal
886	49	32	\N	3	94	dropset
887	49	11	\N	3	94	warmup
888	49	11	\N	12	94	normal
889	49	11	\N	7	94	normal
890	49	11	\N	3	94	dropset
891	49	7	\N	8	65	warmup
892	49	7	\N	8	95	warmup
893	49	7	\N	10	110	normal
894	49	7	\N	10	105	normal
895	49	7	\N	7	90	dropset
896	49	12	\N	8	30	warmup
897	49	63	\N	8	60	normal
898	49	63	\N	8	80	normal
899	49	63	\N	8	110	normal
900	49	63	\N	10	120	normal
901	49	22	\N	12	45	normal
902	49	24	\N	10	85	warmup
903	49	24	\N	11	110	normal
904	49	24	\N	10	105	failure
905	49	23	\N	8	30	warmup
906	49	23	\N	7	40	warmup
907	49	23	\N	7	50	normal
908	49	23	\N	3	50	dropset
909	49	23	\N	7	40	normal
910	49	23	\N	3	40	dropset
911	50	53	\N	8	40	warmup
912	50	53	\N	12	50	normal
913	50	53	\N	11	50	normal
914	50	27	\N	10	60	warmup
915	50	27	\N	12	70	normal
916	50	27	\N	15	70	normal
917	50	27	\N	6	70	dropset
918	50	41	\N	10	50	warmup
919	50	41	\N	12	70	normal
920	50	41	\N	12	60	normal
921	50	22	\N	8	35	warmup
922	50	22	\N	12	45	normal
923	50	22	\N	12	45	normal
924	50	42	\N	8	40	warmup
925	50	42	\N	6	50	normal
926	50	42	\N	6	60	normal
927	50	42	\N	6	60	normal
928	50	48	\N	10	2.5	normal
929	50	48	\N	10	2.5	failure
930	50	48	\N	8	2.5	normal
931	50	64	\N	10	12	normal
932	50	65	\N	10	12	normal
933	50	65	\N	7	12	normal
934	51	4	\N	10	75	warmup
935	51	4	\N	20	105	normal
936	51	4	\N	20	100	normal
937	51	6	\N	12	94	warmup
938	51	6	\N	16	94	normal
939	51	12	\N	8	30	warmup
940	51	12	\N	7	40	warmup
941	51	12	\N	7	50	normal
942	51	12	\N	3	50	dropset
943	51	12	\N	3	40	dropset
944	51	15	\N	10	25	normal
945	51	15	\N	12	25	normal
946	51	66	\N	10	25	normal
947	51	66	\N	9	25	normal
948	51	66	\N	6	20	dropset
949	52	32	\N	3	94	warmup
950	52	32	\N	5	94	warmup
951	52	32	\N	5	94	normal
952	52	32	\N	3	94	failure
953	52	32	\N	7	94	normal
954	52	33	\N	10	60	normal
955	52	33	\N	7	60	normal
956	52	13	\N	10	35	warmup
957	52	13	\N	10	50	normal
958	52	13	\N	13	50	normal
959	52	7	\N	8	70	warmup
960	52	7	\N	5	95	warmup
961	52	7	\N	10	115	normal
962	52	47	\N	10	60	normal
963	52	47	\N	12	45	normal
964	52	58	\N	8	20	warmup
965	52	58	\N	7	30	warmup
966	52	58	\N	8	40	normal
967	52	58	\N	5	50	normal
968	52	19	\N	3	65	warmup
969	52	19	\N	10	70	normal
970	52	19	\N	8	70	normal
971	52	31	\N	6	45	warmup
972	52	31	\N	10	55	failure
973	52	31	\N	7	55	normal
974	53	19	\N	8	30	warmup
975	53	19	\N	15	55	normal
976	53	19	\N	7	75	normal
977	53	31	\N	8	30	warmup
978	53	31	\N	10	50	failure
979	53	27	\N	9	80	normal
980	53	27	\N	7	80	failure
981	53	43	\N	13	60	normal
982	53	43	\N	13	60	normal
983	53	14	\N	12	25	normal
984	53	14	\N	11	25	failure
985	53	14	\N	10	22.5	normal
986	53	9	\N	10	20	normal
987	53	9	\N	10	20	normal
988	53	48	\N	10	2.5	normal
989	53	48	\N	8	2.5	normal
990	54	61	\N	8	10	warmup
991	54	61	\N	10	20	normal
992	54	61	\N	13	20	normal
993	54	7	\N	6	20	warmup
994	54	7	\N	10	40	normal
995	54	7	\N	12	50	normal
996	54	7	\N	11	50	normal
997	54	7	\N	7	40	dropset
998	54	20	\N	10	50	normal
999	54	20	\N	13	60	normal
1000	54	20	\N	11	60	normal
1001	54	21	\N	12	15	warmup
1002	54	21	\N	11	22.5	normal
1003	54	21	\N	7	25	normal
1004	54	42	\N	8	30	warmup
1005	54	42	\N	6	40	warmup
1006	54	42	\N	4	50	normal
1007	54	42	\N	6	60	normal
1008	54	42	\N	5	60	normal
1009	54	28	\N	10	17.5	normal
1010	54	28	\N	6	20	normal
1011	54	1	\N	10	15	warmup
1012	54	1	\N	15	25	normal
1013	54	3	\N	8	17.5	warmup
1014	54	3	\N	8	20	normal
1015	54	3	\N	11	20	normal
1016	55	32	\N	3	94	warmup
1017	55	32	\N	5	94	warmup
1018	55	32	\N	11	94	normal
1019	55	32	\N	7	94	failure
1020	55	42	\N	10	30	warmup
1021	55	42	\N	6	40	warmup
1022	55	42	\N	8	50	normal
1023	55	42	\N	6	60	normal
1024	55	42	\N	5	60	normal
1025	55	27	\N	11	70	normal
1026	55	27	\N	8	70	failure
1027	55	27	\N	7	70	normal
1028	55	46	\N	12	55	normal
1029	55	46	\N	12	55	normal
1030	55	28	\N	12	14	normal
1031	55	67	\N	10	25	normal
1032	55	67	\N	8	25	normal
1033	55	16	\N	10	10	normal
1034	55	16	\N	10	10	normal
1035	56	42	\N	8	32	warmup
1036	56	42	\N	6	42	warmup
1037	56	42	\N	10	52	normal
1038	56	42	\N	7	62	normal
1039	56	28	\N	10	15	normal
1040	56	28	\N	10	17.5	failure
1041	56	28	\N	14	17.5	normal
1042	56	21	\N	12	15	warmup
1043	56	21	\N	6	20	warmup
1044	56	21	\N	11	22.5	normal
1045	56	21	\N	6	25	normal
1046	56	1	\N	10	13	warmup
1047	56	1	\N	13	23	normal
1048	56	1	\N	7	28	normal
1049	56	23	\N	6	30	normal
1050	56	23	\N	8	20	normal
1051	56	2	\N	8	20	normal
1052	56	2	\N	10	20	normal
1053	57	10	\N	10	94	warmup
1054	57	10	\N	12	15	normal
1055	57	10	\N	10	20	normal
1056	57	10	\N	8	94	dropset
1057	57	68	\N	15	45	normal
1058	57	68	\N	13	50	failure
1059	57	45	\N	11	10	normal
1060	57	45	\N	12	15	normal
1061	57	45	\N	9	15	normal
1062	57	7	\N	8	75	warmup
1063	57	7	\N	12	100	normal
1064	57	7	\N	10	110	normal
1065	57	7	\N	7	95	dropset
1066	58	57	\N	8	35	warmup
1067	58	57	\N	11	40	normal
1068	58	69	\N	10	40	normal
1069	58	19	\N	6	65	warmup
1070	58	19	\N	9	70	normal
1071	58	31	\N	10	45	warmup
1072	58	31	\N	10	50	failure
1073	58	31	\N	6	55	failure
1074	58	34	\N	6	40	warmup
1075	58	34	\N	6	60	normal
1076	58	46	\N	9	60	failure
1077	58	46	\N	7	55	normal
1078	58	3	\N	8	15	warmup
1079	58	3	\N	8	20	normal
1080	58	15	\N	7	25	normal
1081	58	28	\N	7	18	normal
1082	58	28	\N	7	18	failure
1083	59	32	\N	8	94	normal
1084	59	23	\N	8	30	warmup
1085	59	23	\N	9	40	normal
1086	59	23	\N	7	50	normal
1087	59	13	\N	8	35	warmup
1088	59	13	\N	11	50	normal
1089	59	13	\N	9	50	normal
1090	59	7	\N	8	70	warmup
1091	59	7	\N	8	95	normal
1092	59	7	\N	8	105	normal
1093	59	7	\N	9	105	normal
1094	59	3	\N	8	15	warmup
1095	59	3	\N	10	20	failure
1096	59	15	\N	8	25	normal
1097	59	30	\N	10	20	warmup
1098	59	30	\N	8	25	normal
1099	59	30	\N	12	22.5	normal
1100	60	70	\N	10	30	warmup
1101	60	70	\N	10	50	normal
1102	60	70	\N	11	50	normal
1103	60	70	\N	17	40	normal
1104	60	17	\N	10	94	normal
1105	60	17	\N	10	94	normal
1106	60	53	\N	8	40	warmup
1107	60	53	\N	8	50	failure
1108	60	53	\N	10	50	normal
1109	60	19	\N	8	45	warmup
1110	60	19	\N	5	65	warmup
1111	60	19	\N	8	70	normal
1112	60	19	\N	8	70	failure
1113	60	12	\N	6	20	warmup
1114	60	12	\N	6	30	warmup
1115	60	12	\N	6	40	warmup
1116	60	12	\N	7	50	failure
1117	60	12	\N	6	40	dropset
1118	61	32	\N	3	94	warmup
1119	61	32	\N	8	94	normal
1120	61	32	\N	9	94	normal
1121	61	11	\N	3	94	warmup
1122	61	42	\N	6	30	warmup
1123	61	42	\N	6	40	warmup
1124	61	42	\N	10	55	normal
1125	61	43	\N	11	60	normal
1126	61	43	\N	12	60	normal
1127	61	15	\N	8	25	normal
1128	61	15	\N	10	25	normal
1129	61	30	\N	8	20	warmup
1130	61	30	\N	12	22.5	normal
1131	61	30	\N	12	20	normal
1132	61	14	\N	11	25	normal
1133	61	14	\N	8	22.5	failure
1134	62	10	\N	12	94	warmup
1135	62	10	\N	10	20	normal
1136	62	10	\N	9	20	normal
1137	62	10	\N	5	94	dropset
1138	62	13	\N	10	45	warmup
1139	62	13	\N	10	50	normal
1140	62	13	\N	8	50	normal
1141	62	5	\N	6	60	warmup
1142	62	5	\N	10	80	normal
1143	62	5	\N	11	80	normal
1144	62	63	\N	6	60	normal
1145	62	63	\N	12	80	normal
1146	62	63	\N	12	100	normal
1147	62	71	\N	7	40	normal
1148	62	71	\N	12	20	normal
1149	63	33	\N	8	35	warmup
1150	63	33	\N	6	50	normal
1151	63	33	\N	8	60	failure
1152	63	11	\N	6	94	normal
1153	63	11	\N	10	94	normal
1154	63	32	\N	7	94	normal
1155	63	19	\N	9	60	normal
1156	63	19	\N	7	70	normal
1157	63	31	\N	11	50	normal
1158	63	31	\N	10	50	failure
1159	63	16	\N	10	10	normal
1160	63	16	\N	10	10	normal
1161	63	28	\N	10	16	normal
1162	63	28	\N	8	16	failure
1163	64	7	\N	8	65	warmup
1164	64	7	\N	8	85	normal
1165	64	7	\N	8	95	normal
1166	64	7	\N	8	105	normal
1167	64	61	\N	6	20	normal
1168	64	61	\N	12	20	normal
1169	64	20	\N	8	50	normal
1170	64	20	\N	13	60	normal
1171	64	20	\N	11	60	normal
1172	64	43	\N	10	30	normal
1173	64	43	\N	12	35	normal
1174	64	21	\N	10	22.5	normal
1175	64	21	\N	9	22.5	failure
1176	64	18	\N	6	10	warmup
1177	64	18	\N	9	15	normal
1178	64	18	\N	7	15	normal
1179	64	2	\N	8	12.5	normal
1180	64	2	\N	10	20	normal
1181	64	2	\N	8	20	normal
1182	64	15	\N	6	25	normal
1183	64	15	\N	8	25	normal
1184	65	54	\N	8	40	normal
1185	65	54	\N	10	50	normal
1186	65	54	\N	8	50	normal
1187	65	44	\N	8	35	warmup
1188	65	44	\N	8	55	normal
1189	65	44	\N	9	50	normal
1190	65	11	\N	6	94	normal
1191	65	11	\N	8	94	normal
1192	65	3	\N	10	20	normal
1193	65	3	\N	9	20	normal
1194	65	66	\N	12	20	failure
1195	65	66	\N	9	22.5	normal
1196	65	19	\N	9	60	normal
1197	65	19	\N	8	70	normal
1198	65	31	\N	8	45	normal
1199	65	31	\N	11	50	normal
1200	65	31	\N	7	50	normal
1201	65	31	\N	3	40	dropset
1202	65	72	\N	8	50	normal
1203	65	72	\N	8	50	normal
1204	65	72	\N	10	40	normal
1205	65	56	\N	12	94	normal
1206	65	56	\N	14	94	normal
1207	65	56	\N	8	94	dropset
1208	66	73	\N	6	62	normal
1209	66	73	\N	6	92	normal
1210	66	73	\N	8	92	normal
1211	66	74	\N	8	25	warmup
1212	66	74	\N	10	45	normal
1213	66	74	\N	12	55	normal
1214	66	32	\N	7	94	normal
1215	66	75	\N	18	94	normal
1216	66	75	\N	12	94	normal
1217	66	21	\N	9	20	warmup
1218	66	21	\N	7	28	failure
1219	66	67	\N	12	27	normal
1220	66	67	\N	9	27	normal
1221	66	67	\N	8	27	normal
1222	67	44	\N	8	30	warmup
1223	67	44	\N	8	40	normal
1224	67	44	\N	9	50	normal
1225	67	44	\N	11	50	failure
1226	67	10	\N	8	94	warmup
1227	67	10	\N	12	15	normal
1228	67	10	\N	9	20	normal
1229	67	10	\N	11	94	dropset
1230	67	76	\N	8	45	warmup
1231	67	76	\N	8	65	failure
1232	67	76	\N	8	65	failure
1233	67	76	\N	6	60	normal
1234	67	27	\N	10	70	normal
1235	67	27	\N	9	70	failure
1236	67	27	\N	9	70	normal
1237	67	4	\N	8	75	warmup
1238	67	4	\N	20	100	normal
1239	67	24	\N	8	75	warmup
1240	67	24	\N	10	100	normal
1241	67	24	\N	6	100	dropset
1242	67	13	\N	10	40	warmup
1243	67	13	\N	10	50	normal
1244	67	13	\N	8	50	normal
1245	68	13	\N	8	40	warmup
1246	68	13	\N	5	60	normal
1247	68	13	\N	10	50	normal
1248	68	4	\N	8	50	warmup
1249	68	4	\N	10	80	normal
1250	68	61	\N	8	94	normal
1251	68	61	\N	10	20	normal
1252	68	61	\N	7	10	normal
1253	68	21	\N	8	15	warmup
1254	68	21	\N	10	22.5	failure
1255	68	21	\N	8	22.5	normal
1256	68	12	\N	8	20	warmup
1257	68	12	\N	12	40	normal
1258	68	12	\N	8	45	normal
1259	68	12	\N	4	40	dropset
1260	68	8	\N	8	20	normal
1261	68	8	\N	6	20	normal
1262	68	8	\N	4	20	normal
1263	68	2	\N	10	10	normal
1264	68	2	\N	10	15	normal
1265	68	2	\N	10	15	normal
1266	69	77	\N	5	94	normal
1267	69	77	\N	5	94	normal
1268	69	77	\N	5	94	normal
1269	69	61	\N	8	10	normal
1270	69	61	\N	12	20	normal
1271	69	61	\N	10	20	normal
1272	69	61	\N	8	20	normal
1273	69	13	\N	6	40	warmup
1274	69	13	\N	10	50	normal
1275	69	13	\N	10	50	normal
1276	69	1	\N	15	20	warmup
1277	69	1	\N	12	25	normal
1278	69	1	\N	8	25	normal
1279	69	2	\N	6	5	normal
1280	69	2	\N	13	10	normal
1281	69	2	\N	14	12.5	normal
1282	69	2	\N	12	10	normal
1283	69	27	\N	10	80	normal
1284	69	27	\N	6	80	failure
1285	69	78	\N	8	25	normal
1286	69	78	\N	4	15	dropset
1287	69	78	\N	8	20	normal
1288	70	13	\N	8	40	warmup
1289	70	13	\N	9	50	normal
1290	70	13	\N	8	50	normal
1291	70	13	\N	12	40	normal
1292	70	61	\N	6	94	normal
1293	70	61	\N	8	10	normal
1294	70	61	\N	10	20	normal
1295	70	61	\N	10	20	normal
1296	70	53	\N	8	45	normal
1297	70	53	\N	8	45	normal
1298	70	18	\N	6	10	warmup
1299	70	18	\N	8	15	normal
1300	70	20	\N	10	50	normal
1301	70	20	\N	10	60	normal
1302	70	20	\N	10	60	normal
1303	71	44	\N	8	20	warmup
1304	71	44	\N	8	40	normal
1305	71	44	\N	8	50	normal
1306	71	44	\N	8	50	failure
1307	71	27	\N	8	50	normal
1308	71	27	\N	10	70	normal
1309	71	27	\N	8	70	normal
1310	71	67	\N	10	25	normal
1311	71	67	\N	8	25	normal
1312	71	16	\N	10	9	warmup
1313	71	16	\N	10	10	normal
1314	72	77	\N	5	94	warmup
1315	72	77	\N	8	94	failure
1316	72	77	\N	6	94	normal
1317	72	11	\N	5	94	warmup
1318	72	11	\N	7	94	normal
1319	72	11	\N	7	94	normal
1320	72	20	\N	8	40	warmup
1321	72	20	\N	9	50	normal
1322	72	20	\N	8	60	normal
1323	72	20	\N	8	50	dropset
1324	72	61	\N	6	94	normal
1325	72	61	\N	6	10	normal
1326	72	61	\N	7	20	normal
1327	72	61	\N	7	20	normal
1328	72	68	\N	6	20	normal
1329	72	68	\N	10	40	failure
1330	72	68	\N	12	50	failure
1331	72	68	\N	8	40	dropset
1332	73	1	\N	10	15	warmup
1333	73	1	\N	17	20	normal
1334	73	1	\N	17	20	normal
1335	73	34	\N	10	30	warmup
1336	73	34	\N	8	60	normal
1337	73	34	\N	7	60	normal
1338	73	19	\N	8	50	warmup
1339	73	19	\N	14	70	normal
1340	73	27	\N	8	60	normal
1341	73	27	\N	7	80	normal
1342	73	27	\N	9	70	normal
1343	73	79	\N	8	15	normal
1344	73	79	\N	7	15	normal
1345	73	28	\N	10	15	normal
1346	73	36	\N	10	8	failure
1347	73	36	\N	10	8	normal
1348	73	36	\N	10	8	normal
1349	74	11	\N	3	94	normal
1350	74	11	\N	3	94	normal
1351	74	11	\N	3	94	normal
1352	74	32	\N	3	94	normal
1353	74	32	\N	3	94	normal
1354	74	32	\N	3	94	normal
1355	74	80	\N	8	14	warmup
1356	74	80	\N	8	18	normal
1357	74	80	\N	10	22	normal
1358	74	80	\N	6	24	normal
1359	74	81	\N	5	7.5	normal
1360	74	39	\N	10	7.5	normal
1361	74	39	\N	10	10	normal
1362	74	82	\N	8	5	warmup
1363	74	82	\N	7	7.5	normal
1364	74	82	\N	5	7.5	normal
1365	74	15	\N	8	20	normal
1366	74	15	\N	5	25	normal
1367	74	23	\N	8	30	warmup
1368	74	23	\N	10	40	normal
1369	74	23	\N	7	45	normal
1370	75	17	\N	12	94	normal
1371	75	17	\N	13	94	normal
1372	75	6	\N	12	94	warmup
1373	75	6	\N	15	94	normal
1374	75	13	\N	8	35	warmup
1375	75	13	\N	8	50	normal
1376	75	13	\N	6	50	normal
1377	75	13	\N	12	40	normal
1378	75	12	\N	8	30	warmup
1379	75	12	\N	15	40	normal
1380	75	12	\N	9	45	normal
1381	75	12	\N	4	40	dropset
1382	75	12	\N	6	30	dropset
1383	75	7	\N	9	60	warmup
1384	75	7	\N	15	80	normal
1385	75	7	\N	10	105	normal
1386	75	7	\N	9	45	normal
1387	75	7	\N	6	35	dropset
1388	75	68	\N	12	35	normal
1389	75	68	\N	14	45	failure
1390	75	68	\N	10	45	failure
1391	75	68	\N	8	35	dropset
1392	76	57	\N	12	30	warmup
1393	76	57	\N	13	40	normal
1394	76	69	\N	12	30	warmup
1395	76	69	\N	14	40	normal
1396	76	32	\N	6	94	normal
1397	76	83	\N	7	94	normal
1398	76	43	\N	10	60	normal
1399	76	43	\N	9	60	normal
1400	76	43	\N	7	50	dropset
1401	76	19	\N	11	65	failure
1402	76	3	\N	8	20	normal
1403	76	3	\N	7	17.5	normal
1404	76	28	\N	10	16	normal
1405	76	28	\N	8	16	normal
1406	76	28	\N	4	12	dropset
1407	76	84	\N	12	15	normal
1408	76	84	\N	10	15	failure
1409	76	84	\N	6	12.5	dropset
1410	76	15	\N	9	20	normal
1411	76	15	\N	8	17.5	normal
1412	76	2	\N	12	7.5	normal
1413	76	2	\N	12	7.5	normal
1414	76	2	\N	12	7.5	normal
1415	76	85	\N	10	20	normal
1416	76	85	\N	10	20	normal
1417	76	85	\N	20	16	normal
1418	77	12	\N	12	30	normal
1419	77	12	\N	12	30	normal
1420	77	12	\N	12	30	normal
1421	77	43	\N	10	40	normal
1422	77	43	\N	12	50	normal
1423	77	43	\N	12	50	normal
1424	77	19	\N	12	50	normal
1425	77	19	\N	12	60	normal
1426	77	19	\N	10	60	normal
1427	77	68	\N	15	35	normal
1428	77	68	\N	15	35	normal
1429	77	68	\N	15	35	normal
1430	77	27	\N	15	60	normal
1431	77	27	\N	10	60	normal
1432	78	32	\N	10	94	normal
1433	78	32	\N	6	94	normal
1434	78	6	\N	10	94	warmup
1435	78	6	\N	15	94	normal
1436	78	9	\N	10	20	normal
1437	78	9	\N	10	20	normal
1438	78	16	\N	8	7	warmup
1439	78	16	\N	10	10	normal
1440	78	16	\N	10	10	failure
1441	78	86	\N	10	12.5	warmup
1442	78	86	\N	9	20	normal
1443	78	86	\N	6	20	normal
1444	78	66	\N	10	22.5	failure
1445	78	66	\N	7	22.5	normal
1446	78	7	\N	8	50	warmup
1447	78	7	\N	10	70	normal
1448	78	7	\N	15	70	normal
1449	78	7	\N	13	70	normal
1450	79	44	\N	8	30	warmup
1451	79	44	\N	8	40	normal
1452	79	44	\N	8	50	normal
1453	79	44	\N	7	60	failure
1454	79	29	\N	6	35	warmup
1455	79	29	\N	10	45	normal
1456	79	29	\N	6	55	normal
1457	79	31	\N	12	40	warmup
1458	79	31	\N	11	50	normal
1459	79	68	\N	12	40	warmup
1460	79	68	\N	13	45	normal
1461	79	68	\N	10	45	normal
1462	79	19	\N	8	65	normal
1463	79	19	\N	8	70	failure
1464	79	12	\N	10	32.5	warmup
1465	79	12	\N	12	40	normal
1466	79	12	\N	12	40	normal
1467	79	12	\N	8	40	normal
1468	79	4	\N	8	75	warmup
1469	79	4	\N	10	50	normal
1470	79	4	\N	10	55	normal
1471	79	4	\N	8	50	normal
1472	80	65	\N	9	12	warmup
1473	80	65	\N	10	14	normal
1474	80	65	\N	9	14	normal
1475	80	87	\N	10	12	warmup
1476	80	87	\N	12	14	normal
1477	80	87	\N	9	14	normal
1478	80	16	\N	8	7	warmup
1479	80	16	\N	8	12	normal
1480	80	16	\N	5	12	failure
1481	80	16	\N	6	10	normal
1482	80	3	\N	7	15	warmup
1483	80	3	\N	3	17.5	warmup
1484	80	3	\N	8	20	normal
1485	80	15	\N	12	22.5	normal
1486	81	17	\N	8	94	normal
1487	81	17	\N	8	94	normal
1488	81	17	\N	13	94	normal
1489	81	10	\N	12	94	warmup
1490	81	10	\N	10	15	normal
1491	81	10	\N	8	25	normal
1492	81	10	\N	9	94	dropset
1493	81	5	\N	6	60	warmup
1494	81	5	\N	10	85	normal
1495	81	5	\N	8	85	normal
1496	81	7	\N	9	40	warmup
1497	81	7	\N	10	45	normal
1498	81	7	\N	9	45	normal
1499	81	7	\N	12	100	normal
1500	81	59	\N	6	40	warmup
1501	81	59	\N	3	65	warmup
1502	81	59	\N	11	85	normal
1503	81	59	\N	8	90	normal
1504	81	41	\N	7	85	normal
1505	81	41	\N	8	85	failure
1506	82	21	\N	12	20	normal
1507	82	21	\N	8	22.5	failure
1508	82	21	\N	8	22.5	normal
1509	82	18	\N	5	10	warmup
1510	82	18	\N	8	15	normal
1511	82	18	\N	5	15	normal
1512	82	18	\N	8	10	normal
1513	82	1	\N	6	5	warmup
1514	82	1	\N	10	15	normal
1515	82	1	\N	12	15	normal
1516	82	1	\N	25	15	normal
1517	82	1	\N	15	20	normal
1518	82	1	\N	10	15	dropset
1519	82	19	\N	6	55	warmup
1520	82	19	\N	11	70	failure
1521	82	28	\N	10	15	normal
1522	82	38	\N	10	27	normal
1523	82	38	\N	10	29	normal
1524	83	23	\N	8	20	warmup
1525	83	23	\N	8	30	warmup
1526	83	23	\N	8	40	normal
1527	83	23	\N	8	50	normal
1528	83	23	\N	7	50	failure
1529	83	23	\N	5	40	dropset
1530	83	83	\N	4	94	warmup
1531	83	83	\N	10	94	failure
1532	83	83	\N	8	94	normal
1533	83	83	\N	6	94	failure
1534	83	9	\N	8	25	warmup
1535	83	9	\N	9	30	normal
1536	83	9	\N	7	30	failure
1537	83	9	\N	6	20	dropset
1538	83	3	\N	7	20	normal
1539	83	3	\N	7	17.5	failure
1540	83	84	\N	6	12.5	warmup
1541	83	84	\N	8	15	failure
1542	83	84	\N	6	12.2	normal
1543	83	28	\N	9	16	normal
1544	84	41	\N	8	50	warmup
1545	84	41	\N	13	75	normal
1546	84	41	\N	8	85	normal
1547	84	41	\N	6	85	normal
1548	84	41	\N	6	75	dropset
1549	84	7	\N	8	30	warmup
1550	84	7	\N	8	40	warmup
1551	84	7	\N	10	85	normal
1552	84	7	\N	11	100	normal
1553	84	7	\N	11	100	normal
1554	84	68	\N	11	40	warmup
1555	84	68	\N	11	45	normal
1556	84	68	\N	7	45	normal
1557	84	68	\N	8	40	normal
1558	84	12	\N	11	30	warmup
1559	84	12	\N	11	40	normal
1560	84	12	\N	11	40	normal
1561	84	12	\N	7	40	normal
1562	84	12	\N	4	40	dropset
1563	84	88	\N	10	50	normal
1564	84	88	\N	5	60	normal
1565	84	88	\N	9	55	normal
1566	84	6	\N	7	94	warmup
1567	84	6	\N	30	94	normal
1568	85	23	\N	7	25	warmup
1569	85	23	\N	7	35	warmup
1570	85	23	\N	6	45	normal
1571	85	23	\N	7	50	normal
1572	85	23	\N	6	50	normal
1573	85	89	\N	6	20	normal
1574	85	89	\N	7	26	normal
1575	85	89	\N	6	26	normal
1576	85	21	\N	12	20	normal
1577	85	21	\N	8	23	normal
1578	85	21	\N	9	23	normal
1579	85	84	\N	6	10	warmup
1580	85	84	\N	9	15	normal
1581	85	84	\N	7	15	normal
1582	85	84	\N	7	15	normal
1583	85	67	\N	6	17	normal
1584	85	67	\N	8	27	normal
1585	85	67	\N	7	27	normal
1586	86	12	\N	10	30	warmup
1587	86	12	\N	10	40	normal
1588	86	12	\N	10	40	normal
1589	86	12	\N	7	40	normal
1590	86	12	\N	4	30	dropset
1591	86	13	\N	8	40	warmup
1592	86	13	\N	10	50	normal
1593	86	13	\N	7	55	normal
1594	86	13	\N	6	55	normal
1595	86	90	\N	6	60	warmup
1596	86	90	\N	6	80	normal
1597	86	90	\N	8	105	normal
1598	86	90	\N	7	120	normal
1599	86	54	\N	8	40	normal
1600	86	54	\N	8	50	normal
1601	86	54	\N	8	60	normal
1602	86	91	\N	8	60	normal
1603	86	92	\N	10	90	normal
1604	86	92	\N	6	100	normal
1605	87	57	\N	6	34	warmup
1606	87	57	\N	15	44	normal
1607	87	57	\N	7	54	normal
1608	87	57	\N	4	44	dropset
1609	87	69	\N	6	34	warmup
1610	87	69	\N	15	44	normal
1611	87	69	\N	7	54	normal
1612	87	69	\N	4	44	dropset
1613	87	74	\N	6	50	normal
1614	87	74	\N	6	60	normal
1615	87	65	\N	8	12	warmup
1616	87	65	\N	8	14	normal
1617	87	65	\N	7	14	normal
1618	87	93	\N	7	10	normal
1619	87	93	\N	8	10	normal
1620	87	93	\N	4	10	failure
1621	87	93	\N	4	7	dropset
1622	87	16	\N	12	10	normal
1623	87	36	\N	8	10	failure
1624	87	36	\N	8	8	normal
1625	87	36	\N	10	8	normal
1626	88	83	\N	6	94	normal
1627	88	83	\N	8	94	normal
1628	88	83	\N	8	94	normal
1629	88	33	\N	8	40	warmup
1630	88	33	\N	5	50	normal
1631	88	33	\N	8	60	failure
1632	88	33	\N	7	60	normal
1633	88	33	\N	7	50	normal
1634	88	15	\N	10	15	warmup
1635	88	15	\N	11	22.5	normal
1636	88	15	\N	5	25	normal
1637	88	14	\N	11	25	normal
1638	88	14	\N	8	22.5	failure
1639	88	19	\N	12	60	normal
1640	88	19	\N	7	70	failure
1641	88	12	\N	12	30	warmup
1642	88	12	\N	10	40	normal
1643	88	12	\N	10	35	normal
1644	88	12	\N	8	30	normal
1645	89	7	\N	6	30	warmup
1646	89	7	\N	6	40	warmup
1647	89	7	\N	10	80	normal
1648	89	7	\N	10	100	normal
1649	89	7	\N	10	100	normal
1650	89	47	\N	5	40	warmup
1651	89	47	\N	12	60	normal
1652	89	47	\N	12	60	normal
1653	89	68	\N	10	40	warmup
1654	89	68	\N	12	45	normal
1655	90	46	\N	12	45	warmup
1656	90	46	\N	12	60	normal
1657	90	46	\N	10	60	normal
1658	90	34	\N	10	60	normal
1659	90	34	\N	11	55	normal
1660	90	19	\N	8	45	warmup
1661	90	19	\N	15	60	normal
1662	90	19	\N	10	65	normal
1663	90	31	\N	12	50	normal
1664	90	31	\N	10	50	normal
1665	90	84	\N	8	12.5	warmup
1666	90	84	\N	9	15	normal
1667	90	84	\N	7	15	normal
1668	90	84	\N	13	10	normal
1669	90	3	\N	6	17.5	normal
1670	90	3	\N	11	17.5	normal
1671	90	94	\N	6	32	normal
1672	90	94	\N	10	40	normal
1673	90	94	\N	12	40	normal
1674	90	12	\N	7	20	warmup
1675	90	12	\N	7	30	warmup
1676	90	12	\N	8	40	normal
1677	90	12	\N	7	35	dropset
1678	90	12	\N	8	35	normal
1679	90	12	\N	8	30	dropset
1680	90	12	\N	7	20	dropset
1681	90	12	\N	5	20	dropset
1682	91	32	\N	5	94	normal
1683	91	32	\N	10	94	normal
1684	91	17	\N	8	94	normal
1685	91	17	\N	12	94	normal
1686	91	11	\N	6	94	normal
1687	91	11	\N	8	94	normal
1688	91	45	\N	10	10	normal
1689	91	45	\N	12	15	normal
1690	91	45	\N	10	15	normal
1691	91	68	\N	15	40	warmup
1692	91	68	\N	10	45	normal
1693	91	68	\N	7	45	normal
1694	91	68	\N	10	35	dropset
1695	91	64	\N	5	12	warmup
1696	91	64	\N	10	12	normal
1697	91	64	\N	10	12	normal
1698	91	76	\N	10	45	warmup
1699	91	76	\N	10	65	failure
1700	91	76	\N	6	65	failure
1701	91	76	\N	7	50	dropset
1702	91	7	\N	8	50	warmup
1703	91	7	\N	5	60	warmup
1704	91	7	\N	12	100	normal
1705	91	7	\N	9	100	normal
1706	92	57	\N	8	44	normal
1707	92	57	\N	15	44	normal
1708	92	69	\N	8	44	normal
1709	92	69	\N	17	44	normal
1710	92	21	\N	9	20	normal
1711	92	21	\N	11	20	normal
1712	92	21	\N	7	20	normal
1713	92	19	\N	6	40	warmup
1714	92	19	\N	7	70	normal
1715	92	19	\N	9	80	normal
1716	92	19	\N	10	70	normal
1717	93	32	\N	5	94	normal
1718	93	34	\N	8	50	warmup
1719	93	34	\N	15	55	normal
1720	93	34	\N	10	60	normal
1721	93	46	\N	8	60	normal
1722	93	46	\N	8	60	normal
1723	93	84	\N	8	10	warmup
1724	93	84	\N	8	15	normal
1725	93	84	\N	7	12.5	normal
1726	93	84	\N	7	10	normal
1727	93	26	\N	6	94	warmup
1728	93	26	\N	6	10	normal
1729	93	26	\N	12	20	normal
1730	93	26	\N	10	20	normal
1731	94	28	\N	5	16	normal
1732	94	28	\N	7	16	normal
1733	94	28	\N	6	18	failure
1734	94	95	\N	7	16	warmup
1735	94	95	\N	11	18	normal
1736	94	95	\N	4	22	normal
1737	94	95	\N	6	22	normal
1738	94	95	\N	5	22	normal
1739	94	65	\N	7	14	failure
1740	94	65	\N	6	14	normal
1741	94	79	\N	7	14	normal
1742	94	96	\N	10	10	normal
1743	94	96	\N	12	10	normal
1744	94	96	\N	3	10	dropset
1745	94	32	\N	5	94	normal
1746	94	32	\N	5	94	normal
1747	94	32	\N	5	94	normal
1748	94	31	\N	10	40	warmup
1749	94	31	\N	12	50	normal
1750	94	31	\N	10	50	normal
1751	94	31	\N	9	50	normal
1752	94	27	\N	8	60	warmup
1753	94	27	\N	10	70	normal
1754	94	48	\N	8	2.5	normal
1755	94	48	\N	5	2.5	normal
1756	95	17	\N	30	94	normal
1757	95	17	\N	21	94	normal
1758	95	10	\N	6	94	warmup
1759	95	10	\N	30	94	normal
1760	95	10	\N	12	20	normal
1761	95	12	\N	6	20	warmup
1762	95	12	\N	6	30	warmup
1763	95	12	\N	13	35	normal
1764	95	12	\N	10	35	normal
1765	95	12	\N	7	30	dropset
1766	95	12	\N	8	20	dropset
1767	95	12	\N	7	20	dropset
1768	95	68	\N	6	94	warmup
1769	95	68	\N	19	40	normal
1770	95	68	\N	9	45	normal
1771	95	68	\N	3	40	dropset
1772	95	4	\N	8	70	warmup
1773	95	4	\N	8	50	normal
1774	96	33	\N	8	40	warmup
1775	96	33	\N	4	50	normal
1776	96	33	\N	8	60	failure
1777	96	33	\N	7	60	normal
1778	96	19	\N	8	50	warmup
1779	96	19	\N	12	60	normal
1780	96	19	\N	10	60	normal
1781	96	53	\N	8	40	normal
1782	96	53	\N	10	50	normal
1783	96	53	\N	7	50	normal
1784	96	53	\N	7	40	normal
1785	96	27	\N	10	50	warmup
1786	96	27	\N	10	65	normal
1787	96	27	\N	8	65	normal
1788	96	30	\N	6	17.5	warmup
1789	96	30	\N	8	20	normal
1790	96	84	\N	6	15	warmup
1791	96	84	\N	12	15	normal
1792	96	84	\N	10	15	failure
1793	96	12	\N	10	20	warmup
1794	96	12	\N	12	30	normal
1795	96	12	\N	12	32.5	normal
1796	96	12	\N	10	30	normal
1797	96	12	\N	10	20	dropset
1798	96	12	\N	9	20	dropset
1799	96	12	\N	5	20	dropset
1800	97	28	\N	10	14	normal
1801	97	28	\N	7	16	normal
1802	97	28	\N	6	18	failure
1803	97	95	\N	6	16	warmup
1804	97	95	\N	10	18	normal
1805	97	95	\N	7	22	normal
1806	97	16	\N	12	10	normal
1807	97	16	\N	8	10	failure
1808	97	15	\N	9	15	warmup
1809	97	15	\N	8	22.5	normal
1810	97	3	\N	9	20	normal
1811	97	97	\N	9	30	normal
1812	97	31	\N	11	50	normal
1813	97	31	\N	11	50	failure
1814	97	32	\N	5	94	normal
1815	97	32	\N	5	94	normal
1816	98	24	\N	6	50	normal
1817	98	24	\N	12	50	normal
1818	98	88	\N	8	50	normal
1819	98	88	\N	7	60	normal
1820	98	45	\N	6	10	normal
1821	98	45	\N	13	15	normal
1822	98	47	\N	15	60	normal
1823	98	47	\N	11	60	normal
1824	98	31	\N	10	50	normal
1825	98	31	\N	12	50	normal
1826	98	2	\N	11	7.5	normal
1827	98	2	\N	10	7.5	normal
1828	98	97	\N	8	25	normal
1829	98	97	\N	10	30	normal
1830	98	9	\N	7	30	normal
1831	98	9	\N	8	30	normal
1832	98	54	\N	8	40	normal
1833	98	54	\N	10	50	normal
1834	98	54	\N	7	60	normal
1835	98	91	\N	10	60	normal
1836	98	91	\N	12	60	normal
1837	98	17	\N	30	94	normal
1838	99	13	\N	8	25	warmup
1839	99	13	\N	5	40	normal
1840	99	13	\N	7	50	normal
1841	99	4	\N	12	70	warmup
1842	99	4	\N	10	90	normal
1843	99	4	\N	15	110	normal
1844	99	24	\N	11	110	normal
1845	99	69	\N	10	34	normal
1846	99	69	\N	20	44	normal
1847	99	57	\N	10	34	normal
1848	99	57	\N	14	44	normal
1849	99	87	\N	9	14	failure
1850	99	87	\N	6	14	failure
1851	99	98	\N	8	20	normal
1852	99	98	\N	9	20	normal
1853	99	28	\N	14	20	normal
1854	99	28	\N	12	20	normal
1855	100	32	\N	8	94	normal
1856	100	32	\N	8	94	normal
1857	100	32	\N	7	94	normal
1858	100	99	\N	10	20	warmup
1859	100	11	\N	8	94	normal
1860	100	11	\N	6	94	normal
1861	100	17	\N	25	94	normal
1862	100	17	\N	20	94	normal
1863	100	87	\N	6	12	normal
1864	100	87	\N	8	14	normal
1865	100	87	\N	7	14	normal
1866	100	65	\N	6	14	normal
1867	100	65	\N	7	14	normal
1868	100	82	\N	7	2.5	warmup
1869	100	82	\N	6	7.5	normal
1870	100	82	\N	6	5	normal
1871	100	82	\N	4	5	dropset
1872	100	84	\N	5	7.5	warmup
1873	100	84	\N	11	15	normal
1874	100	84	\N	12	15	normal
1875	100	100	\N	12	5	normal
1876	100	100	\N	8	7.5	normal
1877	100	19	\N	8	60	normal
1878	100	31	\N	7	50	normal
1879	100	85	\N	8	20	normal
1880	100	85	\N	8	16	dropset
1881	101	7	\N	5	70	warmup
1882	101	7	\N	5	90	warmup
1883	101	7	\N	11	100	normal
1884	101	7	\N	11	100	normal
1885	101	41	\N	8	55	warmup
1886	101	41	\N	13	75	normal
1887	101	41	\N	8	85	normal
1888	101	41	\N	6	75	dropset
1889	101	4	\N	9	85	warmup
1890	101	4	\N	14	110	normal
1891	101	4	\N	15	105	normal
1892	101	4	\N	5	55	normal
1893	101	12	\N	8	20	warmup
1894	101	12	\N	12	30	normal
1895	101	5	\N	5	80	warmup
1896	101	5	\N	9	85	normal
1897	101	5	\N	7	85	normal
1898	101	68	\N	14	40	normal
1899	101	68	\N	10	40	normal
1900	101	68	\N	8	40	normal
1901	102	23	\N	7	40	warmup
1902	102	23	\N	10	40	normal
1903	102	23	\N	10	40	normal
1904	102	23	\N	8	40	normal
1905	102	23	\N	5	40	dropset
1906	102	101	\N	5	94	warmup
1907	102	101	\N	7	10	normal
1908	102	101	\N	3	94	dropset
1909	102	101	\N	6	10	normal
1910	102	101	\N	2	94	dropset
1911	102	29	\N	6	30	warmup
1912	102	29	\N	7	45	normal
1913	102	29	\N	7	40	normal
1914	102	46	\N	7	60	normal
1915	102	33	\N	7	60	normal
1916	102	31	\N	7	60	normal
1917	102	64	\N	5	12	warmup
1918	102	64	\N	9	12	normal
1919	102	64	\N	7	12	normal
1920	102	64	\N	7	10	normal
1921	102	16	\N	10	9	normal
1922	102	16	\N	7	9	normal
1923	103	95	\N	6	14	warmup
1924	103	95	\N	10	18	normal
1925	103	95	\N	8	22	normal
1926	103	95	\N	5	26	normal
1927	103	95	\N	7	22	normal
1928	103	28	\N	8	14	normal
1929	103	28	\N	6	18	normal
1930	103	65	\N	9	16	normal
1931	103	65	\N	6	16	normal
1932	103	19	\N	6	50	warmup
1933	103	19	\N	10	70	normal
1934	103	19	\N	7	70	normal
1935	103	31	\N	12	60	normal
1936	103	31	\N	9	60	normal
1937	103	85	\N	16	20	normal
1938	103	85	\N	15	20	normal
1939	104	41	\N	8	55	warmup
1940	104	41	\N	15	70	normal
1941	104	41	\N	8	85	normal
1942	104	41	\N	12	75	normal
1943	104	102	\N	6	30	warmup
1944	104	102	\N	6	45	warmup
1945	104	102	\N	4	50	normal
1946	104	102	\N	7	60	normal
1947	104	102	\N	6	60	normal
1948	104	59	\N	10	60	warmup
1949	104	59	\N	10	85	normal
1950	104	59	\N	10	80	normal
1951	104	7	\N	6	70	warmup
1952	104	7	\N	5	90	warmup
1953	104	7	\N	10	100	normal
1954	104	7	\N	10	100	normal
1955	104	24	\N	7	100	normal
1956	104	24	\N	11	110	normal
1957	104	24	\N	10	105	normal
1958	104	24	\N	6	90	dropset
1959	104	68	\N	12	45	normal
1960	104	68	\N	11	40	normal
1961	104	68	\N	9	45	normal
1962	105	31	\N	7	30	warmup
1963	105	31	\N	8	45	normal
1964	105	31	\N	10	60	failure
1965	105	31	\N	9	55	normal
1966	105	27	\N	8	60	warmup
1967	105	27	\N	8	70	normal
1968	105	19	\N	7	60	warmup
1969	105	19	\N	4	65	warmup
1970	105	19	\N	7	70	normal
1971	105	85	\N	14	20	normal
1972	105	85	\N	18	16	normal
1973	105	85	\N	20	16	normal
1974	105	58	\N	6	20	warmup
1975	105	58	\N	8	40	normal
1976	105	58	\N	8	45	normal
1977	105	93	\N	7	10	normal
1978	105	103	\N	12	15	normal
1979	105	16	\N	12	10	normal
1980	105	16	\N	10	10	normal
1981	105	16	\N	9	10	failure
1982	106	56	\N	12	94	normal
1983	106	56	\N	13	94	normal
1984	106	56	\N	10	94	normal
1985	106	10	\N	6	94	warmup
1986	106	10	\N	10	20	normal
1987	106	10	\N	10	94	dropset
1988	106	10	\N	11	20	normal
1989	106	90	\N	6	60	warmup
1990	106	90	\N	6	80	normal
1991	106	90	\N	10	105	normal
1992	106	90	\N	8	120	normal
1993	106	90	\N	6	130	normal
1994	106	41	\N	8	50	warmup
1995	106	41	\N	6	70	normal
1996	106	41	\N	6	85	normal
1997	106	41	\N	8	80	normal
1998	106	7	\N	6	75	warmup
1999	106	7	\N	4	95	warmup
2000	106	7	\N	8	105	normal
2001	106	7	\N	10	100	normal
2002	107	44	\N	6	30	warmup
2003	107	44	\N	6	40	normal
2004	107	44	\N	6	50	normal
2005	107	44	\N	7	60	failure
2006	107	44	\N	6	60	failure
2007	107	27	\N	8	55	warmup
2008	107	27	\N	6	70	normal
2009	107	27	\N	8	70	normal
2010	107	27	\N	8	65	normal
2011	107	27	\N	4	65	dropset
2012	107	23	\N	7	40	warmup
2013	107	23	\N	5	50	normal
2014	107	23	\N	7	45	normal
2015	107	23	\N	5	40	dropset
2016	107	3	\N	5	15	warmup
2017	107	3	\N	8	20	normal
2018	107	15	\N	6	22.5	normal
2019	107	84	\N	9	15	normal
2020	107	84	\N	9	15	normal
2021	108	41	\N	6	40	warmup
2022	108	41	\N	6	60	warmup
2023	108	41	\N	6	70	normal
2024	108	41	\N	11	80	normal
2025	108	41	\N	8	80	normal
2026	108	7	\N	6	60	warmup
2027	108	7	\N	9	90	normal
2028	108	7	\N	10	100	normal
2029	108	4	\N	8	85	warmup
2030	108	4	\N	13	110	normal
2031	108	4	\N	11	110	normal
2032	108	24	\N	8	85	warmup
2033	108	24	\N	10	110	normal
2034	109	87	\N	6	12	normal
2035	109	87	\N	8	14	normal
2036	109	87	\N	10	16	normal
2037	109	87	\N	8	16	normal
2038	109	28	\N	10	14	normal
2039	109	65	\N	8	16	normal
2040	109	65	\N	7	14	failure
2041	109	19	\N	7	60	warmup
2042	109	19	\N	4	65	warmup
2043	109	19	\N	7	70	normal
2044	109	19	\N	7	65	normal
2045	109	42	\N	6	30	warmup
2046	109	42	\N	6	40	warmup
2047	109	42	\N	6	50	normal
2048	109	42	\N	5	55	normal
2049	109	42	\N	7	50	normal
2050	109	64	\N	10	12	normal
2051	109	64	\N	8	12	normal
2052	109	3	\N	8	20	normal
2053	109	11	\N	7	94	normal
2054	110	56	\N	12	94	normal
2055	110	56	\N	6	94	dropset
2056	110	56	\N	12	94	normal
2057	110	56	\N	8	94	dropset
2058	110	56	\N	7	94	dropset
2059	110	56	\N	6	94	dropset
2060	110	10	\N	6	94	warmup
2061	110	10	\N	6	20	normal
2062	110	10	\N	12	20	normal
2063	110	10	\N	18	94	dropset
2064	110	102	\N	6	30	warmup
2065	110	102	\N	6	40	warmup
2066	110	102	\N	3	50	normal
2067	110	102	\N	6	60	normal
2068	110	102	\N	5	60	normal
2069	110	59	\N	6	60	warmup
2070	110	59	\N	10	80	normal
2071	110	59	\N	9	85	normal
2072	110	92	\N	7	100	normal
2073	111	57	\N	6	25	warmup
2074	111	57	\N	11	40	normal
2075	111	69	\N	12	35	normal
2076	111	69	\N	13	40	normal
2077	111	46	\N	11	55	normal
2078	111	46	\N	7	60	normal
2079	111	18	\N	6	12.5	warmup
2080	111	18	\N	6	25	normal
2081	111	18	\N	6	27.5	normal
2082	111	15	\N	6	25	normal
2083	111	15	\N	5	25	normal
2084	111	84	\N	10	15	normal
2085	111	84	\N	9	15	normal
2086	111	84	\N	10	15	normal
2087	111	84	\N	7	15	normal
2088	111	30	\N	6	20	warmup
2089	111	30	\N	8	25	normal
2090	111	30	\N	10	22.5	normal
2091	111	14	\N	10	25	normal
2092	111	14	\N	8	22.5	normal
2093	111	27	\N	8	65	normal
2094	112	41	\N	7	60	warmup
2095	112	41	\N	8	70	normal
2096	112	41	\N	8	80	normal
2097	112	41	\N	10	80	failure
2098	112	47	\N	6	20	warmup
2099	112	47	\N	8	60	normal
2100	112	47	\N	6	70	normal
2101	112	47	\N	10	80	normal
2102	112	5	\N	8	60	warmup
2103	112	5	\N	10	80	normal
2104	112	5	\N	17	80	normal
2105	112	50	\N	10	94	normal
2106	112	50	\N	15	94	normal
2107	113	99	\N	8	25	normal
2108	113	99	\N	8	30	normal
2109	113	32	\N	7	94	normal
2110	113	32	\N	7	94	normal
2111	113	76	\N	6	45	warmup
2112	113	76	\N	10	65	normal
2113	113	76	\N	7	65	normal
2114	113	104	\N	10	15	normal
2115	113	104	\N	10	12.5	normal
2116	113	98	\N	10	20	normal
2117	113	98	\N	10	20	normal
2118	113	98	\N	7	20	normal
2119	113	64	\N	8	12	normal
2120	113	64	\N	8	12	normal
2121	113	64	\N	9	10	normal
2122	113	27	\N	6	55	warmup
2123	113	27	\N	5	70	normal
2124	113	27	\N	17	60	dropset
2125	113	19	\N	6	60	warmup
2126	113	19	\N	6	70	normal
2127	113	19	\N	5	65	failure
2128	113	19	\N	7	50	dropset
2129	113	16	\N	12	9	normal
2130	113	16	\N	7	9	dropset
2131	113	16	\N	7	9	dropset
2132	113	16	\N	7	9	dropset
2133	113	16	\N	10	9	normal
2134	114	6	\N	6	94	warmup
2135	114	6	\N	29	94	normal
2136	114	54	\N	6	40	normal
2137	114	54	\N	7	50	normal
2138	114	54	\N	7	60	normal
2139	114	54	\N	7	60	normal
2140	114	92	\N	6	85	normal
2141	114	92	\N	7	105	normal
2142	114	92	\N	8	105	normal
2143	114	84	\N	10	12.5	normal
2144	114	84	\N	10	15	normal
2145	114	84	\N	8	15	normal
2146	114	84	\N	8	15	normal
2147	114	46	\N	6	50	normal
2148	114	46	\N	9	55	normal
2149	114	34	\N	8	50	normal
2150	114	34	\N	8	40	dropset
2151	114	34	\N	6	40	dropset
2152	115	17	\N	23	94	normal
2153	115	17	\N	20	94	normal
2154	115	17	\N	16	94	normal
2155	115	6	\N	10	94	warmup
2156	115	6	\N	29	94	normal
2157	115	50	\N	11	94	normal
2158	115	50	\N	15	94	normal
2159	116	33	\N	6	40	warmup
2160	116	33	\N	6	55	normal
2161	116	33	\N	8	60	normal
2162	116	83	\N	6	94	normal
2163	116	83	\N	10	94	normal
2164	116	83	\N	10	94	normal
2165	116	69	\N	8	40	normal
2166	116	29	\N	4	30	warmup
2167	116	29	\N	10	32.5	normal
2168	116	29	\N	6	32.5	normal
2169	116	86	\N	6	12.5	warmup
2170	116	86	\N	6	20	normal
2171	116	86	\N	5	20	normal
2172	116	66	\N	11	20	normal
2173	116	66	\N	6	22.5	normal
2174	116	66	\N	13	15	normal
2175	116	16	\N	11	10	normal
2176	116	30	\N	12	20	normal
2177	116	30	\N	10	22.5	normal
2178	116	48	\N	6	2.5	normal
2179	116	48	\N	6	2.5	normal
2180	117	57	\N	6	30	warmup
2181	117	57	\N	10	35	normal
2182	117	57	\N	11	40	normal
2183	117	57	\N	9	40	normal
2184	117	69	\N	6	35	normal
2185	117	69	\N	10	40	normal
2186	117	69	\N	10	40	normal
2187	117	69	\N	3	40	dropset
2188	117	78	\N	6	20	normal
2189	117	78	\N	6	30	normal
2190	117	78	\N	6	30	normal
2191	117	19	\N	8	45	warmup
2192	117	19	\N	6	70	failure
2193	117	19	\N	6	65	failure
2194	117	19	\N	5	60	failure
2195	117	3	\N	10	17.5	normal
2196	117	3	\N	8	17.5	normal
2197	117	3	\N	7	17.5	normal
2198	117	3	\N	10	12.5	dropset
2199	117	84	\N	6	12.5	normal
2200	117	84	\N	8	12.5	normal
2201	117	84	\N	10	12.5	normal
2202	117	48	\N	7	2.5	normal
2203	117	48	\N	6	5	normal
2204	117	48	\N	4	5	normal
2205	117	48	\N	5	2.5	dropset
2206	118	41	\N	7	40	warmup
2207	118	41	\N	9	65	normal
2208	118	41	\N	10	75	normal
2209	118	41	\N	4	75	dropset
2210	118	41	\N	7	75	normal
2211	118	41	\N	7	60	dropset
2212	118	47	\N	7	20	warmup
2213	118	47	\N	7	40	normal
2214	118	47	\N	8	60	normal
2215	118	91	\N	6	40	normal
2216	118	91	\N	9	60	normal
2217	118	59	\N	9	80	normal
2218	118	59	\N	8	85	normal
2219	118	5	\N	8	60	warmup
2220	118	5	\N	5	80	normal
2221	118	5	\N	11	85	normal
2222	118	5	\N	9	85	normal
2223	118	5	\N	5	80	dropset
2224	118	22	\N	8	30	warmup
2225	118	22	\N	15	45	normal
2226	118	22	\N	10	50	normal
2227	118	22	\N	10	50	dropset
2228	118	17	\N	23	94	normal
2229	118	17	\N	16	94	normal
2230	118	17	\N	12	94	normal
2231	119	19	\N	12	40	warmup
2232	119	19	\N	13	60	failure
2233	119	19	\N	6	70	normal
2234	119	53	\N	8	40	normal
2235	119	53	\N	9	50	normal
2236	119	53	\N	9	50	failure
2237	119	53	\N	9	50	dropset
2238	119	53	\N	6	40	normal
2239	119	53	\N	6	40	dropset
2240	119	27	\N	6	35	normal
2241	119	27	\N	10	55	normal
2242	119	27	\N	15	60	normal
2243	119	27	\N	15	60	dropset
2244	119	30	\N	8	17.5	warmup
2245	119	30	\N	10	22.5	normal
2246	119	30	\N	9	22.5	normal
2247	119	3	\N	9	17.5	normal
2248	119	3	\N	6	17.5	normal
2249	119	3	\N	10	12.5	dropset
2250	119	40	\N	15	20	normal
2251	119	40	\N	12	20	dropset
2252	120	6	\N	10	94	warmup
2253	120	6	\N	15	94	normal
2254	120	6	\N	10	94	normal
2255	120	102	\N	6	20	warmup
2256	120	102	\N	6	30	warmup
2257	120	102	\N	7	50	normal
2258	120	102	\N	5	60	normal
2259	120	102	\N	7	50	normal
2260	120	41	\N	6	40	warmup
2261	120	41	\N	8	65	normal
2262	120	41	\N	9	75	normal
2263	120	41	\N	6	75	normal
2264	120	41	\N	6	60	dropset
2265	120	5	\N	8	60	warmup
2266	120	5	\N	10	85	normal
2267	120	4	\N	7	100	warmup
2268	120	4	\N	12	110	normal
2269	120	4	\N	10	110	normal
2270	120	24	\N	8	110	normal
2271	120	24	\N	10	105	normal
2272	120	24	\N	4	90	dropset
2273	121	77	\N	5	94	warmup
2274	121	77	\N	8	94	normal
2275	121	77	\N	6	94	normal
2276	121	77	\N	5	94	dropset
2277	121	99	\N	10	20	normal
2278	121	99	\N	8	30	normal
2279	121	99	\N	5	35	normal
2280	121	99	\N	5	30	normal
2281	121	23	\N	8	40	warmup
2282	121	23	\N	6	50	normal
2283	121	23	\N	5	50	normal
2284	121	29	\N	8	30	normal
2285	121	29	\N	10	32.5	normal
2286	121	29	\N	9	32.5	normal
2287	121	29	\N	8	30	normal
2288	121	64	\N	7	10	normal
2289	121	64	\N	12	10	normal
2290	121	64	\N	11	10	normal
2291	121	3	\N	14	15	normal
2292	121	3	\N	10	17.5	normal
2293	121	3	\N	10	12.5	dropset
2294	122	102	\N	6	40	normal
2295	122	102	\N	5	50	normal
2296	122	102	\N	5	60	normal
2297	122	91	\N	9	40	normal
2298	122	91	\N	8	60	normal
2299	122	92	\N	10	80	normal
2300	122	92	\N	7	100	normal
2301	123	18	\N	8	10	warmup
2302	123	18	\N	10	20	normal
2303	123	18	\N	6	27.5	normal
2304	123	18	\N	5	25	failure
2305	123	23	\N	6	40	warmup
2306	123	23	\N	7	50	normal
2307	123	23	\N	6	50	normal
2308	123	3	\N	8	12.5	normal
2309	123	3	\N	6	15	normal
2310	123	104	\N	9	15	normal
2311	123	104	\N	6	15	dropset
2312	123	104	\N	7	15	normal
2313	123	15	\N	6	25	normal
2314	123	15	\N	6	20	dropset
2315	124	6	\N	25	94	normal
2316	124	6	\N	20	94	normal
2317	124	17	\N	6	94	normal
2318	124	17	\N	22	94	normal
2319	124	17	\N	8	94	normal
2320	124	17	\N	15	94	dropset
2321	124	83	\N	8	94	normal
2322	124	83	\N	10	94	normal
2323	124	77	\N	6	94	normal
2324	124	77	\N	8	94	normal
2325	124	50	\N	10	94	normal
2326	124	50	\N	14	94	normal
2327	125	6	\N	8	94	normal
2328	125	6	\N	12	94	normal
2329	125	6	\N	10	94	normal
2330	125	17	\N	8	94	normal
2331	125	17	\N	22	94	normal
2332	125	7	\N	6	70	warmup
2333	125	7	\N	12	90	normal
2334	125	7	\N	12	90	normal
2335	125	47	\N	6	40	normal
2336	125	47	\N	8	60	normal
2337	125	47	\N	8	70	normal
2338	125	45	\N	5	10	normal
2339	125	45	\N	8	15	normal
2340	125	45	\N	8	12.5	normal
2341	126	42	\N	8	40	normal
2342	126	42	\N	10	50	normal
2343	126	42	\N	5	60	normal
2344	126	42	\N	5	60	failure
2345	126	65	\N	10	14	normal
2346	126	65	\N	9	12	normal
2347	126	65	\N	8	12	failure
2348	126	87	\N	6	12	normal
2349	126	87	\N	11	14	normal
2350	126	87	\N	9	14	normal
2351	126	87	\N	7	12	normal
2352	126	19	\N	6	50	warmup
2353	126	19	\N	7	70	failure
2354	126	19	\N	7	60	normal
2355	126	31	\N	12	50	normal
2356	126	31	\N	10	60	failure
2357	126	31	\N	7	60	failure
2358	126	31	\N	4	50	dropset
2359	126	14	\N	10	15	warmup
2360	126	14	\N	8	25	normal
2361	126	14	\N	7	25	normal
2362	126	14	\N	8	20	normal
2363	126	14	\N	7	20	normal
2364	126	15	\N	7	25	normal
2365	126	15	\N	10	20	normal
2366	126	15	\N	8	20	normal
2367	127	15	\N	8	15	warmup
2368	127	15	\N	12	22.5	normal
2369	127	15	\N	7	25	normal
2370	127	14	\N	8	15	warmup
2371	127	14	\N	12	22.5	normal
2372	127	14	\N	7	25	normal
2373	127	30	\N	8	15	warmup
2374	127	30	\N	8	22.5	normal
2375	127	30	\N	9	20	normal
2376	127	30	\N	9	22.5	normal
2377	127	3	\N	8	12.5	normal
2378	127	3	\N	12	15	normal
2379	127	3	\N	11	15	normal
2380	127	3	\N	12	12.5	normal
2381	127	66	\N	8	12.5	warmup
2382	127	66	\N	8	20	normal
2383	127	66	\N	10	20	normal
2384	127	16	\N	11	10	normal
2385	127	16	\N	10	10	normal
2386	127	16	\N	10	10	failure
2387	127	79	\N	8	14	normal
2388	127	79	\N	6	14	normal
2389	128	41	\N	6	45	normal
2390	128	41	\N	12	65	normal
2391	128	41	\N	8	75	normal
2392	128	41	\N	8	75	normal
2393	128	41	\N	8	75	normal
2394	128	47	\N	8	40	normal
2395	128	47	\N	8	60	normal
2396	128	47	\N	8	70	normal
2397	128	47	\N	9	80	normal
2398	128	47	\N	6	80	normal
2399	128	91	\N	6	60	normal
2400	128	91	\N	8	60	normal
2401	128	91	\N	6	60	normal
2402	128	7	\N	6	80	warmup
2403	128	7	\N	10	100	normal
2404	128	7	\N	10	100	normal
2405	128	7	\N	11	90	normal
2406	128	7	\N	5	75	dropset
2407	128	5	\N	8	60	warmup
2408	128	5	\N	11	80	normal
2409	128	5	\N	7	85	normal
2410	128	5	\N	7	85	normal
2411	128	5	\N	6	70	dropset
2412	129	99	\N	10	15	normal
2413	129	99	\N	10	15	normal
2414	129	96	\N	10	9	normal
2415	129	96	\N	13	9	normal
2416	129	96	\N	10	9	normal
2417	129	58	\N	8	20	warmup
2418	129	58	\N	10	40	normal
2419	129	58	\N	8	40	normal
2420	129	86	\N	10	10	warmup
2421	129	86	\N	5	20	dropset
2422	129	86	\N	7	20	normal
2423	129	66	\N	6	10	warmup
2424	129	66	\N	9	20	normal
2425	129	66	\N	9	20	normal
2426	129	66	\N	6	15	dropset
2427	129	3	\N	7	12.5	normal
2428	129	3	\N	7	15	normal
2429	129	3	\N	6	12.5	dropset
2430	130	107	\N	10	20	normal
2431	130	107	\N	9	27.5	normal
2432	130	107	\N	11	27.5	normal
2433	130	17	\N	20	94	normal
2434	130	17	\N	19	94	normal
2435	130	17	\N	15	94	failure
2436	131	44	\N	6	30	warmup
2437	131	44	\N	6	40	normal
2438	131	44	\N	4	50	normal
2439	131	44	\N	7	60	normal
2440	131	99	\N	10	15	normal
2441	131	99	\N	10	15	normal
2442	131	99	\N	10	20	normal
2443	131	99	\N	11	20	normal
2444	131	77	\N	6	94	normal
2445	131	77	\N	8	94	normal
2446	131	108	\N	6	4	failure
2447	131	108	\N	2	94	dropset
2448	131	80	\N	10	18	normal
2449	131	80	\N	10	22	normal
2450	131	54	\N	8	40	normal
2451	131	54	\N	7	50	normal
2452	131	54	\N	6	60	normal
2453	131	54	\N	5	70	failure
2454	131	92	\N	6	80	warmup
2455	131	92	\N	6	90	normal
2456	131	92	\N	7	100	normal
2457	131	92	\N	5	100	normal
2458	131	67	\N	14	20	normal
2459	131	67	\N	5	25	normal
2460	131	97	\N	7	25	normal
2461	132	17	\N	18	94	normal
2462	132	17	\N	17	94	normal
2463	132	17	\N	15	94	normal
2464	132	90	\N	8	60	warmup
2465	132	90	\N	6	85	normal
2466	132	90	\N	9	105	normal
2467	132	90	\N	8	105	normal
2468	132	41	\N	10	35	normal
2469	132	41	\N	11	65	normal
2470	132	41	\N	6	80	normal
2471	132	41	\N	10	75	normal
2472	132	41	\N	9	75	normal
2473	132	41	\N	7	60	dropset
2474	132	24	\N	8	80	warmup
2475	132	24	\N	11	105	normal
2476	132	24	\N	7	110	normal
2477	132	24	\N	7	100	normal
2478	132	24	\N	6	85	dropset
2479	132	7	\N	8	80	warmup
2480	132	7	\N	11	90	normal
2481	132	7	\N	9	100	normal
2482	132	7	\N	10	90	normal
2483	133	40	\N	6	8	warmup
2484	133	40	\N	25	18	normal
2485	133	40	\N	20	18	normal
2486	133	40	\N	15	18	normal
2487	133	11	\N	7	94	normal
2488	133	11	\N	8	94	failure
2489	133	18	\N	6	10	warmup
2490	133	18	\N	6	20	warmup
2491	133	18	\N	8	25	normal
2492	133	18	\N	4	27.5	failure
2493	133	34	\N	8	50	normal
2494	133	34	\N	10	55	normal
2495	133	34	\N	8	40	dropset
2496	133	34	\N	8	55	normal
2497	133	34	\N	6	40	dropset
2498	133	19	\N	6	50	warmup
2499	133	19	\N	12	60	failure
2500	133	19	\N	6	60	normal
2501	133	16	\N	9	12	warmup
2502	133	16	\N	11	10	failure
2503	133	16	\N	10	10	failure
2504	134	13	\N	10	25	warmup
2505	134	13	\N	8	35	warmup
2506	134	13	\N	5	45	normal
2507	134	13	\N	9	50	normal
2508	134	13	\N	6	55	normal
2509	134	13	\N	4	45	dropset
2510	134	90	\N	8	40	warmup
2511	134	90	\N	8	60	warmup
2512	134	90	\N	6	80	normal
2513	134	90	\N	9	105	normal
2514	134	90	\N	7	120	normal
2515	134	68	\N	12	30	normal
2516	134	68	\N	12	40	normal
2517	134	68	\N	10	40	normal
2518	134	68	\N	7	40	normal
2519	134	68	\N	6	30	dropset
2520	134	26	\N	6	94	warmup
2521	134	26	\N	10	10	normal
2522	134	26	\N	9	20	normal
2523	134	26	\N	10	20	normal
2524	135	33	\N	6	35	warmup
2525	135	33	\N	8	50	normal
2526	135	33	\N	7	60	normal
2527	135	33	\N	2	60	dropset
2528	135	33	\N	6	60	normal
2529	135	33	\N	5	50	dropset
2530	135	101	\N	7	94	normal
2531	135	101	\N	8	5	normal
2532	135	101	\N	3	94	dropset
2533	135	109	\N	7	55	failure
2534	135	109	\N	4	55	dropset
2535	135	37	\N	8	30	warmup
2536	135	37	\N	6	35	normal
2537	135	37	\N	8	40	normal
2538	135	37	\N	7	40	normal
2539	135	29	\N	8	35	normal
2540	135	29	\N	7	30	failure
2541	135	23	\N	6	40	warmup
2542	135	23	\N	6	50	normal
2543	135	23	\N	4	45	dropset
2544	135	23	\N	5	40	normal
2545	135	110	\N	10	45	normal
2546	135	16	\N	10	6	warmup
2547	135	16	\N	9	10	failure
2548	135	16	\N	7	10	failure
2549	135	16	\N	5	10	dropset
2550	135	67	\N	12	20	normal
2551	135	67	\N	9	20	normal
2552	135	67	\N	8	20	normal
2553	136	11	\N	10	94	normal
2554	136	11	\N	10	94	failure
2555	136	11	\N	8	94	normal
2556	136	11	\N	10	94	normal
2557	136	8	\N	6	20	warmup
2558	136	8	\N	10	35	normal
2559	136	8	\N	13	35	normal
2560	136	8	\N	10	35	normal
2561	136	66	\N	6	17.5	warmup
2562	136	66	\N	6	20	normal
2563	136	66	\N	6	15	dropset
2564	136	66	\N	7	17.5	normal
2565	136	39	\N	8	7.5	normal
2566	136	39	\N	3	12.5	normal
2567	136	39	\N	7	7.5	dropset
2568	136	39	\N	7	7.5	normal
2569	136	86	\N	6	20	normal
2570	136	86	\N	4	15	dropset
2571	136	86	\N	5	22.5	normal
2572	136	86	\N	2	17.5	dropset
2573	137	10	\N	8	20	warmup
2574	137	10	\N	12	30	normal
2575	137	10	\N	9	30	normal
2576	137	10	\N	10	94	dropset
2577	137	17	\N	14	94	normal
2578	137	70	\N	12	45	normal
2579	137	70	\N	12	50	normal
2580	137	70	\N	12	40	normal
2581	137	4	\N	6	80	warmup
2582	137	4	\N	6	100	warmup
2583	137	4	\N	12	110	normal
2584	137	4	\N	9	110	normal
2585	137	24	\N	8	80	warmup
2586	137	24	\N	14	100	normal
2587	137	24	\N	6	110	normal
2588	137	24	\N	6	100	dropset
2589	137	24	\N	6	90	normal
2590	137	54	\N	8	40	normal
2591	137	54	\N	8	50	normal
2592	137	54	\N	5	60	normal
2593	137	54	\N	5	70	failure
2594	137	92	\N	5	90	normal
2595	137	92	\N	5	100	normal
2596	137	92	\N	5	110	normal
2597	137	92	\N	6	100	normal
2598	138	44	\N	10	25	warmup
2599	138	44	\N	10	40	normal
2600	138	44	\N	10	50	normal
2601	138	44	\N	10	50	normal
2602	138	44	\N	7	50	normal
2603	138	34	\N	8	55	normal
2604	138	34	\N	8	60	normal
2605	138	34	\N	7	60	normal
2606	138	34	\N	5	50	dropset
2607	138	18	\N	8	15	warmup
2608	138	18	\N	8	25	normal
2609	138	18	\N	6	27.5	normal
2610	138	83	\N	10	94	normal
2611	139	8	\N	8	15	warmup
2612	139	8	\N	10	20	normal
2613	139	8	\N	7	25	normal
2614	139	8	\N	9	22.5	normal
2615	139	14	\N	8	17.5	warmup
2616	139	14	\N	10	22.5	normal
2617	139	14	\N	11	22.5	normal
2618	139	14	\N	9	20	normal
2619	139	15	\N	15	12.5	warmup
2620	139	15	\N	8	20	normal
2621	139	15	\N	5	25	normal
2622	139	15	\N	5	20	dropset
2623	139	15	\N	7	22.5	normal
2624	139	15	\N	4	20	dropset
2625	139	16	\N	12	8	normal
2626	139	16	\N	7	10	normal
2627	139	16	\N	6	10	failure
2628	139	16	\N	4	8	dropset
2629	139	19	\N	6	50	warmup
2630	139	19	\N	11	60	failure
2631	139	19	\N	7	60	normal
2632	139	19	\N	4	50	dropset
2633	140	6	\N	10	94	normal
2634	140	6	\N	21	94	normal
2635	140	6	\N	18	94	normal
2636	140	17	\N	12	94	normal
2637	140	17	\N	15	94	normal
2638	140	17	\N	15	94	normal
2639	140	90	\N	8	40	warmup
2640	140	90	\N	8	60	warmup
2641	140	90	\N	6	80	normal
2642	140	90	\N	8	105	normal
2643	140	90	\N	5	120	normal
2644	140	90	\N	10	100	normal
2645	140	24	\N	8	40	warmup
2646	140	24	\N	8	60	warmup
2647	140	24	\N	13	80	normal
2648	140	50	\N	10	94	normal
2649	140	50	\N	10	94	normal
2650	140	59	\N	8	70	normal
2651	140	59	\N	10	80	normal
2652	140	111	\N	8	16	normal
2653	140	111	\N	6	16	normal
2654	140	111	\N	3	94	dropset
2655	141	18	\N	8	10	warmup
2656	141	18	\N	6	15	warmup
2657	141	18	\N	10	20	normal
2658	141	18	\N	7	25	normal
2659	141	18	\N	6	27.5	normal
2660	141	18	\N	5	25	normal
2661	141	32	\N	8	94	normal
2662	141	32	\N	10	94	normal
2663	141	53	\N	7	40	normal
2664	141	53	\N	9	50	normal
2665	141	53	\N	9	50	failure
2666	141	53	\N	9	40	normal
2667	141	11	\N	10	94	normal
2668	141	11	\N	6	94	failure
2669	142	5	\N	7	60	warmup
2670	142	5	\N	10	80	normal
2671	142	5	\N	9	90	normal
2672	142	5	\N	7	90	normal
2673	142	90	\N	10	60	normal
2674	142	90	\N	6	70	normal
2675	142	90	\N	10	80	normal
2676	142	90	\N	8	100	normal
2677	142	90	\N	7	110	normal
2678	142	7	\N	6	80	warmup
2679	142	7	\N	10	90	normal
2680	142	7	\N	10	90	normal
2681	142	6	\N	12	94	normal
2682	142	6	\N	20	94	normal
2683	142	56	\N	10	94	normal
2684	142	56	\N	10	94	normal
2685	143	11	\N	6	94	normal
2686	143	11	\N	9	94	normal
2687	143	11	\N	7	94	normal
2688	143	29	\N	6	20	warmup
2689	143	29	\N	6	32.5	normal
2690	143	29	\N	5	35	normal
2691	143	29	\N	5	32.5	normal
2692	143	29	\N	6	30	normal
2693	143	2	\N	10	7.5	normal
2694	143	2	\N	9	7.5	normal
2695	143	2	\N	10	7.5	failure
2696	143	2	\N	9	5	dropset
2697	143	2	\N	7	5	dropset
2698	143	66	\N	10	15	normal
2699	143	66	\N	10	20	normal
2700	143	66	\N	12	15	normal
2701	143	3	\N	10	12.5	normal
2702	143	3	\N	6	15	failure
2703	143	3	\N	8	12.5	normal
2704	143	3	\N	3	12.5	dropset
2705	143	19	\N	10	60	normal
2706	143	19	\N	7	60	failure
2707	143	31	\N	9	55	normal
2708	143	31	\N	6	60	failure
2709	143	31	\N	4	50	dropset
2710	143	85	\N	13	20	normal
2711	143	85	\N	18	16	normal
2712	143	85	\N	18	16	normal
2713	144	32	\N	5	94	warmup
2714	144	32	\N	10	94	normal
2715	144	6	\N	15	94	normal
2716	144	108	\N	4	10	failure
2717	144	108	\N	4	94	dropset
2718	144	10	\N	12	30	normal
2719	144	54	\N	8	40	normal
2720	144	54	\N	8	50	normal
2721	144	54	\N	7	60	normal
2722	144	92	\N	9	70	normal
2723	144	92	\N	9	80	normal
2724	144	92	\N	9	90	normal
2725	144	57	\N	10	35	normal
2726	144	57	\N	10	35	normal
2727	144	5	\N	8	60	warmup
2728	144	5	\N	9	80	normal
2729	144	5	\N	9	90	normal
2730	144	85	\N	20	10	normal
2731	144	85	\N	18	15	normal
2732	144	85	\N	18	15	dropset
2733	145	8	\N	8	15	warmup
2734	145	8	\N	10	20	normal
2735	145	8	\N	7	25	normal
2736	145	8	\N	8	20	normal
2737	145	23	\N	6	30	warmup
2738	145	23	\N	6	45	normal
2739	145	23	\N	9	40	normal
2740	145	69	\N	10	35	normal
2741	145	69	\N	9	40	normal
2742	145	85	\N	13	16	normal
2743	145	85	\N	13	12	normal
2744	146	5	\N	8	60	warmup
2745	146	5	\N	8	80	normal
2746	146	5	\N	9	90	normal
2747	146	4	\N	6	80	warmup
2748	146	4	\N	15	100	normal
2749	146	4	\N	10	110	normal
2750	146	4	\N	8	110	normal
2751	146	24	\N	10	100	normal
2752	146	24	\N	3	110	normal
2753	146	24	\N	12	100	normal
2754	146	50	\N	9	94	normal
2755	146	50	\N	10	94	normal
2756	146	50	\N	8	94	normal
2757	146	6	\N	12	94	normal
2758	146	10	\N	8	26	normal
2759	146	10	\N	4	26	dropset
2760	146	10	\N	4	26	dropset
2761	146	70	\N	12	30	normal
2762	146	70	\N	12	50	normal
2763	146	70	\N	9	60	normal
2764	146	70	\N	9	60	normal
2765	146	70	\N	35	45	normal
2766	147	6	\N	12	94	normal
2767	147	32	\N	8	94	normal
2768	147	10	\N	12	20	normal
2769	147	44	\N	10	40	normal
2770	147	44	\N	9	45	normal
2771	147	44	\N	8	50	normal
2772	147	44	\N	5	50	normal
2773	147	40	\N	6	16	warmup
2774	147	40	\N	19	20	normal
2775	147	70	\N	8	40	normal
2776	147	70	\N	12	50	normal
2777	147	70	\N	12	50	normal
2778	148	11	\N	5	94	normal
2779	148	11	\N	10	94	normal
2780	148	32	\N	5	94	normal
2781	148	32	\N	8	94	normal
2782	148	69	\N	10	35	normal
2783	148	57	\N	12	35	failure
2784	148	85	\N	13	12	normal
2785	148	85	\N	11	12	failure
2786	148	85	\N	11	12	dropset
2787	148	8	\N	6	10	warmup
2788	148	8	\N	4	15	warmup
2789	148	8	\N	9	20	normal
2790	148	8	\N	5	25	normal
2791	148	3	\N	6	15	normal
2792	148	3	\N	5	12.5	normal
2793	148	82	\N	8	5	normal
2794	148	82	\N	5	5	dropset
2795	149	6	\N	8	94	warmup
2796	149	10	\N	12	20	normal
2797	149	10	\N	15	20	normal
2798	149	70	\N	8	30	normal
2799	149	70	\N	12	40	normal
2800	149	70	\N	12	50	normal
2801	149	24	\N	6	80	warmup
2802	149	24	\N	16	95	normal
2803	149	24	\N	12	110	normal
2804	149	4	\N	6	80	warmup
2805	149	4	\N	14	95	normal
2806	149	4	\N	7	110	normal
2807	149	45	\N	5	10	normal
2808	149	45	\N	10	10	normal
2809	149	45	\N	8	10	normal
2810	149	7	\N	10	90	normal
2811	149	7	\N	10	90	normal
2812	149	7	\N	6	75	dropset
2813	150	57	\N	8	30	normal
2814	150	57	\N	13	35	normal
2815	150	57	\N	8	40	normal
2816	150	57	\N	9	40	normal
2817	150	23	\N	5	50	normal
2818	150	23	\N	8	40	normal
2819	150	76	\N	10	40	warmup
2820	150	76	\N	10	65	normal
2821	150	76	\N	7	65	normal
2822	150	112	\N	13	20	normal
2823	150	112	\N	7	20	normal
2824	150	2	\N	20	5	normal
2825	150	2	\N	10	7.5	normal
2826	150	2	\N	20	5	dropset
2827	150	2	\N	19	5	dropset
2828	151	4	\N	12	95	normal
2829	151	4	\N	7	115	normal
2830	151	4	\N	9	105	normal
2831	151	24	\N	10	95	normal
2832	151	24	\N	12	105	normal
2833	151	6	\N	13	94	normal
2834	151	10	\N	10	18	normal
2835	151	10	\N	8	22	normal
2836	151	26	\N	7	20	normal
2837	151	50	\N	9	94	normal
2838	151	50	\N	10	94	normal
2839	152	40	\N	25	12	normal
2840	152	40	\N	20	16	normal
2841	152	87	\N	10	12	normal
2842	152	87	\N	10	14	normal
2843	152	87	\N	9	14	normal
2844	152	95	\N	4	22	normal
2845	152	95	\N	10	18	normal
2846	152	11	\N	7	94	normal
2847	152	11	\N	5	94	normal
2848	152	14	\N	10	22.5	normal
2849	152	14	\N	12	17.5	normal
2850	152	3	\N	11	17.5	normal
2851	152	3	\N	9	17.5	normal
2852	153	5	\N	10	80	normal
2853	153	5	\N	9	90	normal
2854	153	5	\N	8	90	normal
2855	153	22	\N	15	40	normal
2856	153	22	\N	12	45	normal
2857	153	92	\N	8	60	normal
2858	153	92	\N	8	70	normal
2859	153	92	\N	10	80	normal
2860	153	113	\N	12	60	normal
2861	153	113	\N	11	60	normal
2862	153	33	\N	9	50	normal
2863	153	33	\N	5	60	normal
2864	153	33	\N	4	50	dropset
2865	153	38	\N	8	25	normal
2866	153	38	\N	6	25	normal
2867	153	38	\N	4	20	dropset
2868	154	77	\N	6	94	normal
2869	154	77	\N	7	94	normal
2870	154	77	\N	5	94	normal
2871	154	3	\N	6	10	warmup
2872	154	3	\N	9	17.5	normal
2873	154	3	\N	10	17.5	normal
2874	154	87	\N	9	12	normal
2875	154	87	\N	8	12	normal
2876	154	39	\N	7	7.5	normal
2877	154	39	\N	13	7.5	normal
2878	154	39	\N	5	12.5	normal
2879	154	48	\N	11	2.5	normal
2880	154	48	\N	7	2.5	normal
2881	154	48	\N	6	2.5	normal
2882	154	15	\N	10	25	normal
2883	154	15	\N	6	32.5	normal
2884	155	5	\N	8	60	warmup
2885	155	5	\N	9	80	normal
2886	155	5	\N	8	90	normal
2887	155	41	\N	8	30	normal
2888	155	41	\N	10	65	normal
2889	155	41	\N	9	75	normal
2890	155	22	\N	15	35	normal
2891	155	22	\N	12	40	normal
2892	155	47	\N	8	40	normal
2893	155	47	\N	8	60	normal
2894	155	47	\N	8	70	normal
2895	155	111	\N	8	20	normal
2896	155	7	\N	10	90	normal
2897	155	7	\N	7	80	dropset
2898	155	54	\N	10	30	warmup
2899	155	54	\N	12	45	normal
2900	155	54	\N	8	45	normal
2901	155	70	\N	12	35	normal
2902	155	70	\N	8	50	normal
2903	155	70	\N	8	40	dropset
2904	155	70	\N	8	35	dropset
2905	155	70	\N	7	30	dropset
2906	156	95	\N	9	14	normal
2907	156	95	\N	9	18	normal
2908	156	95	\N	8	18	normal
2909	156	96	\N	17	7	normal
2910	156	96	\N	12	9	normal
2911	156	19	\N	12	60	normal
2912	156	31	\N	9	40	normal
2913	156	31	\N	9	30	normal
2914	156	33	\N	8	40	normal
2915	156	33	\N	8	60	normal
2916	156	33	\N	6	60	normal
2917	156	16	\N	11	8	normal
2918	156	16	\N	11	8	normal
2919	156	28	\N	12	14	normal
2920	156	28	\N	6	14	normal
2921	157	57	\N	9	34	normal
2922	157	57	\N	13	44	normal
2923	157	69	\N	10	34	normal
2924	157	69	\N	9	44	normal
2925	157	18	\N	12	20	normal
2926	157	18	\N	9	25	normal
2927	157	58	\N	10	30	normal
2928	157	58	\N	8	40	normal
2929	157	40	\N	26	10	normal
2930	157	40	\N	30	10	normal
2931	157	75	\N	12	94	normal
2932	157	75	\N	5	94	normal
2933	158	6	\N	12	94	normal
2934	158	10	\N	12	10	normal
2935	158	91	\N	10	40	normal
2936	158	91	\N	6	40	dropset
2937	158	54	\N	8	40	dropset
2938	158	47	\N	7	30	warmup
2939	158	47	\N	15	40	normal
2940	159	32	\N	7	94	normal
2941	159	57	\N	9	35	normal
2942	159	69	\N	9	35	normal
2943	159	69	\N	8	35	normal
2944	159	24	\N	10	65	normal
2945	159	24	\N	12	85	normal
2946	159	4	\N	20	65	normal
2947	159	4	\N	12	95	normal
2948	159	41	\N	8	25	normal
2949	159	41	\N	12	60	normal
2950	159	41	\N	8	75	normal
2951	159	65	\N	8	10	normal
2952	159	65	\N	8	10	normal
2953	159	16	\N	10	7	normal
2954	159	16	\N	10	7	normal
2955	159	114	\N	10	10	normal
2956	159	87	\N	8	10	normal
2957	159	87	\N	7	10	normal
2958	160	77	\N	6	94	normal
2959	160	77	\N	7	94	normal
2960	160	108	\N	3	10	normal
2961	160	69	\N	8	94	normal
2962	160	69	\N	10	35	normal
2963	160	69	\N	10	35	normal
2964	160	46	\N	10	50	normal
2965	160	46	\N	10	55	normal
2966	160	4	\N	20	85	normal
2967	160	4	\N	15	100	normal
2968	160	4	\N	9	110	normal
2969	160	94	\N	8	32	normal
2970	160	94	\N	6	36	normal
2971	160	94	\N	10	40	normal
2972	160	16	\N	21	7	normal
2973	161	11	\N	10	94	normal
2974	161	11	\N	8	94	failure
2975	161	85	\N	15	8	normal
2976	161	85	\N	13	12	normal
2977	161	85	\N	12	12	normal
2978	161	46	\N	10	40	normal
2979	161	46	\N	10	50	normal
2980	161	46	\N	8	55	normal
2981	161	42	\N	9	40	normal
2982	161	42	\N	10	50	normal
2983	161	42	\N	6	50	normal
2984	161	40	\N	12	15	normal
2985	161	40	\N	12	15	normal
2986	161	19	\N	12	55	normal
2987	161	19	\N	9	60	failure
2988	161	19	\N	5	50	dropset
2989	161	44	\N	10	45	normal
2990	161	44	\N	8	45	normal
2991	162	47	\N	10	20	warmup
2992	162	47	\N	8	40	warmup
2993	162	47	\N	8	60	normal
2994	162	47	\N	9	70	normal
2995	162	47	\N	10	80	normal
2996	162	47	\N	8	75	normal
2997	162	5	\N	10	70	normal
2998	162	5	\N	12	80	normal
2999	162	5	\N	14	75	normal
3000	162	41	\N	8	60	warmup
3001	162	41	\N	10	75	normal
3002	162	41	\N	6	85	failure
3003	162	41	\N	9	70	dropset
3004	162	41	\N	10	75	normal
3005	162	59	\N	8	45	warmup
3006	162	59	\N	12	60	normal
3007	162	59	\N	7	60	normal
3008	162	59	\N	5	60	dropset
3009	162	50	\N	8	94	normal
3010	162	50	\N	7	94	normal
3011	162	50	\N	7	94	normal
3012	162	50	\N	5	94	dropset
3013	163	77	\N	5	94	normal
3014	163	77	\N	8	94	normal
3015	163	77	\N	7	94	normal
3016	163	37	\N	10	20	warmup
3017	163	37	\N	10	30	normal
3018	163	37	\N	9	35	normal
3019	163	37	\N	7	40	normal
3020	163	37	\N	6	40	normal
3021	163	96	\N	8	10	normal
3022	163	96	\N	7	10	normal
3023	163	87	\N	7	14	normal
3024	164	16	\N	10	8	warmup
3025	164	16	\N	15	8	normal
3026	164	16	\N	13	8	normal
3027	164	16	\N	11	8	normal
3028	164	28	\N	8	8	warmup
3029	164	28	\N	15	12	normal
3030	164	28	\N	7	16	normal
3031	164	28	\N	8	14	failure
3032	164	9	\N	10	25	normal
3033	164	9	\N	13	25	failure
3034	164	38	\N	7	25	normal
3035	164	38	\N	8	25	normal
3036	165	10	\N	12	10	normal
3037	165	10	\N	15	15	normal
3038	165	10	\N	15	15	normal
3039	165	10	\N	12	10	normal
3040	165	47	\N	8	30	warmup
3041	165	47	\N	6	50	warmup
3042	165	47	\N	8	70	normal
3043	165	47	\N	10	80	normal
3044	165	47	\N	3	100	normal
3045	165	41	\N	15	60	warmup
3046	165	41	\N	12	75	normal
3047	165	41	\N	10	80	failure
3048	165	41	\N	5	65	dropset
3049	165	92	\N	8	80	normal
3050	165	92	\N	8	90	normal
3051	165	92	\N	6	100	normal
3052	165	26	\N	8	20	normal
3053	165	26	\N	5	10	normal
3054	166	32	\N	5	94	warmup
3055	166	32	\N	7	94	normal
3056	166	32	\N	6	94	normal
3057	166	32	\N	6	94	normal
3058	166	11	\N	6	94	warmup
3059	166	11	\N	9	94	normal
3060	166	11	\N	7	94	normal
3061	166	11	\N	7	94	normal
3062	166	17	\N	14	94	normal
3063	166	17	\N	16	94	normal
3064	166	17	\N	14	94	normal
3065	166	40	\N	16	16	normal
3066	166	40	\N	16	18	normal
3067	166	40	\N	13	18	normal
3068	166	76	\N	9	65	normal
3069	166	76	\N	6	65	normal
3070	166	76	\N	6	50	dropset
3071	166	76	\N	6	60	failure
3072	166	28	\N	11	14	normal
3073	166	28	\N	7	14	normal
3074	166	16	\N	13	8	normal
3075	166	16	\N	7	8	normal
3076	167	44	\N	12	30	normal
3077	167	44	\N	12	40	normal
3078	167	44	\N	7	50	normal
3079	167	44	\N	9	50	normal
3080	167	10	\N	12	94	normal
3081	167	10	\N	14	15	normal
3082	167	10	\N	15	10	normal
3083	167	10	\N	12	10	normal
3084	167	92	\N	8	50	normal
3085	167	92	\N	5	60	normal
3086	167	92	\N	7	70	normal
3087	167	92	\N	8	55	normal
3088	167	53	\N	12	32.5	normal
3089	167	53	\N	14	32.5	normal
\.


--
-- Name: exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.exercise_id_seq', 114, true);


--
-- Name: muscle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.muscle_id_seq', 1, false);


--
-- Name: workout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.workout_id_seq', 167, true);


--
-- Name: workout_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.workout_set_id_seq', 3089, true);


--
-- Name: exercise_muscle_map exercise_muscle_map_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.exercise_muscle_map
    ADD CONSTRAINT exercise_muscle_map_pkey PRIMARY KEY (exercise_id, muscle_id);


--
-- Name: exercise exercise_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT exercise_name_key UNIQUE (name);


--
-- Name: exercise exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (id);


--
-- Name: muscle muscle_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.muscle
    ADD CONSTRAINT muscle_name_key UNIQUE (name);


--
-- Name: muscle muscle_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.muscle
    ADD CONSTRAINT muscle_pkey PRIMARY KEY (id);


--
-- Name: workout workout_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.workout
    ADD CONSTRAINT workout_pkey PRIMARY KEY (id);


--
-- Name: workout_set workout_set_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.workout_set
    ADD CONSTRAINT workout_set_pkey PRIMARY KEY (id);


--
-- Name: exercise_muscle_map exercise_muscle_map_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.exercise_muscle_map
    ADD CONSTRAINT exercise_muscle_map_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercise(id);


--
-- Name: exercise_muscle_map exercise_muscle_map_muscle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.exercise_muscle_map
    ADD CONSTRAINT exercise_muscle_map_muscle_id_fkey FOREIGN KEY (muscle_id) REFERENCES public.muscle(id);


--
-- Name: workout_set workout_set_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.workout_set
    ADD CONSTRAINT workout_set_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercise(id);


--
-- Name: workout_set workout_set_workout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.workout_set
    ADD CONSTRAINT workout_set_workout_id_fkey FOREIGN KEY (workout_id) REFERENCES public.workout(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 1o7C5BePIUBjf5ueLXwxh1UJQHC41PDYWirz7jFkzi2SjhzFO1l1kSMtUbdpM9W

