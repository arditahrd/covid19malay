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
    id bigint NOT NULL,
    negeri character varying NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    cases integer NOT NULL,
    date bigint NOT NULL,
    streetname character varying NOT NULL,
    city character varying,
    country character varying,
    countrycode character varying,
    zipcode character varying
);


ALTER TABLE public.data_malay_ver3 OWNER TO postgres;

--
-- Name: data_malay_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_malay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_malay_id_seq OWNER TO postgres;

--
-- Name: data_malay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_malay_id_seq OWNED BY public.data_malay_ver3.id;


--
-- Name: data_malay_ver3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_malay_ver3 ALTER COLUMN id SET DEFAULT nextval('public.data_malay_id_seq'::regclass);


--
-- Data for Name: data_malay_ver3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_malay_ver3 (id, negeri, lat, long, cases, date, streetname, city, country, countrycode, zipcode) FROM stdin;
\.


--
-- Name: data_malay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_malay_id_seq', 1, false);


--
-- Name: data_malay_ver3 data_malay_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_malay_ver3
    ADD CONSTRAINT data_malay_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

