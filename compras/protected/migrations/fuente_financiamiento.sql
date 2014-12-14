--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2014-12-13 22:20:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 276251)
-- Name: fuentes_financiamiento; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE fuentes_financiamiento (
    fuente_financiamiento_id bigint DEFAULT nextval('fuente_financiamiento_id_seq'::regclass) NOT NULL,
    nombre character varying(255) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.fuentes_financiamiento OWNER TO eureka;

--
-- TOC entry 2049 (class 0 OID 276251)
-- Dependencies: 183
-- Data for Name: fuentes_financiamiento; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY fuentes_financiamiento (fuente_financiamiento_id, nombre, activo) FROM stdin;
1	INGRESOS ORDINARIOS	t
9	DEUDA PUBLICA	t
10	PROYECTOS POR ENDEUDAMIENTO	t
7	OTROS	f
8	GESTIÓN FISCAL	f
13	PROYECTOS AGRÍCOLAS	f
14	GRAN MISIÓN AGRO-VENEZUELA	f
15	GRAN MISIÓN VIVIENDA VENEZUELA	f
16	GRAN MISIÓN TRABAJO VENEZUELA	f
17	EMERGENCIAS Y DESASTRES NATURALES	f
18	ENDEUDAMIENTO COMPLEMENTARIO	f
\.


--
-- TOC entry 1941 (class 2606 OID 276376)
-- Name: pkfuentes_financiamiento; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuentes_financiamiento
    ADD CONSTRAINT pkfuentes_financiamiento PRIMARY KEY (fuente_financiamiento_id);


-- Completed on 2014-12-13 22:20:34

--
-- PostgreSQL database dump complete
--

