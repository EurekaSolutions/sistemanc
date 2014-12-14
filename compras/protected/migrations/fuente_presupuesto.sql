--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2014-12-13 22:19:32

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
-- TOC entry 213 (class 1259 OID 276565)
-- Name: fuente_presupuesto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fuente_presupuesto (
    id integer NOT NULL,
    fuente_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE public.fuente_presupuesto OWNER TO eureka;

--
-- TOC entry 212 (class 1259 OID 276563)
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fuente_presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fuente_presupuesto_id_seq OWNER TO eureka;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 212
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fuente_presupuesto_id_seq OWNED BY fuente_presupuesto.id;


--
-- TOC entry 1939 (class 2604 OID 276568)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuente_presupuesto ALTER COLUMN id SET DEFAULT nextval('fuente_presupuesto_id_seq'::regclass);


--
-- TOC entry 1943 (class 2606 OID 276570)
-- Name: fuente_presupuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_pkey PRIMARY KEY (id);


--
-- TOC entry 1940 (class 1259 OID 276576)
-- Name: fki_fuente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_fuente ON fuente_presupuesto USING btree (fuente_id);


--
-- TOC entry 1941 (class 1259 OID 276582)
-- Name: fki_presupuesto_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_presupuesto_fk ON fuente_presupuesto USING btree (presupuesto_partida_id);


--
-- TOC entry 1944 (class 2606 OID 276571)
-- Name: fk_fuente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_fuente FOREIGN KEY (fuente_id) REFERENCES fuentes_financiamiento(fuente_financiamiento_id);


--
-- TOC entry 1945 (class 2606 OID 276577)
-- Name: fk_presupuesto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_presupuesto_fk FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


-- Completed on 2014-12-13 22:19:32

--
-- PostgreSQL database dump complete
--

