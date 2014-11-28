--
-- comprasQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2014-11-28 00:45:50 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

-- DROP DATABASE snc;
--
-- TOC entry 2243 (class 1262 OID 26432)
-- Name: snc; Type: DATABASE; Schema: -; Owner: compras
--

-- CREATE DATABASE snc WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';


-- ALTER DATABASE snc OWNER TO compras;

--\connect snc

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 28330)
-- Name: public; Type: SCHEMA; Schema: -; Owner: compras
--

--CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO compras;

--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: compras
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 205 (class 3079 OID 11833)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 205
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 204 (class 3079 OID 28727)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 204
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for comprasQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 28736)
-- Name: activerecordlog; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE activerecordlog (
    id integer NOT NULL,
    descripcion character varying(255),
    accion character varying(255),
    model character varying(255),
    idmodel integer,
    field character varying(255) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    userid character varying(255) NOT NULL
);


ALTER TABLE public.activerecordlog OWNER TO compras;

--
-- TOC entry 183 (class 1259 OID 28742)
-- Name: activerecordlog_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE activerecordlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activerecordlog_id_seq OWNER TO compras;

--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 183
-- Name: activerecordlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compras
--

ALTER SEQUENCE activerecordlog_id_seq OWNED BY activerecordlog.id;


--
-- TOC entry 170 (class 1259 OID 28350)
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.codigo_ncm_id_seq OWNER TO compras;

--
-- TOC entry 184 (class 1259 OID 28744)
-- Name: codigos_ncm; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE codigos_ncm (
    codigo_ncm_id bigint DEFAULT nextval('codigo_ncm_id_seq'::regclass) NOT NULL,
    codigo_ncm_nivel_1 character varying(5) DEFAULT 0 NOT NULL,
    codigo_ncm_nivel_2 character varying(5) DEFAULT 0 NOT NULL,
    codigo_ncm_nivel_3 character varying(5) DEFAULT 0 NOT NULL,
    codigo_ncm_nivel_4 character varying(5) DEFAULT 0,
    descripcion_ncm character varying(255),
    version bigint DEFAULT 1 NOT NULL,
    fecha_desde date DEFAULT '1900-01-01'::date NOT NULL,
    fecha_hasta date DEFAULT '2199-12-31'::date NOT NULL,
    unidad character varying(40),
    enmienda bigint DEFAULT 5 NOT NULL
);


ALTER TABLE public.codigos_ncm OWNER TO compras;

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE codigos_ncm; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE codigos_ncm IS 'Tbala que contiene los codigos arancelarios ';


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_id IS 'identificador unico del codigo arancelario';


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_1; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_1 IS 'partida';


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_2; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_2 IS 'subpartida';


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_3; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_3 IS 'codigo ncm';


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_4; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_4 IS 'especificacion propia del pais';


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.version; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.version IS 'campo de versionamiento';


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.fecha_desde IS 'fechas desde la cual es valido el codigo arancelario';


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.fecha_hasta IS 'fecha hasta la cual es valido el codigo arancalario';


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN codigos_ncm.enmienda; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.enmienda IS 'este campo indica el numero de la enmienda';


--
-- TOC entry 181 (class 1259 OID 28690)
-- Name: divisa_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE divisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divisa_id_seq OWNER TO compras;

--
-- TOC entry 185 (class 1259 OID 28756)
-- Name: divisas; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE divisas (
    divisa_id bigint DEFAULT nextval('divisa_id_seq'::regclass) NOT NULL,
    abreviatura character varying(255) NOT NULL,
    simbolo character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.divisas OWNER TO compras;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN divisas.divisa_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.divisa_id IS 'clave primaria de la tabla';


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN divisas.abreviatura; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.abreviatura IS 'abreviatura de la divisa';


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN divisas.simbolo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.simbolo IS 'simbolo de la divisa';


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN divisas.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.nombre IS 'nombre de la divisa';


--
-- TOC entry 180 (class 1259 OID 28668)
-- Name: ente_adscrito_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE ente_adscrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ente_adscrito_id_seq OWNER TO compras;

--
-- TOC entry 171 (class 1259 OID 28352)
-- Name: ente_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ente_id_seq OWNER TO compras;

--
-- TOC entry 186 (class 1259 OID 28763)
-- Name: entes_adscritos; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE entes_adscritos (
    padre_id bigint NOT NULL,
    ente_organo_id bigint NOT NULL,
    fecha_desde bigint NOT NULL,
    fecha_hasta bigint NOT NULL,
    ente_adscrito_id bigint DEFAULT nextval('ente_adscrito_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.entes_adscritos OWNER TO compras;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN entes_adscritos.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_adscritos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN entes_adscritos.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_adscritos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 187 (class 1259 OID 28767)
-- Name: entes_organos; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE entes_organos (
    ente_organo_id bigint DEFAULT nextval('ente_id_seq'::regclass) NOT NULL,
    codigo_onapre character varying(20) NOT NULL,
    nombre character varying(255) NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public.entes_organos OWNER TO compras;

--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE entes_organos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE entes_organos IS 'se encuentran registrados todos los entes y organos';


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN entes_organos.ente_organo_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_organos.ente_organo_id IS 'identificador unico de la tabla';


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN entes_organos.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_organos.nombre IS 'nombre del organo o ente';


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN entes_organos.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_organos.tipo IS 'existen dos tipos, organos y entes';


--
-- TOC entry 172 (class 1259 OID 28354)
-- Name: partida_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_id_seq OWNER TO compras;

--
-- TOC entry 203 (class 1259 OID 28970)
-- Name: partida_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE partida_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_producto_id_seq OWNER TO compras;

--
-- TOC entry 188 (class 1259 OID 28771)
-- Name: partida_productos; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE partida_productos (
    partida_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    tipo_operacion character varying(1) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    partida_producto_id bigint DEFAULT nextval('partida_producto_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.partida_productos OWNER TO compras;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE partida_productos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE partida_productos IS 'tabla que contiene los productos que pueden ser asociados a cada partida';


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN partida_productos.partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.partida_id IS 'clave foranea que referencia a una partida';


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN partida_productos.producto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN partida_productos.tipo_operacion; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.tipo_operacion IS 'este campo indica si se realiza una compra o una venta, puede tomar los valores C= compras y V = venta';


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN partida_productos.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN partida_productos.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN partida_productos.partida_producto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.partida_producto_id IS 'identificador unico de una relacion partida-producto';


--
-- TOC entry 189 (class 1259 OID 28774)
-- Name: partidas; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE partidas (
    partida_id bigint DEFAULT nextval('partida_id_seq'::regclass) NOT NULL,
    p1 numeric(4,0) NOT NULL,
    p2 numeric(4,0) NOT NULL,
    p3 numeric(4,0) NOT NULL,
    p4 numeric(4,0) NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.partidas OWNER TO compras;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE partidas; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE partidas IS 'partidas presupuestarias disponibles';


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN partidas.partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.partida_id IS 'identificador unico de la partida';


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN partidas.p1; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p1 IS 'partida';


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN partidas.p2; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p2 IS 'partida generica';


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN partidas.p3; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p3 IS 'partida especifica';


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN partidas.p4; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p4 IS 'partida sub especifica';


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN partidas.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.nombre IS 'nombre de la partida';


--
-- TOC entry 173 (class 1259 OID 28356)
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presupuesto_id_seq OWNER TO compras;

--
-- TOC entry 190 (class 1259 OID 28781)
-- Name: presupuesto_importacion; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE presupuesto_importacion (
    codigo_ncm_id bigint NOT NULL,
    presupuesto_id bigint NOT NULL,
    cantidad bigint NOT NULL,
    fecha_llegada date NOT NULL,
    monto_presupuesto numeric(38,6) NOT NULL,
    tipo character varying(100) NOT NULL,
    monto_ejecutado numeric(38,6) NOT NULL,
    divisa_id bigint NOT NULL
);


ALTER TABLE public.presupuesto_importacion OWNER TO compras;

--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 190
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN presupuesto_importacion.presupuesto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.presupuesto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- TOC entry 191 (class 1259 OID 28784)
-- Name: presupuesto_productos; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE presupuesto_productos (
    presupuesto_id bigint DEFAULT nextval('presupuesto_id_seq'::regclass) NOT NULL,
    producto_id bigint NOT NULL,
    unidad_id bigint NOT NULL,
    costo_unidad numeric(38,6) NOT NULL,
    cantidad bigint NOT NULL,
    monto_presupuesto numeric(38,6) NOT NULL,
    tipo character varying(60) NOT NULL,
    monto_ejecutado numeric(38,6) NOT NULL,
    proyecto_partida_id bigint NOT NULL
);


ALTER TABLE public.presupuesto_productos OWNER TO compras;

--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- TOC entry 174 (class 1259 OID 28358)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_seq OWNER TO compras;

--
-- TOC entry 192 (class 1259 OID 28788)
-- Name: productos; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE productos (
    producto_id bigint DEFAULT nextval('producto_id_seq'::regclass) NOT NULL,
    cod_segmento bigint NOT NULL,
    cod_familia bigint NOT NULL,
    cod_clase bigint NOT NULL,
    cod_producto bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.productos OWNER TO compras;

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE productos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE productos IS 'productos segun la convencion de las naciones unidas';


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN productos.producto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.producto_id IS 'identificador unico del producto';


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN productos.cod_segmento; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_segmento IS 'segmento del codigo de las naciones unidas';


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN productos.cod_familia; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_familia IS 'familia del codigo de las naciones unidas';


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN productos.cod_clase; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_clase IS 'clase del codigo de las naciones unidas';


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN productos.cod_producto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_producto IS 'codigo del producto de las naciones unidas';


--
-- TOC entry 175 (class 1259 OID 28360)
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_id_seq OWNER TO compras;

--
-- TOC entry 176 (class 1259 OID 28362)
-- Name: proyecto_partida_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE proyecto_partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_partida_id_seq OWNER TO compras;

--
-- TOC entry 193 (class 1259 OID 28792)
-- Name: proyecto_partidas; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE proyecto_partidas (
    proyecto_partida_id bigint DEFAULT nextval('proyecto_partida_id_seq'::regclass) NOT NULL,
    proyecto_id bigint NOT NULL,
    partida_id bigint NOT NULL,
    monto_presupuestado numeric(38,6) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL
);


ALTER TABLE public.proyecto_partidas OWNER TO compras;

--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN proyecto_partidas.proyecto_partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.proyecto_partida_id IS 'identificador unico ';


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN proyecto_partidas.proyecto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.proyecto_id IS 'clave foranea que hace referencia a un proyecto o accion centralizada';


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN proyecto_partidas.partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN proyecto_partidas.monto_presupuestado; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN proyecto_partidas.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN proyecto_partidas.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 194 (class 1259 OID 28796)
-- Name: proyectos_acciones; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE proyectos_acciones (
    proyecto_id bigint DEFAULT nextval('proyecto_id_seq'::regclass) NOT NULL,
    nombre character varying(255) NOT NULL,
    monto numeric(38,6) NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_organo_id bigint NOT NULL,
    tipo character varying(50) NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.proyectos_acciones OWNER TO compras;

--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE proyectos_acciones; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE proyectos_acciones IS 'proyectos o acciones centralizadas';


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN proyectos_acciones.proyecto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.proyecto_id IS 'identificador unico del proyecto';


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN proyectos_acciones.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.nombre IS 'nombre del proyecto o accion centralizada';


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN proyectos_acciones.monto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.monto IS 'monto del proyecto a accion centralizada';


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN proyectos_acciones.codigo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN proyectos_acciones.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.tipo IS 'puede tomar los valores de "proyecto" y "accion centralizada"';


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN proyectos_acciones.fecha; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.fecha IS 'fecha de comienzo del proyecto';


--
-- TOC entry 201 (class 1259 OID 28955)
-- Name: tasa_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE tasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasa_id_seq OWNER TO compras;

--
-- TOC entry 202 (class 1259 OID 28957)
-- Name: tasas; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE tasas (
    divisa_id bigint NOT NULL,
    fecha_desde date NOT NULL,
    fechas_hasta bigint NOT NULL,
    tasa numeric(20,4) NOT NULL,
    tasa_id bigint DEFAULT nextval('tasa_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.tasas OWNER TO compras;

--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE tasas; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE tasas IS 'Tabla que almacena el historico de las tasas';


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN tasas.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN tasas.fecha_desde IS 'fecha desde la cual es valida la tasa';


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN tasas.fechas_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN tasas.fechas_hasta IS 'fecha hasta la cual es valida';


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN tasas.tasa; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN tasas.tasa IS 'Tasa de intercambio  vigente de una divisa';


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN tasas.tasa_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN tasas.tasa_id IS 'Identificador unico de la tasa';


--
-- TOC entry 195 (class 1259 OID 28800)
-- Name: tbl_migration; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE tbl_migration (
    version character varying(255) NOT NULL,
    apply_time integer
);


ALTER TABLE public.tbl_migration OWNER TO compras;

--
-- TOC entry 177 (class 1259 OID 28364)
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_id_seq OWNER TO compras;

--
-- TOC entry 196 (class 1259 OID 28803)
-- Name: unidades; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE unidades (
    unidad_id bigint DEFAULT nextval('unidad_id_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.unidades OWNER TO compras;

--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN unidades.unidad_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN unidades.unidad_id IS 'identificador unico de la tabla';


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN unidades.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN unidades.nombre IS 'descripcion de la unidad';


--
-- TOC entry 178 (class 1259 OID 28366)
-- Name: user_login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE user_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_login_attempts_id_seq OWNER TO compras;

--
-- TOC entry 197 (class 1259 OID 28807)
-- Name: user_login_attempts; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE user_login_attempts (
    id integer DEFAULT nextval('user_login_attempts_id_seq'::regclass) NOT NULL,
    username character varying(255) NOT NULL,
    user_id integer,
    performed_on timestamp without time zone NOT NULL,
    is_successful boolean DEFAULT false NOT NULL,
    session_id character varying(255),
    ipv4 integer,
    user_agent character varying(255)
);


ALTER TABLE public.user_login_attempts OWNER TO compras;

--
-- TOC entry 198 (class 1259 OID 28815)
-- Name: user_used_passwords; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE user_used_passwords (
    id integer NOT NULL,
    user_id integer NOT NULL,
    password character varying(255) NOT NULL,
    set_on timestamp without time zone NOT NULL
);


ALTER TABLE public.user_used_passwords OWNER TO compras;

--
-- TOC entry 199 (class 1259 OID 28818)
-- Name: user_used_passwords_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE user_used_passwords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_used_passwords_id_seq OWNER TO compras;

--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 199
-- Name: user_used_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compras
--

ALTER SEQUENCE user_used_passwords_id_seq OWNED BY user_used_passwords.id;


--
-- TOC entry 179 (class 1259 OID 28368)
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: compras
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usuario_id_seq OWNER TO compras;

--
-- TOC entry 200 (class 1259 OID 28820)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE usuarios (
    usuario_id bigint DEFAULT nextval('usuarios_usuario_id_seq'::regclass) NOT NULL,
    codigo_onapre character varying(20) NOT NULL,
    usuario character varying(50) NOT NULL,
    contrasena character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    creado_el timestamp without time zone NOT NULL,
    actualizado_el timestamp without time zone NOT NULL,
    esta_activo boolean DEFAULT true,
    esta_deshabilitado boolean DEFAULT false,
    correo_verificado boolean DEFAULT false,
    llave_activacion character varying(255),
    ultima_visita_el timestamp without time zone
);


ALTER TABLE public.usuarios OWNER TO compras;

--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE usuarios IS 'Tabla de usuarios';


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN usuarios.codigo_onapre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.codigo_onapre IS 'Clave foranea del codigo_onapre en la tabla entes_organos';


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN usuarios.usuario; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.usuario IS 'Nombre de usuario del ente u organismo';


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN usuarios.contrasena; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.contrasena IS 'Contraseña del usuario';


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN usuarios.correo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.correo IS 'Correo del usuario';


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN usuarios.creado_el; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.creado_el IS 'Fecha de creación de la cuenta';


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN usuarios.actualizado_el; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.actualizado_el IS 'Fecha de actualización de la cuenta';


--
-- TOC entry 2009 (class 2604 OID 28830)
-- Name: id; Type: DEFAULT; Schema: public; Owner: compras
--

ALTER TABLE ONLY activerecordlog ALTER COLUMN id SET DEFAULT nextval('activerecordlog_id_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 28831)
-- Name: id; Type: DEFAULT; Schema: public; Owner: compras
--

ALTER TABLE ONLY user_used_passwords ALTER COLUMN id SET DEFAULT nextval('user_used_passwords_id_seq'::regclass);


--
-- TOC entry 2217 (class 0 OID 28736)
-- Dependencies: 182
-- Data for Name: activerecordlog; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY activerecordlog (id, descripcion, accion, model, idmodel, field, creationdate, userid) FROM stdin;
\.


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 183
-- Name: activerecordlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('activerecordlog_id_seq', 1, false);


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 170
-- Name: codigo_ncm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('codigo_ncm_id_seq', 1, false);


--
-- TOC entry 2219 (class 0 OID 28744)
-- Dependencies: 184
-- Data for Name: codigos_ncm; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY codigos_ncm (codigo_ncm_id, codigo_ncm_nivel_1, codigo_ncm_nivel_2, codigo_ncm_nivel_3, codigo_ncm_nivel_4, descripcion_ncm, version, fecha_desde, fecha_hasta, unidad, enmienda) FROM stdin;
\.


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 181
-- Name: divisa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('divisa_id_seq', 1, false);


--
-- TOC entry 2220 (class 0 OID 28756)
-- Dependencies: 185
-- Data for Name: divisas; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY divisas (divisa_id, abreviatura, simbolo, nombre) FROM stdin;
\.


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 180
-- Name: ente_adscrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('ente_adscrito_id_seq', 1, false);


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 171
-- Name: ente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('ente_id_seq', 1, false);


--
-- TOC entry 2221 (class 0 OID 28763)
-- Dependencies: 186
-- Data for Name: entes_adscritos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY entes_adscritos (padre_id, ente_organo_id, fecha_desde, fecha_hasta, ente_adscrito_id) FROM stdin;
\.


--
-- TOC entry 2222 (class 0 OID 28767)
-- Dependencies: 187
-- Data for Name: entes_organos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY entes_organos (ente_organo_id, codigo_onapre, nombre, tipo) FROM stdin;
\.


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 172
-- Name: partida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('partida_id_seq', 1, false);


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 203
-- Name: partida_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('partida_producto_id_seq', 1, false);


--
-- TOC entry 2223 (class 0 OID 28771)
-- Dependencies: 188
-- Data for Name: partida_productos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY partida_productos (partida_id, producto_id, tipo_operacion, fecha_desde, fecha_hasta, partida_producto_id) FROM stdin;
\.


--
-- TOC entry 2224 (class 0 OID 28774)
-- Dependencies: 189
-- Data for Name: partidas; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY partidas (partida_id, p1, p2, p3, p4, nombre) FROM stdin;
\.


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 173
-- Name: presupuesto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('presupuesto_id_seq', 1, false);


--
-- TOC entry 2225 (class 0 OID 28781)
-- Dependencies: 190
-- Data for Name: presupuesto_importacion; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY presupuesto_importacion (codigo_ncm_id, presupuesto_id, cantidad, fecha_llegada, monto_presupuesto, tipo, monto_ejecutado, divisa_id) FROM stdin;
\.


--
-- TOC entry 2226 (class 0 OID 28784)
-- Dependencies: 191
-- Data for Name: presupuesto_productos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY presupuesto_productos (presupuesto_id, producto_id, unidad_id, costo_unidad, cantidad, monto_presupuesto, tipo, monto_ejecutado, proyecto_partida_id) FROM stdin;
\.


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 174
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('producto_id_seq', 1, false);


--
-- TOC entry 2227 (class 0 OID 28788)
-- Dependencies: 192
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY productos (producto_id, cod_segmento, cod_familia, cod_clase, cod_producto, nombre) FROM stdin;
\.


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 175
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('proyecto_id_seq', 1, false);


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 176
-- Name: proyecto_partida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('proyecto_partida_id_seq', 1, false);


--
-- TOC entry 2228 (class 0 OID 28792)
-- Dependencies: 193
-- Data for Name: proyecto_partidas; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY proyecto_partidas (proyecto_partida_id, proyecto_id, partida_id, monto_presupuestado, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- TOC entry 2229 (class 0 OID 28796)
-- Dependencies: 194
-- Data for Name: proyectos_acciones; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY proyectos_acciones (proyecto_id, nombre, monto, codigo, ente_organo_id, tipo, fecha) FROM stdin;
\.


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 201
-- Name: tasa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('tasa_id_seq', 1, false);


--
-- TOC entry 2237 (class 0 OID 28957)
-- Dependencies: 202
-- Data for Name: tasas; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY tasas (divisa_id, fecha_desde, fechas_hasta, tasa, tasa_id) FROM stdin;
\.


--
-- TOC entry 2230 (class 0 OID 28800)
-- Dependencies: 195
-- Data for Name: tbl_migration; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY tbl_migration (version, apply_time) FROM stdin;
m141122_200458_agregar_columnas_tabla_usuarios	1416969844
m141122_220151_crear_tabla_user_login_attempts	1416969844
m141123_122814_agregar_verificacion_columnas_tabla_usuario	1416969844
m141124_031248_crear_tabla_user_used_passwords	1416969852
m141124_215117_activerecordlog	1416969933
\.


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 177
-- Name: unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('unidad_id_seq', 1, false);


--
-- TOC entry 2231 (class 0 OID 28803)
-- Dependencies: 196
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY unidades (unidad_id, nombre) FROM stdin;
\.


--
-- TOC entry 2232 (class 0 OID 28807)
-- Dependencies: 197
-- Data for Name: user_login_attempts; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY user_login_attempts (id, username, user_id, performed_on, is_successful, session_id, ipv4, user_agent) FROM stdin;
\.


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 178
-- Name: user_login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('user_login_attempts_id_seq', 1, false);


--
-- TOC entry 2233 (class 0 OID 28815)
-- Dependencies: 198
-- Data for Name: user_used_passwords; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY user_used_passwords (id, user_id, password, set_on) FROM stdin;
\.


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 199
-- Name: user_used_passwords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('user_used_passwords_id_seq', 1, false);


--
-- TOC entry 2235 (class 0 OID 28820)
-- Dependencies: 200
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY usuarios (usuario_id, codigo_onapre, usuario, contrasena, correo, creado_el, actualizado_el, esta_activo, esta_deshabilitado, correo_verificado, llave_activacion, ultima_visita_el) FROM stdin;
\.


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 179
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('usuarios_usuario_id_seq', 1, false);


--
-- TOC entry 2038 (class 2606 OID 28833)
-- Name: activerecordlog_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY activerecordlog
    ADD CONSTRAINT activerecordlog_pkey PRIMARY KEY (id);


--
-- TOC entry 2046 (class 2606 OID 28835)
-- Name: codigo_onapre_unique; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT codigo_onapre_unique UNIQUE (codigo_onapre);


--
-- TOC entry 2040 (class 2606 OID 28837)
-- Name: pkcodigos_ncm; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY codigos_ncm
    ADD CONSTRAINT pkcodigos_ncm PRIMARY KEY (codigo_ncm_id);


--
-- TOC entry 2042 (class 2606 OID 28839)
-- Name: pkdivisas; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY divisas
    ADD CONSTRAINT pkdivisas PRIMARY KEY (divisa_id);


--
-- TOC entry 2044 (class 2606 OID 28841)
-- Name: pkentes_adscritos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT pkentes_adscritos PRIMARY KEY (ente_adscrito_id);


--
-- TOC entry 2048 (class 2606 OID 28843)
-- Name: pkentes_organos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT pkentes_organos PRIMARY KEY (ente_organo_id);


--
-- TOC entry 2050 (class 2606 OID 28968)
-- Name: pkpartida_productos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT pkpartida_productos PRIMARY KEY (partida_producto_id);


--
-- TOC entry 2052 (class 2606 OID 28847)
-- Name: pkpartidas; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY partidas
    ADD CONSTRAINT pkpartidas PRIMARY KEY (partida_id);


--
-- TOC entry 2056 (class 2606 OID 28849)
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- TOC entry 2054 (class 2606 OID 28851)
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, presupuesto_id);


--
-- TOC entry 2058 (class 2606 OID 28853)
-- Name: pkproductos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pkproductos PRIMARY KEY (producto_id);


--
-- TOC entry 2060 (class 2606 OID 28855)
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (proyecto_partida_id);


--
-- TOC entry 2062 (class 2606 OID 28857)
-- Name: pkproyectos_acciones; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT pkproyectos_acciones PRIMARY KEY (proyecto_id);


--
-- TOC entry 2080 (class 2606 OID 28961)
-- Name: pktasas; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY tasas
    ADD CONSTRAINT pktasas PRIMARY KEY (tasa_id);


--
-- TOC entry 2066 (class 2606 OID 28859)
-- Name: pkunidades; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT pkunidades PRIMARY KEY (unidad_id);


--
-- TOC entry 2064 (class 2606 OID 28861)
-- Name: tbl_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY tbl_migration
    ADD CONSTRAINT tbl_migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2068 (class 2606 OID 28863)
-- Name: user_login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 28865)
-- Name: user_used_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_pkey PRIMARY KEY (id);


--
-- TOC entry 2074 (class 2606 OID 28867)
-- Name: usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 2076 (class 2606 OID 28869)
-- Name: usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (usuario_id);


--
-- TOC entry 2078 (class 2606 OID 28871)
-- Name: usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- TOC entry 2069 (class 1259 OID 28872)
-- Name: user_login_attempts_user_id_idx; Type: INDEX; Schema: public; Owner: compras; Tablespace: 
--

CREATE INDEX user_login_attempts_user_id_idx ON user_login_attempts USING btree (user_id);


--
-- TOC entry 2072 (class 1259 OID 28873)
-- Name: user_used_passwords_user_id_idx; Type: INDEX; Schema: public; Owner: compras; Tablespace: 
--

CREATE INDEX user_used_passwords_user_id_idx ON user_used_passwords USING btree (user_id);


--
-- TOC entry 2096 (class 2606 OID 28874)
-- Name: entes_organos_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT entes_organos_usuarios_fk FOREIGN KEY (codigo_onapre) REFERENCES entes_organos(codigo_onapre);


--
-- TOC entry 2082 (class 2606 OID 28879)
-- Name: fk_entes_adscritos_entes_organos_hijo; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_hijo FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2081 (class 2606 OID 28884)
-- Name: fk_entes_adscritos_entes_organos_padre; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_padre FOREIGN KEY (padre_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2084 (class 2606 OID 28889)
-- Name: fk_partida_productos_partidas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 2083 (class 2606 OID 28894)
-- Name: fk_partida_productos_productos; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 2087 (class 2606 OID 28899)
-- Name: fk_presupuesto_importacion_codigos_ncm; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_codigos_ncm FOREIGN KEY (codigo_ncm_id) REFERENCES codigos_ncm(codigo_ncm_id);


--
-- TOC entry 2086 (class 2606 OID 28904)
-- Name: fk_presupuesto_importacion_divisas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- TOC entry 2085 (class 2606 OID 28909)
-- Name: fk_presupuesto_importacion_presupuesto; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto FOREIGN KEY (presupuesto_id) REFERENCES presupuesto_productos(presupuesto_id);


--
-- TOC entry 2090 (class 2606 OID 28914)
-- Name: fk_presupuesto_productos; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 2089 (class 2606 OID 28919)
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES proyecto_partidas(proyecto_partida_id);


--
-- TOC entry 2088 (class 2606 OID 28924)
-- Name: fk_presupuesto_unidades; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_unidades FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id);


--
-- TOC entry 2092 (class 2606 OID 28929)
-- Name: fk_proyecto_partidas_partidas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 2091 (class 2606 OID 28934)
-- Name: fk_proyecto_partidas_proyectos_acciones; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_proyectos_acciones FOREIGN KEY (proyecto_id) REFERENCES proyectos_acciones(proyecto_id);


--
-- TOC entry 2093 (class 2606 OID 28939)
-- Name: fk_proyectos_acciones_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT fk_proyectos_acciones_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2097 (class 2606 OID 28962)
-- Name: fk_tasas_divisas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY tasas
    ADD CONSTRAINT fk_tasas_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- TOC entry 2094 (class 2606 OID 28944)
-- Name: user_login_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2095 (class 2606 OID 28949)
-- Name: user_used_passwords_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: compras
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM compras;
GRANT ALL ON SCHEMA public TO compras;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-11-28 00:45:50 VET

--
-- comprasQL database dump complete
--

