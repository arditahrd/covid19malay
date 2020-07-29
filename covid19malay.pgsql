--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: data_malay; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_malay (
    id integer NOT NULL,
    negeri character varying NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    cases integer NOT NULL,
    date bigint NOT NULL,
    "streetName" character varying NOT NULL,
    city character varying,
    country character varying,
    "countryCode" character varying,
    zipcode bigint
);


ALTER TABLE public.data_malay OWNER TO postgres;

--
-- Data for Name: data_malay; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_malay (id, negeri, lat, long, cases, date, "streetName", city, country, "countryCode", zipcode) FROM stdin;
\.


--
-- Name: data_malay data_malay_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_malay
    ADD CONSTRAINT data_malay_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

