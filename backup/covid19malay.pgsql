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
    date bigint NOT NULL
);


ALTER TABLE public.data_malay OWNER TO postgres;

--
-- Data for Name: data_malay; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_malay (id, negeri, lat, long, cases, date) FROM stdin;
2	Kedah	6.155672	100.569649	96	1590915600000
1	Perlis	6.443589	100.216599	18	1590915600000
3	Pulau Pinang	5.285153	100.456238	121	1590915600000
7	Melaka	2.200844	102.240143	219	1590915600000
4	Perak	4.69395	101.117577	256	1590915600000
11	Kelantan	6.125397	102.238068	156	1590915600000
12	Sabah	5.420404	116.796783	346	1590915600000
13	Sarawak	1.5533	110.3592	552	1590915600000
14	WP Kuala Lumpur	3.139	101.6869	2028	1590915600000
15	WP Putrajaya	2.9264	101.6964	97	1590915600000
16	WP Labuan	5.2831	115.2308	16	1590915600000
10	Terengganu	5.3117	103.1324	111	1590915600000
5	Selangor	3.509247	101.524803	1909	1590915600000
8	Johor	1.937344	103.366585	675	1590915600000
6	Negeri Sembilan	2.731813	102.252502	858	1590915600000
9	Pahang	3.974341	102.438057	361	1590915600000
\.


--
-- Name: data_malay data_malay_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_malay
    ADD CONSTRAINT data_malay_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

