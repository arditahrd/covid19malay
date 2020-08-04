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
-- Name: data_malay_ver3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_malay_ver3 (
    id integer DEFAULT nextval('public.seq_id'::regclass) NOT NULL,
    "Negeri" character varying,
    "Lat" double precision,
    "Long" double precision,
    "Cases" bigint,
    "Date" bigint,
    "Street" character varying,
    "City" character varying,
    "Country" character varying,
    "countryCode" character varying,
    "zipCode" character varying
);


ALTER TABLE public.data_malay_ver3 OWNER TO postgres;

--
-- Data for Name: data_malay_ver3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_malay_ver3 (id, "Negeri", "Lat", "Long", "Cases", "Date", "Street", "City", "Country", "countryCode", "zipCode") FROM stdin;
1	Perlis	6.443589	100.216599	18	1590915600000	Lorong Dua	Kangar	Malaysia	MY	01000
2	Kedah	6.155672	100.569649	96	1590915600000	undefined	undefined	Malaysia	MY	undefined
3	Pulau Pinang	5.285153	100.456238	121	1590915600000	undefined	undefined	Malaysia	MY	06400
4	Perak	4.69395	101.117577	256	1590915600000	undefined	undefined	Malaysia	MY	undefined
5	Selangor	3.509247	101.524803	1909	1590915600000	undefined	Chemor	Malaysia	MY	31200
6	Negeri Sembilan	2.731813	102.252502	858	1590915600000	undefined	undefined	Malaysia	MY	45500
7	Melaka	2.200844	102.240143	219	1590915600000	undefined	undefined	Malaysia	MY	undefined
8	Johor	1.937344	103.366585	675	1590915600000	5	Melaka	Malaysia	MY	75200
9	Pahang	3.974341	102.438057	361	1590915600000	undefined	undefined	Malaysia	MY	81000
10	Terengganu	5.3117	103.1324	111	1590915600000	undefined	Jerantut	Malaysia	MY	undefined
11	Kelantan	6.125397	102.238068	156	1590915600000	undefined	Kuala Terengganu	Malaysia	MY	21100
12	Sabah	5.420404	116.796783	346	1590915600000	undefined	Kota Bharu	Malaysia	MY	15000
13	Sarawak	1.5533	110.3592	552	1590915600000	undefined	undefined	Malaysia	MY	undefined
14	WP Kuala Lumpur	3.139	101.6869	2028	1590915600000	undefined	undefined	Malaysia	MY	undefined
15	WP Putrajaya	2.9264	101.6964	97	1590915600000	undefined	Kuala Lumpur	Malaysia	MY	undefined
16	WP Labuan	5.2831	115.2308	16	1590915600000	undefined	Putrajaya	Malaysia	MY	62000
\.


--
-- Name: data_malay_ver3 data_malay_ver3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_malay_ver3
    ADD CONSTRAINT data_malay_ver3_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

