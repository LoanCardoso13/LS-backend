--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

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
-- Name: weather; Type: TABLE; Schema: public; Owner: joe
--

CREATE TABLE public.weather (
    date date NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL,
    rainfall numeric DEFAULT 0
);


ALTER TABLE public.weather OWNER TO joe;

--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: joe
--

INSERT INTO public.weather VALUES ('2016-03-01', 34, 43, 0.118);
INSERT INTO public.weather VALUES ('2016-03-02', 32, 44, 0.118);
INSERT INTO public.weather VALUES ('2016-03-03', 31, 47, 0.157);
INSERT INTO public.weather VALUES ('2016-03-04', 33, 42, 0.079);
INSERT INTO public.weather VALUES ('2016-03-05', 39, 46, 0.276);
INSERT INTO public.weather VALUES ('2016-03-06', 32, 43, 0.079);
INSERT INTO public.weather VALUES ('2016-03-07', 29, 32, 0.000);
INSERT INTO public.weather VALUES ('2016-03-08', 23, 31, 0.000);
INSERT INTO public.weather VALUES ('2016-03-09', 17, 28, 0.000);


--
-- PostgreSQL database dump complete
--

