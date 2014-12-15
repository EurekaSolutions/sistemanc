--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2014-12-10 01:16:14 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 213 (class 3079 OID 11833)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 213
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 212 (class 3079 OID 28727)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 212
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

--
-- TOC entry 183 (class 1259 OID 29054)
-- Name: accion_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accion_id_seq OWNER TO eureka;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 29745)
-- Name: acciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE acciones (
    accion_id bigint DEFAULT nextval('accion_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo bigint
);


ALTER TABLE public.acciones OWNER TO eureka;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE acciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE acciones IS 'tabla que contienes las acciones centralizadas';


--
-- TOC entry 187 (class 1259 OID 29752)
-- Name: activerecordlog; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
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


ALTER TABLE public.activerecordlog OWNER TO eureka;

--
-- TOC entry 188 (class 1259 OID 29758)
-- Name: activerecordlog_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE activerecordlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activerecordlog_id_seq OWNER TO eureka;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 188
-- Name: activerecordlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE activerecordlog_id_seq OWNED BY activerecordlog.id;


--
-- TOC entry 170 (class 1259 OID 28350)
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.codigo_ncm_id_seq OWNER TO eureka;

--
-- TOC entry 189 (class 1259 OID 29760)
-- Name: codigos_ncm; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE codigos_ncm (
    codigo_ncm_id bigint DEFAULT nextval('codigo_ncm_id_seq'::regclass) NOT NULL,
    codigo_ncm_nivel_1 character varying(5) DEFAULT 0 NOT NULL,
    codigo_ncm_nivel_2 character varying(5) DEFAULT 0 NOT NULL,
    codigo_ncm_nivel_3 character varying(5) DEFAULT 0 NOT NULL,
    codigo_ncm_nivel_4 character varying(5) DEFAULT 0,
    descripcion_ncm text,
    version bigint DEFAULT 1 NOT NULL,
    fecha_desde date DEFAULT '1900-01-01'::date NOT NULL,
    fecha_hasta date DEFAULT '2199-12-31'::date NOT NULL,
    unidad character varying(40),
    enmienda bigint DEFAULT 5 NOT NULL
);


ALTER TABLE public.codigos_ncm OWNER TO eureka;

--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE codigos_ncm; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE codigos_ncm IS 'Tbala que contiene los codigos arancelarios ';


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_id IS 'identificador unico del codigo arancelario';


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_1; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_1 IS 'partida';


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_2; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_2 IS 'subpartida';


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_3; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_3 IS 'codigo ncm';


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_4; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_4 IS 'especificacion propia del pais';


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.version; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.version IS 'campo de versionamiento';


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.fecha_desde IS 'fechas desde la cual es valido el codigo arancelario';


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.fecha_hasta IS 'fecha hasta la cual es valido el codigo arancalario';


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN codigos_ncm.enmienda; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.enmienda IS 'este campo indica el numero de la enmienda';


--
-- TOC entry 180 (class 1259 OID 28690)
-- Name: divisa_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE divisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divisa_id_seq OWNER TO eureka;

--
-- TOC entry 190 (class 1259 OID 29775)
-- Name: divisas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE divisas (
    divisa_id bigint DEFAULT nextval('divisa_id_seq'::regclass) NOT NULL,
    abreviatura character varying(255) NOT NULL,
    simbolo character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.divisas OWNER TO eureka;

--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN divisas.divisa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.divisa_id IS 'clave primaria de la tabla';


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN divisas.abreviatura; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.abreviatura IS 'abreviatura de la divisa';


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN divisas.simbolo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.simbolo IS 'simbolo de la divisa';


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN divisas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.nombre IS 'nombre de la divisa';


--
-- TOC entry 179 (class 1259 OID 28668)
-- Name: ente_adscrito_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE ente_adscrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ente_adscrito_id_seq OWNER TO eureka;

--
-- TOC entry 171 (class 1259 OID 28352)
-- Name: ente_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ente_id_seq OWNER TO eureka;

--
-- TOC entry 191 (class 1259 OID 29782)
-- Name: entes_adscritos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE entes_adscritos (
    padre_id bigint NOT NULL,
    ente_organo_id bigint NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    ente_adscrito_id bigint DEFAULT nextval('ente_adscrito_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.entes_adscritos OWNER TO eureka;

--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN entes_adscritos.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_adscritos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN entes_adscritos.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_adscritos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN entes_adscritos.ente_adscrito_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_adscritos.ente_adscrito_id IS 'Identificador unico de la tabla';


--
-- TOC entry 192 (class 1259 OID 29786)
-- Name: entes_organos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE entes_organos (
    ente_organo_id bigint DEFAULT nextval('ente_id_seq'::regclass) NOT NULL,
    codigo_onapre character varying(20),
    nombre character varying(255) NOT NULL,
    tipo character varying(50) NOT NULL,
    rif character varying(30) DEFAULT 'NA'::character varying,
    creado_por character varying(100) DEFAULT 'onapre'::character varying NOT NULL
);


ALTER TABLE public.entes_organos OWNER TO eureka;

--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE entes_organos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE entes_organos IS 'se encuentran registrados todos los entes y organos';


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN entes_organos.ente_organo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_organos.ente_organo_id IS 'identificador unico de la tabla';


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN entes_organos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_organos.nombre IS 'nombre del organo o ente';


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN entes_organos.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_organos.tipo IS 'existen dos tipos, organos y entes';


--
-- TOC entry 184 (class 1259 OID 29496)
-- Name: fuente_financiamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE fuente_financiamiento_id_seq
    START WITH 3000
    INCREMENT BY 1
    MINVALUE 3000
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fuente_financiamiento_id_seq OWNER TO eureka;

--
-- TOC entry 193 (class 1259 OID 29792)
-- Name: fuentes_financiamiento; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE fuentes_financiamiento (
    fuente_financiamiento_id bigint DEFAULT nextval('fuente_financiamiento_id_seq'::regclass) NOT NULL,
    nombre character varying(255) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.fuentes_financiamiento OWNER TO eureka;

--
-- TOC entry 172 (class 1259 OID 28354)
-- Name: partida_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_id_seq OWNER TO eureka;

--
-- TOC entry 182 (class 1259 OID 28970)
-- Name: partida_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE partida_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_producto_id_seq OWNER TO eureka;

--
-- TOC entry 194 (class 1259 OID 29796)
-- Name: partida_productos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE partida_productos (
    partida_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    tipo_operacion character varying(1) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    partida_producto_id bigint DEFAULT nextval('partida_producto_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.partida_productos OWNER TO eureka;

--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE partida_productos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE partida_productos IS 'tabla que contiene los productos que pueden ser asociados a cada partida';


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.partida_id IS 'clave foranea que referencia a una partida';


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.tipo_operacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.tipo_operacion IS 'este campo indica si se realiza una compra o una venta, puede tomar los valores C= compras y V = venta';


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.partida_producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.partida_producto_id IS 'identificador unico de una relacion partida-producto';


--
-- TOC entry 195 (class 1259 OID 29800)
-- Name: partidas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE partidas (
    partida_id bigint DEFAULT nextval('partida_id_seq'::regclass) NOT NULL,
    p1 numeric(4,0) NOT NULL,
    p2 numeric(4,0) NOT NULL,
    p3 numeric(4,0) NOT NULL,
    p4 numeric(4,0) NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.partidas OWNER TO eureka;

--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE partidas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE partidas IS 'partidas presupuestarias disponibles';


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.partida_id IS 'identificador unico de la partida';


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p1; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p1 IS 'partida';


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p2; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p2 IS 'partida generica';


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p3; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p3 IS 'partida especifica';


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p4; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p4 IS 'partida sub especifica';


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.nombre IS 'nombre de la partida';


--
-- TOC entry 173 (class 1259 OID 28356)
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presupuesto_id_seq OWNER TO eureka;

--
-- TOC entry 207 (class 1259 OID 30049)
-- Name: presupuesto_importacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presupuesto_importacion (
    codigo_ncm_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    cantidad bigint NOT NULL,
    fecha_llegada date NOT NULL,
    monto_presupuesto numeric(38,6) NOT NULL,
    tipo character varying(100) NOT NULL,
    monto_ejecutado numeric(38,6) NOT NULL,
    divisa_id bigint NOT NULL,
    descripcion text NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE public.presupuesto_importacion OWNER TO postgres;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN presupuesto_importacion.producto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.producto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- TOC entry 196 (class 1259 OID 29810)
-- Name: presupuesto_partida_acciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_acciones (
    accion_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    codigo_accion character varying(100) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_accion_padre bigint
);


ALTER TABLE public.presupuesto_partida_acciones OWNER TO eureka;

--
-- TOC entry 185 (class 1259 OID 29737)
-- Name: presupuesto_partida_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE presupuesto_partida_id_seq
    START WITH 100000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presupuesto_partida_id_seq OWNER TO eureka;

--
-- TOC entry 197 (class 1259 OID 29813)
-- Name: presupuesto_partida_proyecto; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_proyecto (
    proyecto_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE public.presupuesto_partida_proyecto OWNER TO eureka;

--
-- TOC entry 198 (class 1259 OID 29816)
-- Name: presupuesto_partidas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partidas (
    presupuesto_partida_id bigint DEFAULT nextval('presupuesto_partida_id_seq'::regclass) NOT NULL,
    partida_id bigint NOT NULL,
    monto_presupuestado numeric(38,6) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date,
    tipo character varying(1) DEFAULT 'A'::character varying NOT NULL,
    anho bigint NOT NULL,
    ente_organo_id bigint NOT NULL,
    fuente_fianciamiento_id bigint NOT NULL,
    presupuesto_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.presupuesto_partidas OWNER TO eureka;

--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN presupuesto_partidas.presupuesto_partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.presupuesto_partida_id IS 'identificador unico ';


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN presupuesto_partidas.partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN presupuesto_partidas.monto_presupuestado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN presupuesto_partidas.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN presupuesto_partidas.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 199 (class 1259 OID 29821)
-- Name: presupuesto_productos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
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


ALTER TABLE public.presupuesto_productos OWNER TO eureka;

--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- TOC entry 210 (class 1259 OID 30190)
-- Name: presupuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presupuesto_seq OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 30058)
-- Name: presupuestos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presupuestos (
    presupuesto_id bigint DEFAULT nextval('presupuesto_seq'::regclass) NOT NULL,
    ahno bigint NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.presupuestos OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 28358)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_seq OWNER TO eureka;

--
-- TOC entry 200 (class 1259 OID 29825)
-- Name: productos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE productos (
    producto_id bigint DEFAULT nextval('producto_id_seq'::regclass) NOT NULL,
    cod_segmento bigint NOT NULL,
    cod_familia bigint NOT NULL,
    cod_clase bigint NOT NULL,
    cod_producto bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.productos OWNER TO eureka;

--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE productos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE productos IS 'productos segun la convencion de las naciones unidas';


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN productos.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.producto_id IS 'identificador unico del producto';


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN productos.cod_segmento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_segmento IS 'segmento del codigo de las naciones unidas';


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN productos.cod_familia; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_familia IS 'familia del codigo de las naciones unidas';


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN productos.cod_clase; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_clase IS 'clase del codigo de las naciones unidas';


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN productos.cod_producto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_producto IS 'codigo del producto de las naciones unidas';


--
-- TOC entry 175 (class 1259 OID 28360)
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_id_seq OWNER TO eureka;

--
-- TOC entry 201 (class 1259 OID 29829)
-- Name: proyectos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE proyectos (
    proyecto_id bigint DEFAULT nextval('proyecto_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_padre character varying(20)
);


ALTER TABLE public.proyectos OWNER TO eureka;

--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE proyectos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE proyectos IS 'proyectos o acciones centralizadas';


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN proyectos.proyecto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proyectos.proyecto_id IS 'identificador unico del proyecto';


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN proyectos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proyectos.nombre IS 'nombre del proyecto o accion centralizada';


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN proyectos.codigo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proyectos.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- TOC entry 181 (class 1259 OID 28955)
-- Name: tasa_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE tasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasa_id_seq OWNER TO eureka;

--
-- TOC entry 209 (class 1259 OID 30063)
-- Name: tasas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tasas (
    divisa_id bigint NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    tasa numeric(20,4) NOT NULL,
    tasa_id bigint DEFAULT nextval('tasa_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.tasas OWNER TO postgres;

--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE tasas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tasas IS 'Tabla que almacena el historico de las tasas';


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN tasas.fecha_desde; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tasas.fecha_desde IS 'fecha desde la cual es valida la tasa';


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN tasas.fecha_hasta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tasas.fecha_hasta IS 'fecha hasta la cual es valida';


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN tasas.tasa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tasas.tasa IS 'Tasa de intercambio  vigente de una divisa';


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN tasas.tasa_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tasas.tasa_id IS 'Identificador unico de la tasa';


--
-- TOC entry 202 (class 1259 OID 29840)
-- Name: tbl_migration; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE tbl_migration (
    version character varying(255) NOT NULL,
    apply_time integer
);


ALTER TABLE public.tbl_migration OWNER TO eureka;

--
-- TOC entry 176 (class 1259 OID 28364)
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_id_seq OWNER TO eureka;

--
-- TOC entry 203 (class 1259 OID 29843)
-- Name: unidades; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE unidades (
    unidad_id bigint DEFAULT nextval('unidad_id_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.unidades OWNER TO eureka;

--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN unidades.unidad_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN unidades.unidad_id IS 'identificador unico de la tabla';


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN unidades.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN unidades.nombre IS 'descripcion de la unidad';


--
-- TOC entry 177 (class 1259 OID 28366)
-- Name: user_login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE user_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_login_attempts_id_seq OWNER TO eureka;

--
-- TOC entry 211 (class 1259 OID 30198)
-- Name: user_login_attempts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_login_attempts (
    id integer DEFAULT nextval('user_login_attempts_id_seq'::regclass) NOT NULL,
    username character varying(255) NOT NULL,
    user_id integer,
    performed_on timestamp without time zone NOT NULL,
    is_successful boolean DEFAULT false NOT NULL,
    session_id character varying(255),
    ipv4 bigint,
    user_agent character varying(255)
);


ALTER TABLE public.user_login_attempts OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 29855)
-- Name: user_used_passwords; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE user_used_passwords (
    id integer NOT NULL,
    user_id integer NOT NULL,
    password character varying(255) NOT NULL,
    set_on timestamp without time zone NOT NULL
);


ALTER TABLE public.user_used_passwords OWNER TO eureka;

--
-- TOC entry 205 (class 1259 OID 29858)
-- Name: user_used_passwords_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE user_used_passwords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_used_passwords_id_seq OWNER TO eureka;

--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 205
-- Name: user_used_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE user_used_passwords_id_seq OWNED BY user_used_passwords.id;


--
-- TOC entry 178 (class 1259 OID 28368)
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usuario_id_seq OWNER TO eureka;

--
-- TOC entry 206 (class 1259 OID 29860)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE usuarios (
    usuario_id bigint DEFAULT nextval('usuarios_usuario_id_seq'::regclass) NOT NULL,
    usuario character varying(50) NOT NULL,
    contrasena character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    creado_el timestamp without time zone NOT NULL,
    actualizado_el timestamp without time zone NOT NULL,
    esta_activo boolean DEFAULT true,
    esta_deshabilitado boolean DEFAULT false,
    correo_verificado boolean DEFAULT false,
    llave_activacion character varying(255),
    ultima_visita_el timestamp without time zone,
    nombre character varying(255),
    cedula character varying(255),
    cargo character varying(255),
    rol character varying(100) NOT NULL,
    ente_organo_id bigint NOT NULL
);


ALTER TABLE public.usuarios OWNER TO eureka;

--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE usuarios IS 'Tabla de usuarios';


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN usuarios.usuario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.usuario IS 'Nombre de usuario del ente u organismo';


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN usuarios.contrasena; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.contrasena IS 'Contraseña del usuario';


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN usuarios.correo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.correo IS 'Correo del usuario';


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN usuarios.creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.creado_el IS 'Fecha de creación de la cuenta';


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN usuarios.actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.actualizado_el IS 'Fecha de actualización de la cuenta';


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN usuarios.ente_organo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.ente_organo_id IS 'clave foranea';


--
-- TOC entry 2040 (class 2604 OID 29871)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY activerecordlog ALTER COLUMN id SET DEFAULT nextval('activerecordlog_id_seq'::regclass);


--
-- TOC entry 2065 (class 2604 OID 29872)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY user_used_passwords ALTER COLUMN id SET DEFAULT nextval('user_used_passwords_id_seq'::regclass);


--
-- TOC entry 2077 (class 2606 OID 29874)
-- Name: activerecordlog_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY activerecordlog
    ADD CONSTRAINT activerecordlog_pkey PRIMARY KEY (id);


--
-- TOC entry 2085 (class 2606 OID 29876)
-- Name: codigo_onapre_unique; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT codigo_onapre_unique UNIQUE (codigo_onapre);


--
-- TOC entry 2075 (class 2606 OID 29878)
-- Name: pkacciones; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY acciones
    ADD CONSTRAINT pkacciones PRIMARY KEY (accion_id);


--
-- TOC entry 2079 (class 2606 OID 29880)
-- Name: pkcodigos_ncm; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY codigos_ncm
    ADD CONSTRAINT pkcodigos_ncm PRIMARY KEY (codigo_ncm_id);


--
-- TOC entry 2081 (class 2606 OID 29882)
-- Name: pkdivisas; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY divisas
    ADD CONSTRAINT pkdivisas PRIMARY KEY (divisa_id);


--
-- TOC entry 2083 (class 2606 OID 29884)
-- Name: pkentes_adscritos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT pkentes_adscritos PRIMARY KEY (ente_adscrito_id);


--
-- TOC entry 2087 (class 2606 OID 29886)
-- Name: pkentes_organos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT pkentes_organos PRIMARY KEY (ente_organo_id);


--
-- TOC entry 2089 (class 2606 OID 29888)
-- Name: pkfuentes_financiamiento; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuentes_financiamiento
    ADD CONSTRAINT pkfuentes_financiamiento PRIMARY KEY (fuente_financiamiento_id);


--
-- TOC entry 2091 (class 2606 OID 29890)
-- Name: pkpartida_productos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT pkpartida_productos PRIMARY KEY (partida_producto_id);


--
-- TOC entry 2093 (class 2606 OID 29892)
-- Name: pkpartidas; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY partidas
    ADD CONSTRAINT pkpartidas PRIMARY KEY (partida_id);


--
-- TOC entry 2101 (class 2606 OID 29894)
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- TOC entry 2120 (class 2606 OID 30056)
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, producto_id, presupuesto_partida_id);


--
-- TOC entry 2095 (class 2606 OID 29898)
-- Name: pkpresupuesto_partida_acciones; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT pkpresupuesto_partida_acciones PRIMARY KEY (accion_id, ente_organo_id, presupuesto_partida_id);


--
-- TOC entry 2097 (class 2606 OID 29900)
-- Name: pkpresupuesto_partida_proyecto; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT pkpresupuesto_partida_proyecto PRIMARY KEY (proyecto_id, presupuesto_partida_id);


--
-- TOC entry 2122 (class 2606 OID 30062)
-- Name: pkpresupuestos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presupuestos
    ADD CONSTRAINT pkpresupuestos PRIMARY KEY (presupuesto_id);


--
-- TOC entry 2103 (class 2606 OID 29902)
-- Name: pkproductos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pkproductos PRIMARY KEY (producto_id);


--
-- TOC entry 2099 (class 2606 OID 29904)
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (presupuesto_partida_id);


--
-- TOC entry 2105 (class 2606 OID 29906)
-- Name: pkproyectos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT pkproyectos PRIMARY KEY (proyecto_id);


--
-- TOC entry 2124 (class 2606 OID 30068)
-- Name: pktasas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tasas
    ADD CONSTRAINT pktasas PRIMARY KEY (tasa_id);


--
-- TOC entry 2109 (class 2606 OID 29910)
-- Name: pkunidades; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT pkunidades PRIMARY KEY (unidad_id);


--
-- TOC entry 2107 (class 2606 OID 29912)
-- Name: tbl_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY tbl_migration
    ADD CONSTRAINT tbl_migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2126 (class 2606 OID 30207)
-- Name: user_login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 2111 (class 2606 OID 29916)
-- Name: user_used_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_pkey PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 29918)
-- Name: usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 2116 (class 2606 OID 29920)
-- Name: usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (usuario_id);


--
-- TOC entry 2118 (class 2606 OID 29922)
-- Name: usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- TOC entry 2127 (class 1259 OID 30208)
-- Name: user_login_attempts_user_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX user_login_attempts_user_id_idx ON user_login_attempts USING btree (user_id);


--
-- TOC entry 2112 (class 1259 OID 29924)
-- Name: user_used_passwords_user_id_idx; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX user_used_passwords_user_id_idx ON user_used_passwords USING btree (user_id);


--
-- TOC entry 2128 (class 2606 OID 30069)
-- Name: fk_entes_adscritos_entes_organos_hijo; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_hijo FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2129 (class 2606 OID 30074)
-- Name: fk_entes_adscritos_entes_organos_padre; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_padre FOREIGN KEY (padre_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2130 (class 2606 OID 30079)
-- Name: fk_partida_productos_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 2131 (class 2606 OID 30084)
-- Name: fk_partida_productos_productos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 2147 (class 2606 OID 30089)
-- Name: fk_presupuesto_importacion_codigos_ncm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_codigos_ncm FOREIGN KEY (codigo_ncm_id) REFERENCES codigos_ncm(codigo_ncm_id);


--
-- TOC entry 2148 (class 2606 OID 30094)
-- Name: fk_presupuesto_importacion_divisas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- TOC entry 2149 (class 2606 OID 30099)
-- Name: fk_presupuesto_importacion_presupuesto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- TOC entry 2150 (class 2606 OID 30104)
-- Name: fk_presupuesto_importacion_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 2132 (class 2606 OID 30109)
-- Name: fk_presupuesto_partida_acciones_acciones; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_acciones FOREIGN KEY (accion_id) REFERENCES acciones(accion_id);


--
-- TOC entry 2133 (class 2606 OID 30114)
-- Name: fk_presupuesto_partida_acciones_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2134 (class 2606 OID 30119)
-- Name: fk_presupuesto_partida_acciones_presupuesto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- TOC entry 2135 (class 2606 OID 30124)
-- Name: fk_presupuesto_partida_proyecto_presupuesto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- TOC entry 2136 (class 2606 OID 30129)
-- Name: fk_presupuesto_partida_proyecto_proyectos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_proyectos FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id);


--
-- TOC entry 2137 (class 2606 OID 30134)
-- Name: fk_presupuesto_partidas_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT fk_presupuesto_partidas_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2138 (class 2606 OID 30139)
-- Name: fk_presupuesto_partidas_fuentes_financiamiento; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT fk_presupuesto_partidas_fuentes_financiamiento FOREIGN KEY (fuente_fianciamiento_id) REFERENCES fuentes_financiamiento(fuente_financiamiento_id);


--
-- TOC entry 2140 (class 2606 OID 30193)
-- Name: fk_presupuesto_partidas_presupuestos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT fk_presupuesto_partidas_presupuestos FOREIGN KEY (presupuesto_id) REFERENCES presupuestos(presupuesto_id);


--
-- TOC entry 2141 (class 2606 OID 30149)
-- Name: fk_presupuesto_productos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 2142 (class 2606 OID 30154)
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- TOC entry 2143 (class 2606 OID 30159)
-- Name: fk_presupuesto_unidades; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_unidades FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id);


--
-- TOC entry 2139 (class 2606 OID 30144)
-- Name: fk_proyecto_partidas_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 2144 (class 2606 OID 30164)
-- Name: fk_proyectos_acciones_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_proyectos_acciones_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2151 (class 2606 OID 30169)
-- Name: fk_tasas_divisas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasas
    ADD CONSTRAINT fk_tasas_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- TOC entry 2146 (class 2606 OID 30184)
-- Name: fk_usuarios_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT fk_usuarios_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2152 (class 2606 OID 30209)
-- Name: user_login_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2145 (class 2606 OID 30179)
-- Name: user_used_passwords_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO eureka;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-12-10 01:16:16 VET

--
-- PostgreSQL database dump complete
--

