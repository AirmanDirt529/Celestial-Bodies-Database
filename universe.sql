--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    estimated_stars_billion integer,
    blackhole_size numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    description text,
    planet_id integer,
    average_diamter_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_sun numeric,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    description text,
    star_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_atmosphere boolean
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer,
    surface_temperature_kelvin integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest major galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A massive elliptical galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Known for its bright nucleus', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A classic spiral galaxy', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 'Earths natural satellite', 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, 'Inner moon of Mars', 2, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, 'Outer moon of Mars', 2, NULL);
INSERT INTO public.moon VALUES (4, 'Io', NULL, NULL, 'Volcanic moon', 3, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, NULL, 'Icy moon', 3, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, NULL, 'largest moon in solar system', 3, NULL);
INSERT INTO public.moon VALUES (7, 'Adrastea', NULL, NULL, 'Inner moon provides ring dust', 3, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, NULL, 'substantial atmosphere with rivers', 4, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, 'icy moon with subsurface oceann', 4, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', NULL, NULL, 'second largest Saturn moon', 4, NULL);
INSERT INTO public.moon VALUES (11, 'Hyperion', NULL, NULL, 'highly porous and irregular', 4, NULL);
INSERT INTO public.moon VALUES (12, 'Naiad', NULL, NULL, 'Innermost moon', 7, NULL);
INSERT INTO public.moon VALUES (13, 'Thalassa', NULL, NULL, 'Orbits just outside Naiad', 7, NULL);
INSERT INTO public.moon VALUES (14, 'Proteus', NULL, NULL, 'One of darkest moons', 7, NULL);
INSERT INTO public.moon VALUES (15, 'Triton', NULL, NULL, 'Captured dwarf planet', 7, NULL);
INSERT INTO public.moon VALUES (16, 'Miranda', NULL, NULL, 'Also known as Frankenstein moon', 8, NULL);
INSERT INTO public.moon VALUES (17, 'Titania', NULL, NULL, 'Largest moon of Uranus', 8, NULL);
INSERT INTO public.moon VALUES (18, 'Oberon', NULL, NULL, 'Contains 12 mile high mountain', 8, NULL);
INSERT INTO public.moon VALUES (19, 'Ariel', NULL, NULL, 'Youngest Uranian moon', 8, NULL);
INSERT INTO public.moon VALUES (20, 'Puck', NULL, NULL, 'Largest inner moon', 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, NULL, 'Supports life', 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, NULL, NULL, NULL, 'The red planet', 1, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', NULL, NULL, NULL, NULL, 'Gas giant', 1, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', NULL, NULL, NULL, NULL, 'Famous for rings', 1, NULL);
INSERT INTO public.planet VALUES (5, 'Venus', NULL, NULL, NULL, NULL, 'Very hot', 2, NULL);
INSERT INTO public.planet VALUES (6, 'Mercury', NULL, NULL, NULL, NULL, 'Closest to Sun', 2, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, NULL, NULL, NULL, 'Distant ice giant', 3, NULL);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, NULL, NULL, NULL, 'Tilted planet', 3, NULL);
INSERT INTO public.planet VALUES (9, 'Proxima b', NULL, NULL, NULL, NULL, 'Exoplanet', 5, NULL);
INSERT INTO public.planet VALUES (10, 'Vega c', NULL, NULL, NULL, NULL, 'Exoplanet', 6, NULL);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', NULL, NULL, NULL, NULL, 'Potential super-Earth', 4, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', NULL, NULL, NULL, NULL, 'Earth-sized planet', 4, NULL);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'A planet that is composed primarily of silicate rocks or metals.', true);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'A large planet composed mostly of hydrogen and helium gases.', true);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'A giant planet composed mostly of elements heavier than hydrogen and helium, such as water, ammonia, and methane.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our central star', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in night sky', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'Closest star system', 2, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Closest star to Sun', 2, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright star in Lyra', 3, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

