--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2014-11-13 23:17:04 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 26434)
-- Name: compras; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA compras;


ALTER SCHEMA compras OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 26433)
-- Name: rnc; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rnc;


ALTER SCHEMA rnc OWNER TO postgres;

--
-- TOC entry 182 (class 3079 OID 11833)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 182
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = compras, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 26483)
-- Name: codigos_ncm; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE codigos_ncm (
    codigo_ncm_id bigint NOT NULL,
    codigo_ncm_nivel_1 character varying(5) NOT NULL,
    codigo_ncm_nivel_2 character varying(5) NOT NULL,
    codigo_ncm_nivel_3 character varying(5) NOT NULL,
    codigo_ncm_nivel_4 character varying(5) NOT NULL,
    descripcion_ncm character varying(255) NOT NULL,
    version bigint NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL
);


ALTER TABLE compras.codigos_ncm OWNER TO postgres;

--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 172
-- Name: TABLE codigos_ncm; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON TABLE codigos_ncm IS 'Tbala que contiene los codigos arancelarios ';


--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.codigo_ncm_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_id IS 'identificador unico del codigo arancelario';


--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_1; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_1 IS 'partida';


--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_2; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_2 IS 'subpartida';


--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_3; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_3 IS 'codigo ncm';


--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_4; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_4 IS 'especificacion propia del pais';


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.version; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.version IS 'campo de versionamiento';


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.fecha_desde; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.fecha_desde IS 'fechas desde la cual es valido el codigo arancelario';


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN codigos_ncm.fecha_hasta; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.fecha_hasta IS 'fecha hasta la cual es valido el codigo arancalario';


--
-- TOC entry 173 (class 1259 OID 26488)
-- Name: entes_organos; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE entes_organos (
    ente_id bigint NOT NULL,
    codigo_onapre character varying(20) NOT NULL,
    nombre character varying(255) NOT NULL,
    tipo character varying(50) NOT NULL,
    ente_adscrito bigint NOT NULL
);


ALTER TABLE compras.entes_organos OWNER TO postgres;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE entes_organos; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON TABLE entes_organos IS 'se encuentran registrados todos los entes y organos';


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN entes_organos.ente_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN entes_organos.ente_id IS 'identificador unico de la tabla';


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN entes_organos.nombre; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN entes_organos.nombre IS 'nombre del organo o ente';


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN entes_organos.tipo; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN entes_organos.tipo IS 'existen dos tipos, organos y entes';


--
-- TOC entry 174 (class 1259 OID 26493)
-- Name: partida_productos; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE partida_productos (
    partida_id bigint NOT NULL,
    producto_id bigint NOT NULL
);


ALTER TABLE compras.partida_productos OWNER TO postgres;

--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE partida_productos; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON TABLE partida_productos IS 'tabla que contiene los productos que pueden ser asociados a cada partida';


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN partida_productos.partida_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partida_productos.partida_id IS 'clave foranea que referencia a una partida';


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN partida_productos.producto_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partida_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 181 (class 1259 OID 26677)
-- Name: partidas; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE partidas (
    partida_id bigint NOT NULL,
    p1 numeric(4,0) NOT NULL,
    p2 numeric(4,0) NOT NULL,
    p3 numeric(4,0) NOT NULL,
    p4 numeric(4,0) NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE compras.partidas OWNER TO postgres;

--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 181
-- Name: TABLE partidas; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON TABLE partidas IS 'partidas presupuestarias disponibles';


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN partidas.partida_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partidas.partida_id IS 'identificador unico de la partida';


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN partidas.p1; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partidas.p1 IS 'partida';


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN partidas.p2; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partidas.p2 IS 'partida generica';


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN partidas.p3; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partidas.p3 IS 'partida especifica';


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN partidas.p4; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partidas.p4 IS 'partida sub especifica';


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN partidas.nombre; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN partidas.nombre IS 'nombre de la partida';


--
-- TOC entry 179 (class 1259 OID 26529)
-- Name: presupuesto; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE presupuesto (
    presupuesto_id bigint NOT NULL,
    partida_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    unidad_id bigint NOT NULL,
    costo_unidad numeric(38,6) NOT NULL,
    cantidad bigint NOT NULL,
    monto numeric(38,6) NOT NULL,
    tipo character varying(60) NOT NULL
);


ALTER TABLE compras.presupuesto OWNER TO postgres;

--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE presupuesto; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON TABLE presupuesto IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.presupuesto_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.partida_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.partida_id IS 'clave foranea que referencia a una partida  que esta siendo presupuestada';


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.producto_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.unidad_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.costo_unidad; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.cantidad; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.cantidad IS 'cantidad de productos presupuestados';


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.monto; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.monto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN presupuesto.tipo; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- TOC entry 177 (class 1259 OID 26514)
-- Name: presupuesto_importacion; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE presupuesto_importacion (
    codigo_ncm_id bigint NOT NULL,
    presupuesto_id bigint NOT NULL,
    cantidad bigint NOT NULL,
    fecha_llegada date NOT NULL,
    monto numeric(38,6) NOT NULL,
    tipo character varying(100) NOT NULL
);


ALTER TABLE compras.presupuesto_importacion OWNER TO postgres;

--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN presupuesto_importacion.presupuesto_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.presupuesto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN presupuesto_importacion.monto; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.monto IS 'monto expresado en dolares del producto que se importara';


--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- TOC entry 175 (class 1259 OID 26496)
-- Name: productos; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE productos (
    producto_id bigint NOT NULL,
    cod_segmento bigint NOT NULL,
    cod_familia bigint NOT NULL,
    cod_clase bigint NOT NULL,
    cod_producto bigint NOT NULL
);


ALTER TABLE compras.productos OWNER TO postgres;

--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE productos; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON TABLE productos IS 'productos segun la convencion de las naciones unidas';


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN productos.producto_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN productos.producto_id IS 'identificador unico del producto';


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN productos.cod_segmento; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN productos.cod_segmento IS 'segmento del codigo de las naciones unidas';


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN productos.cod_familia; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN productos.cod_familia IS 'familia del codigo de las naciones unidas';


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN productos.cod_clase; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN productos.cod_clase IS 'clase del codigo de las naciones unidas';


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN productos.cod_producto; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN productos.cod_producto IS 'codigo del producto de las naciones unidas';


--
-- TOC entry 178 (class 1259 OID 26519)
-- Name: proyecto_partidas; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE proyecto_partidas (
    proyecto_partida_id bigint NOT NULL,
    proyecto_id bigint NOT NULL,
    partida_id bigint NOT NULL,
    monto_presupuestado numeric(38,6) NOT NULL
);


ALTER TABLE compras.proyecto_partidas OWNER TO postgres;

--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN proyecto_partidas.proyecto_partida_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.proyecto_partida_id IS 'identificador unico ';


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN proyecto_partidas.proyecto_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.proyecto_id IS 'clave foranea que hace referencia a un proyecto o accion centralizada';


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN proyecto_partidas.partida_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN proyecto_partidas.monto_presupuestado; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- TOC entry 180 (class 1259 OID 26532)
-- Name: proyectos_acciones; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE proyectos_acciones (
    proyecto_id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    monto numeric(38,6) NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_id bigint NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE compras.proyectos_acciones OWNER TO postgres;

--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN proyectos_acciones.proyecto_id; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.proyecto_id IS 'identificador unico del proyecto';


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN proyectos_acciones.nombre; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.nombre IS 'nombre del proyecto o accion centralizada';


--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN proyectos_acciones.monto; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.monto IS 'monto del proyecto a accion centralizada';


--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN proyectos_acciones.codigo; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN proyectos_acciones.tipo; Type: COMMENT; Schema: compras; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.tipo IS 'puede tomar los valores de "proyecto" y "accion centralizada"';


--
-- TOC entry 176 (class 1259 OID 26501)
-- Name: unidades; Type: TABLE; Schema: compras; Owner: postgres; Tablespace: 
--

CREATE TABLE unidades (
    unidad_id bigint NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE compras.unidades OWNER TO postgres;

--
-- TOC entry 2080 (class 0 OID 26483)
-- Dependencies: 172
-- Data for Name: codigos_ncm; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY codigos_ncm (codigo_ncm_id, codigo_ncm_nivel_1, codigo_ncm_nivel_2, codigo_ncm_nivel_3, codigo_ncm_nivel_4, descripcion_ncm, version, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- TOC entry 2081 (class 0 OID 26488)
-- Dependencies: 173
-- Data for Name: entes_organos; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY entes_organos (ente_id, codigo_onapre, nombre, tipo, ente_adscrito) FROM stdin;
\.


--
-- TOC entry 2082 (class 0 OID 26493)
-- Dependencies: 174
-- Data for Name: partida_productos; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY partida_productos (partida_id, producto_id) FROM stdin;
\.


--
-- TOC entry 2089 (class 0 OID 26677)
-- Dependencies: 181
-- Data for Name: partidas; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY partidas (partida_id, p1, p2, p3, p4, nombre) FROM stdin;
\.


--
-- TOC entry 2087 (class 0 OID 26529)
-- Dependencies: 179
-- Data for Name: presupuesto; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY presupuesto (presupuesto_id, partida_id, producto_id, unidad_id, costo_unidad, cantidad, monto, tipo) FROM stdin;
\.


--
-- TOC entry 2085 (class 0 OID 26514)
-- Dependencies: 177
-- Data for Name: presupuesto_importacion; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY presupuesto_importacion (codigo_ncm_id, presupuesto_id, cantidad, fecha_llegada, monto, tipo) FROM stdin;
\.


--
-- TOC entry 2083 (class 0 OID 26496)
-- Dependencies: 175
-- Data for Name: productos; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY productos (producto_id, cod_segmento, cod_familia, cod_clase, cod_producto) FROM stdin;
\.


--
-- TOC entry 2086 (class 0 OID 26519)
-- Dependencies: 178
-- Data for Name: proyecto_partidas; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY proyecto_partidas (proyecto_partida_id, proyecto_id, partida_id, monto_presupuestado) FROM stdin;
\.


--
-- TOC entry 2088 (class 0 OID 26532)
-- Dependencies: 180
-- Data for Name: proyectos_acciones; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY proyectos_acciones (proyecto_id, nombre, monto, codigo, ente_id, tipo) FROM stdin;
\.


--
-- TOC entry 2084 (class 0 OID 26501)
-- Dependencies: 176
-- Data for Name: unidades; Type: TABLE DATA; Schema: compras; Owner: postgres
--

COPY unidades (unidad_id, nombre) FROM stdin;
\.


--
-- TOC entry 1944 (class 2606 OID 26487)
-- Name: pkcodigos_ncm; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY codigos_ncm
    ADD CONSTRAINT pkcodigos_ncm PRIMARY KEY (codigo_ncm_id);


--
-- TOC entry 1946 (class 2606 OID 26492)
-- Name: pkentes_organos; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT pkentes_organos PRIMARY KEY (ente_id);


--
-- TOC entry 1948 (class 2606 OID 26558)
-- Name: pkpartida_productos; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT pkpartida_productos PRIMARY KEY (partida_id, producto_id);


--
-- TOC entry 1962 (class 2606 OID 26684)
-- Name: pkpartidas; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partidas
    ADD CONSTRAINT pkpartidas PRIMARY KEY (partida_id);


--
-- TOC entry 1958 (class 2606 OID 26560)
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presupuesto
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- TOC entry 1954 (class 2606 OID 26518)
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, presupuesto_id);


--
-- TOC entry 1950 (class 2606 OID 26500)
-- Name: pkproductos; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pkproductos PRIMARY KEY (producto_id);


--
-- TOC entry 1956 (class 2606 OID 26523)
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (proyecto_partida_id);


--
-- TOC entry 1960 (class 2606 OID 26536)
-- Name: pkproyectos_acciones; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT pkproyectos_acciones PRIMARY KEY (proyecto_id);


--
-- TOC entry 1952 (class 2606 OID 26508)
-- Name: pkunidades; Type: CONSTRAINT; Schema: compras; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT pkunidades PRIMARY KEY (unidad_id);


--
-- TOC entry 1963 (class 2606 OID 26633)
-- Name: fk_entes_organos_entes_organos; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT fk_entes_organos_entes_organos FOREIGN KEY (ente_adscrito) REFERENCES entes_organos(ente_id);


--
-- TOC entry 1965 (class 2606 OID 26685)
-- Name: fk_partida_productos_partidas; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 1964 (class 2606 OID 26509)
-- Name: fk_partida_productos_productos; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 1966 (class 2606 OID 26524)
-- Name: fk_presupuesto_importacion_codigos_ncm; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_codigos_ncm FOREIGN KEY (codigo_ncm_id) REFERENCES codigos_ncm(codigo_ncm_id);


--
-- TOC entry 1967 (class 2606 OID 26561)
-- Name: fk_presupuesto_importacion_presupuesto; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto FOREIGN KEY (presupuesto_id) REFERENCES presupuesto(presupuesto_id);


--
-- TOC entry 1970 (class 2606 OID 26537)
-- Name: fk_presupuesto_productos; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY presupuesto
    ADD CONSTRAINT fk_presupuesto_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 1971 (class 2606 OID 26542)
-- Name: fk_presupuesto_unidades; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY presupuesto
    ADD CONSTRAINT fk_presupuesto_unidades FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id);


--
-- TOC entry 1969 (class 2606 OID 26690)
-- Name: fk_proyecto_partidas_partidas; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 1968 (class 2606 OID 26547)
-- Name: fk_proyecto_partidas_proyectos_acciones; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_proyectos_acciones FOREIGN KEY (proyecto_id) REFERENCES proyectos_acciones(proyecto_id);


--
-- TOC entry 1972 (class 2606 OID 26552)
-- Name: fk_proyectos_acciones_entes_organos; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT fk_proyectos_acciones_entes_organos FOREIGN KEY (ente_id) REFERENCES entes_organos(ente_id);


--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-11-13 23:17:04 VET

--
-- PostgreSQL database dump complete
--

