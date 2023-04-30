--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

--
-- Name: galaxytype; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.galaxytype AS ENUM (
    'elliptical',
    'spiral',
    'irregular'
);


ALTER TYPE public.galaxytype OWNER TO freecodecamp;

--
-- Name: planettype; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.planettype AS ENUM (
    'gas',
    'terrestrial'
);


ALTER TYPE public.planettype OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(7,1) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type public.galaxytype,
    dummy_unique integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_dummy_unique_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_dummy_unique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_dummy_unique_seq OWNER TO freecodecamp;

--
-- Name: galaxy_dummy_unique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_dummy_unique_seq OWNED BY public.galaxy.dummy_unique;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    description text,
    is_spherical boolean,
    distance_from_earth numeric(7,1) NOT NULL,
    age_in_millions_of_years integer,
    planet_id integer,
    dummy_unique integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_dummy_unique_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_dummy_unique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_dummy_unique_seq OWNER TO freecodecamp;

--
-- Name: moon_dummy_unique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_dummy_unique_seq OWNED BY public.moon.dummy_unique;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_more_info (
    moon_more_info_id integer NOT NULL,
    mass numeric(5,1),
    gravity numeric(3,1),
    radius numeric(5,1) NOT NULL,
    has_life boolean,
    moon_id integer,
    name character varying(30)
);


ALTER TABLE public.moon_more_info OWNER TO freecodecamp;

--
-- Name: moon_more_info_moon_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_more_info_moon_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_more_info_moon_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: moon_more_info_moon_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_more_info_moon_more_info_id_seq OWNED BY public.moon_more_info.moon_more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(7,1) NOT NULL,
    dummy_unique integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_dummy_unique_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_dummy_unique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_dummy_unique_seq OWNER TO freecodecamp;

--
-- Name: planet_dummy_unique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_dummy_unique_seq OWNED BY public.planet.dummy_unique;


--
-- Name: planet_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_more_info (
    planet_more_info_id integer NOT NULL,
    planet_type public.planettype NOT NULL,
    mass numeric(5,1),
    gravity numeric(3,1),
    radius numeric(5,1) NOT NULL,
    has_life boolean,
    planet_id integer,
    name character varying(30)
);


ALTER TABLE public.planet_more_info OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_more_info_planet_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_more_info_planet_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_more_info_planet_more_info_id_seq OWNED BY public.planet_more_info.planet_more_info_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    description text,
    star_id integer NOT NULL,
    distance_from_earth numeric(7,1) NOT NULL,
    age_in_millions_of_years integer,
    dummy_unique integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_dummy_unique_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_dummy_unique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_dummy_unique_seq OWNER TO freecodecamp;

--
-- Name: star_dummy_unique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_dummy_unique_seq OWNED BY public.star.dummy_unique;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy dummy_unique; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN dummy_unique SET DEFAULT nextval('public.galaxy_dummy_unique_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon dummy_unique; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN dummy_unique SET DEFAULT nextval('public.moon_dummy_unique_seq'::regclass);


--
-- Name: moon_more_info moon_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_more_info ALTER COLUMN moon_more_info_id SET DEFAULT nextval('public.moon_more_info_moon_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet dummy_unique; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN dummy_unique SET DEFAULT nextval('public.planet_dummy_unique_seq'::regclass);


--
-- Name: planet_more_info planet_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info ALTER COLUMN planet_more_info_id SET DEFAULT nextval('public.planet_more_info_planet_more_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star dummy_unique; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN dummy_unique SET DEFAULT nextval('public.star_dummy_unique_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('andromeda', 'lorem ipsum dolor sit', 1, 123456.7, 200, 'spiral', 1);
INSERT INTO public.galaxy VALUES ('bromeda', 'lorem ipsum dolor sit', 2, 987654.3, 500, 'elliptical', 2);
INSERT INTO public.galaxy VALUES ('cromeda', 'lorem ipsum dolor sit', 3, 123456.8, 300, 'irregular', 3);
INSERT INTO public.galaxy VALUES ('dromeda', 'lorem ipsum dolor sit', 4, 123456.9, 900, 'spiral', 4);
INSERT INTO public.galaxy VALUES ('eromeda', 'lorem ipsum dolor sit', 5, 123457.1, 800, 'spiral', 5);
INSERT INTO public.galaxy VALUES ('fromeda', 'lorem ipsum dolor sit', 6, 123457.2, 975, 'elliptical', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('haumea', 1, 'lorem ipsum dolor sit', false, 123456.7, 23, 1, 1);
INSERT INTO public.moon VALUES ('baumea', 2, 'lorem ipsum dolor sit', false, 3456.7, 123, 2, 2);
INSERT INTO public.moon VALUES ('caumea', 3, 'lorem ipsum dolor sit', false, 3456.7, 123, 2, 3);
INSERT INTO public.moon VALUES ('daumea', 4, 'lorem ipsum dolor sit', false, 3456.7, 123, 3, 4);
INSERT INTO public.moon VALUES ('eaumea', 5, 'lorem ipsum dolor sit', false, 3456.7, 123, 4, 5);
INSERT INTO public.moon VALUES ('faumea', 6, 'lorem ipsum dolor sit', false, 3456.7, 123, 5, 6);
INSERT INTO public.moon VALUES ('gaumea', 7, 'lorem ipsum dolor sit', false, 3456.7, 123, 6, 7);
INSERT INTO public.moon VALUES ('iaumea', 8, 'lorem ipsum dolor sit', false, 3456.7, 123, 7, 8);
INSERT INTO public.moon VALUES ('jaumea', 9, 'lorem ipsum dolor sit', false, 3456.7, 123, 8, 9);
INSERT INTO public.moon VALUES ('kaumea', 10, 'lorem ipsum dolor sit', false, 3456.7, 123, 9, 10);
INSERT INTO public.moon VALUES ('laumea', 11, 'lorem ipsum dolor sit', false, 3456.7, 123, 10, 11);
INSERT INTO public.moon VALUES ('maumea', 12, 'lorem ipsum dolor sit', false, 3456.7, 123, 11, 12);
INSERT INTO public.moon VALUES ('naumea', 13, 'lorem ipsum dolor sit', false, 3456.7, 123, 12, 13);
INSERT INTO public.moon VALUES ('oaumea', 15, 'lorem ipsum dolor sit', true, 3456.7, 123, 1, 15);
INSERT INTO public.moon VALUES ('paumea', 16, 'lorem ipsum dolor sit', true, 3456.7, 123, 1, 16);
INSERT INTO public.moon VALUES ('qaumea', 17, 'lorem ipsum dolor sit', true, 3456.7, 123, 1, 17);
INSERT INTO public.moon VALUES ('raumea', 18, 'lorem ipsum dolor sit', true, 3456.7, 123, 1, 18);
INSERT INTO public.moon VALUES ('saumea', 19, 'lorem ipsum dolor sit', true, 3456.7, 123, 1, 19);
INSERT INTO public.moon VALUES ('taumea', 20, 'lorem ipsum dolor sit', true, 3456.7, 123, 2, 20);
INSERT INTO public.moon VALUES ('uaumea', 21, 'lorem ipsum dolor sit', true, 3456.7, 123, 2, 21);
INSERT INTO public.moon VALUES ('rvuaumea', 22, 'lorem ipsum dolor sit', true, 3456.7, 123, 3, 22);


--
-- Data for Name: moon_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_more_info VALUES (1, 45.0, 6.3, 123.2, false, 1, 'haumea');
INSERT INTO public.moon_more_info VALUES (2, 45.0, 6.3, 123.2, false, 2, 'baumea');
INSERT INTO public.moon_more_info VALUES (3, 45.0, 6.3, 123.2, false, 3, 'caumea');
INSERT INTO public.moon_more_info VALUES (4, 45.0, 6.3, 123.2, false, 4, 'daumea');
INSERT INTO public.moon_more_info VALUES (5, 45.0, 6.3, 123.2, false, 5, 'eaumea');
INSERT INTO public.moon_more_info VALUES (6, 45.0, 6.3, 123.2, false, 6, 'faumea');
INSERT INTO public.moon_more_info VALUES (7, 45.0, 6.3, 123.2, false, 7, 'gaumea');
INSERT INTO public.moon_more_info VALUES (9, 45.0, 6.3, 123.2, false, 8, 'iaumea');
INSERT INTO public.moon_more_info VALUES (10, 45.0, 6.3, 123.2, false, 9, 'jaumea');
INSERT INTO public.moon_more_info VALUES (11, 45.0, 6.3, 123.2, false, 10, 'kaumea');
INSERT INTO public.moon_more_info VALUES (12, 45.0, 6.3, 123.2, false, 11, 'laumea');
INSERT INTO public.moon_more_info VALUES (13, 45.0, 6.3, 123.2, false, 12, 'maumea');
INSERT INTO public.moon_more_info VALUES (14, 45.0, 6.3, 123.2, false, 13, 'naumea');
INSERT INTO public.moon_more_info VALUES (16, 45.0, 6.3, 123.2, false, 15, 'oaumea');
INSERT INTO public.moon_more_info VALUES (17, 45.0, 6.3, 123.2, false, 16, 'paumea');
INSERT INTO public.moon_more_info VALUES (18, 45.0, 6.3, 123.2, false, 17, 'qaumea');
INSERT INTO public.moon_more_info VALUES (19, 45.0, 6.3, 123.2, true, 18, 'raumea');
INSERT INTO public.moon_more_info VALUES (20, 45.0, 6.3, 123.2, true, 19, 'saumea');
INSERT INTO public.moon_more_info VALUES (21, 45.0, 6.3, 123.2, true, 20, 'taumea');
INSERT INTO public.moon_more_info VALUES (22, 45.0, 6.3, 123.2, true, 21, 'uaumea');
INSERT INTO public.moon_more_info VALUES (23, 45.0, 6.3, 123.2, true, 22, 'rvuaumea');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('jupiter', 'lorem ipsum dolor sit', 1, true, 56, 123456.7, 1, 2);
INSERT INTO public.planet VALUES ('bupiter', 'lorem ipsum dolor sit', 2, true, 156, 12456.7, 2, 1);
INSERT INTO public.planet VALUES ('cupiter', 'lorem ipsum dolor sit', 3, true, 166, 1456.7, 3, 5);
INSERT INTO public.planet VALUES ('dupiter', 'lorem ipsum dolor sit', 4, true, 66, 456.7, 4, 3);
INSERT INTO public.planet VALUES ('eupiter', 'lorem ipsum dolor sit', 5, true, 606, 56.7, 5, 4);
INSERT INTO public.planet VALUES ('fupiter', 'lorem ipsum dolor sit', 6, true, 1606, 5123.0, 6, 6);
INSERT INTO public.planet VALUES ('gupiter', 'lorem ipsum dolor sit', 7, true, 16106, 512.3, 7, 1);
INSERT INTO public.planet VALUES ('hupiter', 'lorem ipsum dolor sit', 8, true, 106, 1512.3, 8, 3);
INSERT INTO public.planet VALUES ('iupiter', 'lorem ipsum dolor sit', 9, true, 2106, 21512.3, 9, 6);
INSERT INTO public.planet VALUES ('kupiter', 'lorem ipsum dolor sit', 10, true, 216, 212.3, 10, 5);
INSERT INTO public.planet VALUES ('lupiter', 'lorem ipsum dolor sit', 11, true, 2016, 2012.3, 11, 5);
INSERT INTO public.planet VALUES ('kupiter', 'lorem ipsum dolor sit', 12, true, 20, 22.3, 12, 4);


--
-- Data for Name: planet_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_more_info VALUES (1, 'gas', 1234.5, 17.2, 1245.2, false, 1, 'jupiter');
INSERT INTO public.planet_more_info VALUES (2, 'terrestrial', 134.5, 17.0, 125.2, false, 2, 'bupiter');
INSERT INTO public.planet_more_info VALUES (3, 'terrestrial', 13.5, 19.0, 122.0, false, 3, 'cupiter');
INSERT INTO public.planet_more_info VALUES (4, 'terrestrial', 1643.5, 1.9, 12.2, false, 4, 'dupiter');
INSERT INTO public.planet_more_info VALUES (5, 'terrestrial', 1694.5, 14.9, 1452.2, false, 5, 'eupiter');
INSERT INTO public.planet_more_info VALUES (6, 'terrestrial', 14.5, 1.9, 452.2, false, 6, 'fupiter');
INSERT INTO public.planet_more_info VALUES (7, 'terrestrial', 14.5, 1.9, 452.2, false, 7, 'gupiter');
INSERT INTO public.planet_more_info VALUES (8, 'terrestrial', 14.5, 1.2, 45.2, false, 8, 'hupiter');
INSERT INTO public.planet_more_info VALUES (9, 'terrestrial', 14.5, 1.2, 45.2, false, 9, 'iupiter');
INSERT INTO public.planet_more_info VALUES (10, 'terrestrial', 14.5, 19.0, 1545.2, false, 10, 'kupiter');
INSERT INTO public.planet_more_info VALUES (11, 'terrestrial', 14.5, 19.0, 1545.2, false, 11, 'lupiter');
INSERT INTO public.planet_more_info VALUES (12, 'gas', 1.0, 1.0, 55.2, false, 12, 'mupiter');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sirius', 'lorem ipsum dolor sit', 1, 123456.8, 645, 1, 1);
INSERT INTO public.star VALUES ('airius', 'lorem ipsum dolor sit', 2, 123456.7, 735, 2, 1);
INSERT INTO public.star VALUES ('birius', 'lorem ipsum dolor sit', 3, 122456.7, 701, 3, 2);
INSERT INTO public.star VALUES ('dirius', 'lorem ipsum dolor sit', 4, 12256.7, 961, 4, 2);
INSERT INTO public.star VALUES ('eirius', 'lorem ipsum dolor sit', 5, 122996.7, 900, 5, 5);
INSERT INTO public.star VALUES ('firius', 'lorem ipsum dolor sit', 6, 22996.7, 500, 6, 4);


--
-- Name: galaxy_dummy_unique_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_dummy_unique_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_dummy_unique_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_dummy_unique_seq', 22, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: moon_more_info_moon_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_more_info_moon_more_info_id_seq', 23, true);


--
-- Name: planet_dummy_unique_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_dummy_unique_seq', 12, true);


--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_more_info_planet_more_info_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_dummy_unique_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_dummy_unique_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_dummy_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_dummy_unique_key UNIQUE (dummy_unique);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_dummy_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_dummy_unique_key UNIQUE (dummy_unique);


--
-- Name: moon_more_info moon_more_info_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_more_info
    ADD CONSTRAINT moon_more_info_moon_id_key UNIQUE (moon_id);


--
-- Name: moon_more_info moon_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_more_info
    ADD CONSTRAINT moon_more_info_pkey PRIMARY KEY (moon_more_info_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_dummy_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_dummy_unique_key UNIQUE (dummy_unique);


--
-- Name: planet_more_info planet_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_pkey PRIMARY KEY (planet_more_info_id);


--
-- Name: planet_more_info planet_more_info_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_dummy_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_dummy_unique_key UNIQUE (dummy_unique);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon_more_info moon_more_info_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_more_info
    ADD CONSTRAINT moon_more_info_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_more_info planet_more_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
