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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(60),
    diameter_in_lightyears numeric,
    distance_from_earth_in_lightyears integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    planet_id integer NOT NULL,
    radius_in_miles numeric,
    orbital_period_in_hours integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    star_id integer NOT NULL,
    has_life boolean,
    is_dwarf boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    mass_in_solar_mass numeric,
    radius_in_solar_radius numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: supernova; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supernova (
    supernova_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(60),
    type text
);


ALTER TABLE public.supernova OWNER TO freecodecamp;

--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.supernova ALTER COLUMN supernova_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.supernova_supernova_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Sagittarius', 100000, 0);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'LMC', 'Dorado', 14000, 158000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Andromeda', 'Andromeda', 220000, 2500000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Cigar Galaxy', 'Ursa Major', 37000, 11500000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Pinwheel Galaxy', 'Ursa Major', 170000, 20870000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Sombrero Galaxy', 'Virgo', 50000, 29350000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'moon', 3, 1079.6, 648);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'deimos', 4, 3.8525, 30);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'phobos', 4, 7.0008, 8);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'io', 5, 1131.9, 42);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'europa', 5, 969.84, 85);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'ganymede', 5, 1636.8, 172);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'callisto', 5, 1497.7, 408);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'mimas', 6, 123.16, 23);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'enceladus', 6, 156.65, 33);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'tethys', 6, 329.95, 45);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'dione', 6, 348.84, 66);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'rhea', 6, 474.6, 108);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'titan', 6, 1599.9, 384);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'iapetus', 6, 456.4, 1896);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'miranda', 7, 146.52, 34);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'ariel', 7, 359.71, 60);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'umbriel', 7, 363.32, 99);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'titania', 7, 489.89, 209);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'oberon', 7, 473.11, 312);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'triton', 8, 840.96, 141);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, true, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', 1, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', 1, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Pluto', 1, false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Ceres', 1, false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Makemake', 1, false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Haumea', 1, false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (13, 'Eris', 1, false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'sun', 1, 1, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'VY Canis Majoris', 1, 17, 1420);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'AH Scorpii', 1, 10, 1411);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'BC Cygni', 1, 19, 1031);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'NML Cygni', 1, 40, 1639);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'V766 Centauri', 1, 36, 1160);


--
-- Data for Name: supernova; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supernova OVERRIDING SYSTEM VALUE VALUES (2, 2, 'SN 1987A', 'II');
INSERT INTO public.supernova OVERRIDING SYSTEM VALUE VALUES (3, 1, 'SN 1181', 'Iax');
INSERT INTO public.supernova OVERRIDING SYSTEM VALUE VALUES (4, 3, 'SN 1885A', 'undetermined');
INSERT INTO public.supernova OVERRIDING SYSTEM VALUE VALUES (1, 1, 'SN 1604', 'Ia');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supernova_supernova_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: supernova supernova_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_pkey PRIMARY KEY (supernova_id);


--
-- Name: supernova supernova_supernova_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_supernova_id_key UNIQUE (supernova_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: supernova supernova_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
