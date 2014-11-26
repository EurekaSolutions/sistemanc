--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2014-11-25 19:44:54 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 28329)
-- Name: compras; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA compras;


ALTER SCHEMA compras OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 28331)
-- Name: rnc; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rnc;


ALTER SCHEMA rnc OWNER TO postgres;

--
-- TOC entry 208 (class 3079 OID 11833)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 208
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = compras, pg_catalog;

--
-- TOC entry 172 (class 1259 OID 28332)
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.codigo_ncm_id_seq OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 28334)
-- Name: ente_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.ente_id_seq OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 28336)
-- Name: partida_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.partida_id_seq OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 28338)
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.presupuesto_id_seq OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 28340)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.producto_id_seq OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 28342)
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.proyecto_id_seq OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 28344)
-- Name: proyecto_partida_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE proyecto_partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.proyecto_partida_id_seq OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 28346)
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.unidad_id_seq OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 28348)
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: compras; Owner: postgres
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compras.usuarios_usuario_id_seq OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 181 (class 1259 OID 28350)
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.codigo_ncm_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 28370)
-- Name: codigos_ncm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.codigos_ncm OWNER TO postgres;

--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE codigos_ncm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE codigos_ncm IS 'Tbala que contiene los codigos arancelarios ';


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_id IS 'identificador unico del codigo arancelario';


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_1 IS 'partida';


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_2 IS 'subpartida';


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_3 IS 'codigo ncm';


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_4; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_4 IS 'especificacion propia del pais';


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.version IS 'campo de versionamiento';


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.fecha_desde; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.fecha_desde IS 'fechas desde la cual es valido el codigo arancelario';


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.fecha_hasta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.fecha_hasta IS 'fecha hasta la cual es valido el codigo arancalario';


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN codigos_ncm.enmienda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN codigos_ncm.enmienda IS 'este campo indica el numero de la enmienda';


--
-- TOC entry 206 (class 1259 OID 28690)
-- Name: divisa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE divisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divisa_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 28692)
-- Name: divisas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE divisas (
    divisa_id bigint DEFAULT nextval('divisa_id_seq'::regclass) NOT NULL,
    abreviatura character varying(255) NOT NULL,
    simbolo character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    tasa numeric(20,4) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL
);


ALTER TABLE public.divisas OWNER TO postgres;

--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN divisas.divisa_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN divisas.divisa_id IS 'clave primaria de la tabla';


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN divisas.abreviatura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN divisas.abreviatura IS 'abreviatura de la divisa';


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN divisas.simbolo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN divisas.simbolo IS 'simbolo de la divisa';


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN divisas.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN divisas.nombre IS 'nombre de la divisa';


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN divisas.tasa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN divisas.tasa IS 'tasa de cambio';


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN divisas.fecha_desde; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN divisas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN divisas.fecha_hasta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN divisas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 205 (class 1259 OID 28668)
-- Name: ente_adscrito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ente_adscrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ente_adscrito_id_seq OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 28352)
-- Name: ente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ente_id_seq OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 28384)
-- Name: entes_adscritos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entes_adscritos (
    padre_id bigint NOT NULL,
    ente_organo_id bigint NOT NULL,
    fecha_desde bigint NOT NULL,
    fecha_hasta bigint NOT NULL,
    ente_adscrito_id bigint DEFAULT nextval('ente_adscrito_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.entes_adscritos OWNER TO postgres;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN entes_adscritos.fecha_desde; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entes_adscritos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN entes_adscritos.fecha_hasta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entes_adscritos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 193 (class 1259 OID 28387)
-- Name: entes_organos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entes_organos (
    ente_organo_id bigint DEFAULT nextval('ente_id_seq'::regclass) NOT NULL,
    codigo_onapre character varying(20) NOT NULL,
    nombre character varying(255) NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public.entes_organos OWNER TO postgres;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE entes_organos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE entes_organos IS 'se encuentran registrados todos los entes y organos';


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN entes_organos.ente_organo_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entes_organos.ente_organo_id IS 'identificador unico de la tabla';


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN entes_organos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entes_organos.nombre IS 'nombre del organo o ente';


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN entes_organos.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entes_organos.tipo IS 'existen dos tipos, organos y entes';


--
-- TOC entry 183 (class 1259 OID 28354)
-- Name: partida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_id_seq OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 28395)
-- Name: partida_productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partida_productos (
    partida_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    tipo_operacion character varying(1) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL
);


ALTER TABLE public.partida_productos OWNER TO postgres;

--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE partida_productos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE partida_productos IS 'tabla que contiene los productos que pueden ser asociados a cada partida';


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.partida_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partida_productos.partida_id IS 'clave foranea que referencia a una partida';


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.producto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partida_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.tipo_operacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partida_productos.tipo_operacion IS 'este campo indica si se realiza una compra o una venta, puede tomar los valores C= compras y V = venta';


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.fecha_desde; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partida_productos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN partida_productos.fecha_hasta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partida_productos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 195 (class 1259 OID 28400)
-- Name: partidas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partidas (
    partida_id bigint DEFAULT nextval('partida_id_seq'::regclass) NOT NULL,
    p1 numeric(4,0) NOT NULL,
    p2 numeric(4,0) NOT NULL,
    p3 numeric(4,0) NOT NULL,
    p4 numeric(4,0) NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.partidas OWNER TO postgres;

--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE partidas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE partidas IS 'partidas presupuestarias disponibles';


--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.partida_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidas.partida_id IS 'identificador unico de la partida';


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidas.p1 IS 'partida';


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidas.p2 IS 'partida generica';


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidas.p3 IS 'partida especifica';


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.p4; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidas.p4 IS 'partida sub especifica';


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN partidas.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidas.nombre IS 'nombre de la partida';


--
-- TOC entry 184 (class 1259 OID 28356)
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presupuesto_id_seq OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 28415)
-- Name: presupuesto_importacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.presupuesto_importacion OWNER TO postgres;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN presupuesto_importacion.presupuesto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.presupuesto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- TOC entry 196 (class 1259 OID 28409)
-- Name: presupuesto_productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.presupuesto_productos OWNER TO postgres;

--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- TOC entry 185 (class 1259 OID 28358)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_seq OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 28420)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productos (
    producto_id bigint DEFAULT nextval('producto_id_seq'::regclass) NOT NULL,
    cod_segmento bigint NOT NULL,
    cod_familia bigint NOT NULL,
    cod_clase bigint NOT NULL,
    cod_producto bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE productos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE productos IS 'productos segun la convencion de las naciones unidas';


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN productos.producto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN productos.producto_id IS 'identificador unico del producto';


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN productos.cod_segmento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN productos.cod_segmento IS 'segmento del codigo de las naciones unidas';


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN productos.cod_familia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN productos.cod_familia IS 'familia del codigo de las naciones unidas';


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN productos.cod_clase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN productos.cod_clase IS 'clase del codigo de las naciones unidas';


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN productos.cod_producto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN productos.cod_producto IS 'codigo del producto de las naciones unidas';


--
-- TOC entry 186 (class 1259 OID 28360)
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_id_seq OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 28362)
-- Name: proyecto_partida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyecto_partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_partida_id_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 28426)
-- Name: proyecto_partidas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proyecto_partidas (
    proyecto_partida_id bigint DEFAULT nextval('proyecto_partida_id_seq'::regclass) NOT NULL,
    proyecto_id bigint NOT NULL,
    partida_id bigint NOT NULL,
    monto_presupuestado numeric(38,6) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL
);


ALTER TABLE public.proyecto_partidas OWNER TO postgres;

--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN proyecto_partidas.proyecto_partida_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.proyecto_partida_id IS 'identificador unico ';


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN proyecto_partidas.proyecto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.proyecto_id IS 'clave foranea que hace referencia a un proyecto o accion centralizada';


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN proyecto_partidas.partida_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN proyecto_partidas.monto_presupuestado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN proyecto_partidas.fecha_desde; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN proyecto_partidas.fecha_hasta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyecto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- TOC entry 200 (class 1259 OID 28432)
-- Name: proyectos_acciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.proyectos_acciones OWNER TO postgres;

--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE proyectos_acciones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE proyectos_acciones IS 'proyectos o acciones centralizadas';


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN proyectos_acciones.proyecto_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.proyecto_id IS 'identificador unico del proyecto';


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN proyectos_acciones.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.nombre IS 'nombre del proyecto o accion centralizada';


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN proyectos_acciones.monto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.monto IS 'monto del proyecto a accion centralizada';


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN proyectos_acciones.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN proyectos_acciones.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.tipo IS 'puede tomar los valores de "proyecto" y "accion centralizada"';


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN proyectos_acciones.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyectos_acciones.fecha IS 'fecha de comienzo del proyecto';


--
-- TOC entry 201 (class 1259 OID 28438)
-- Name: tbl_migration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_migration (
    version character varying(255) NOT NULL,
    apply_time integer
);


ALTER TABLE public.tbl_migration OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 28364)
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_id_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 28443)
-- Name: unidades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidades (
    unidad_id bigint DEFAULT nextval('unidad_id_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.unidades OWNER TO postgres;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN unidades.unidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN unidades.unidad_id IS 'identificador unico de la tabla';


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN unidades.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN unidades.nombre IS 'descripcion de la unidad';


--
-- TOC entry 189 (class 1259 OID 28366)
-- Name: user_login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_login_attempts_id_seq OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 28449)
-- Name: user_login_attempts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.user_login_attempts OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 28368)
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usuario_id_seq OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 28460)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuarios IS 'Tabla de usuarios';


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN usuarios.codigo_onapre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.codigo_onapre IS 'Clave foranea del codigo_onapre en la tabla entes_organos';


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN usuarios.usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.usuario IS 'Nombre de usuario del ente u organismo';


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN usuarios.contrasena; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.contrasena IS 'Contraseña del usuario';


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN usuarios.correo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.correo IS 'Correo del usuario';


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN usuarios.creado_el; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.creado_el IS 'Fecha de creación de la cuenta';


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN usuarios.actualizado_el; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.actualizado_el IS 'Fecha de actualización de la cuenta';


SET search_path = compras, pg_catalog;

--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 172
-- Name: codigo_ncm_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('codigo_ncm_id_seq', 1, false);


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 173
-- Name: ente_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('ente_id_seq', 1, false);


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 174
-- Name: partida_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('partida_id_seq', 1, false);


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 175
-- Name: presupuesto_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('presupuesto_id_seq', 1, false);


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 176
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('producto_id_seq', 1, false);


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 177
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_id_seq', 1, false);


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 178
-- Name: proyecto_partida_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_partida_id_seq', 1, false);


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 179
-- Name: unidad_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('unidad_id_seq', 1, false);


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 180
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE SET; Schema: compras; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_usuario_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 181
-- Name: codigo_ncm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('codigo_ncm_id_seq', 1, false);


--
-- TOC entry 2209 (class 0 OID 28370)
-- Dependencies: 191
-- Data for Name: codigos_ncm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY codigos_ncm (codigo_ncm_id, codigo_ncm_nivel_1, codigo_ncm_nivel_2, codigo_ncm_nivel_3, codigo_ncm_nivel_4, descripcion_ncm, version, fecha_desde, fecha_hasta, unidad, enmienda) FROM stdin;
\.


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 206
-- Name: divisa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('divisa_id_seq', 1, false);


--
-- TOC entry 2225 (class 0 OID 28692)
-- Dependencies: 207
-- Data for Name: divisas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY divisas (divisa_id, abreviatura, simbolo, nombre, tasa, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 205
-- Name: ente_adscrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ente_adscrito_id_seq', 1, false);


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 182
-- Name: ente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ente_id_seq', 1, false);


--
-- TOC entry 2210 (class 0 OID 28384)
-- Dependencies: 192
-- Data for Name: entes_adscritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entes_adscritos (padre_id, ente_organo_id, fecha_desde, fecha_hasta, ente_adscrito_id) FROM stdin;
\.


--
-- TOC entry 2211 (class 0 OID 28387)
-- Dependencies: 193
-- Data for Name: entes_organos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entes_organos (ente_organo_id, codigo_onapre, nombre, tipo) FROM stdin;
\.


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 183
-- Name: partida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('partida_id_seq', 1, false);


--
-- TOC entry 2212 (class 0 OID 28395)
-- Dependencies: 194
-- Data for Name: partida_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY partida_productos (partida_id, producto_id, tipo_operacion, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- TOC entry 2213 (class 0 OID 28400)
-- Dependencies: 195
-- Data for Name: partidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY partidas (partida_id, p1, p2, p3, p4, nombre) FROM stdin;
\.


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 184
-- Name: presupuesto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('presupuesto_id_seq', 1, false);


--
-- TOC entry 2215 (class 0 OID 28415)
-- Dependencies: 197
-- Data for Name: presupuesto_importacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presupuesto_importacion (codigo_ncm_id, presupuesto_id, cantidad, fecha_llegada, monto_presupuesto, tipo, monto_ejecutado, divisa_id) FROM stdin;
\.


--
-- TOC entry 2214 (class 0 OID 28409)
-- Dependencies: 196
-- Data for Name: presupuesto_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presupuesto_productos (presupuesto_id, producto_id, unidad_id, costo_unidad, cantidad, monto_presupuesto, tipo, monto_ejecutado, proyecto_partida_id) FROM stdin;
\.


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 185
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_id_seq', 1, false);


--
-- TOC entry 2216 (class 0 OID 28420)
-- Dependencies: 198
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY productos (producto_id, cod_segmento, cod_familia, cod_clase, cod_producto, nombre) FROM stdin;
\.


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 186
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_id_seq', 1, false);


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 187
-- Name: proyecto_partida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_partida_id_seq', 1, false);


--
-- TOC entry 2217 (class 0 OID 28426)
-- Dependencies: 199
-- Data for Name: proyecto_partidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proyecto_partidas (proyecto_partida_id, proyecto_id, partida_id, monto_presupuestado, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- TOC entry 2218 (class 0 OID 28432)
-- Dependencies: 200
-- Data for Name: proyectos_acciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proyectos_acciones (proyecto_id, nombre, monto, codigo, ente_organo_id, tipo, fecha) FROM stdin;
\.


--
-- TOC entry 2219 (class 0 OID 28438)
-- Dependencies: 201
-- Data for Name: tbl_migration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tbl_migration (version, apply_time) FROM stdin;
\.


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 188
-- Name: unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_id_seq', 1, false);


--
-- TOC entry 2220 (class 0 OID 28443)
-- Dependencies: 202
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidades (unidad_id, nombre) FROM stdin;
\.


--
-- TOC entry 2221 (class 0 OID 28449)
-- Dependencies: 203
-- Data for Name: user_login_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_login_attempts (id, username, user_id, performed_on, is_successful, session_id, ipv4, user_agent) FROM stdin;
\.


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 189
-- Name: user_login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_login_attempts_id_seq', 1, false);


--
-- TOC entry 2222 (class 0 OID 28460)
-- Dependencies: 204
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (usuario_id, codigo_onapre, usuario, contrasena, correo, creado_el, actualizado_el, esta_activo, esta_deshabilitado, correo_verificado, llave_activacion, ultima_visita_el) FROM stdin;
\.


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 190
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_usuario_id_seq', 1, false);


--
-- TOC entry 2036 (class 2606 OID 28394)
-- Name: codigo_onapre_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT codigo_onapre_unique UNIQUE (codigo_onapre);


--
-- TOC entry 2032 (class 2606 OID 28383)
-- Name: pkcodigos_ncm; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY codigos_ncm
    ADD CONSTRAINT pkcodigos_ncm PRIMARY KEY (codigo_ncm_id);


--
-- TOC entry 2067 (class 2606 OID 28700)
-- Name: pkdivisas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY divisas
    ADD CONSTRAINT pkdivisas PRIMARY KEY (divisa_id);


--
-- TOC entry 2034 (class 2606 OID 28672)
-- Name: pkentes_adscritos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT pkentes_adscritos PRIMARY KEY (ente_adscrito_id);


--
-- TOC entry 2038 (class 2606 OID 28674)
-- Name: pkentes_organos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT pkentes_organos PRIMARY KEY (ente_organo_id);


--
-- TOC entry 2040 (class 2606 OID 28399)
-- Name: pkpartida_productos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT pkpartida_productos PRIMARY KEY (partida_id, producto_id, tipo_operacion);


--
-- TOC entry 2042 (class 2606 OID 28408)
-- Name: pkpartidas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partidas
    ADD CONSTRAINT pkpartidas PRIMARY KEY (partida_id);


--
-- TOC entry 2044 (class 2606 OID 28414)
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- TOC entry 2046 (class 2606 OID 28419)
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, presupuesto_id);


--
-- TOC entry 2048 (class 2606 OID 28425)
-- Name: pkproductos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pkproductos PRIMARY KEY (producto_id);


--
-- TOC entry 2050 (class 2606 OID 28431)
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (proyecto_partida_id);


--
-- TOC entry 2052 (class 2606 OID 28437)
-- Name: pkproyectos_acciones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT pkproyectos_acciones PRIMARY KEY (proyecto_id);


--
-- TOC entry 2056 (class 2606 OID 28448)
-- Name: pkunidades; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT pkunidades PRIMARY KEY (unidad_id);


--
-- TOC entry 2054 (class 2606 OID 28442)
-- Name: tbl_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_migration
    ADD CONSTRAINT tbl_migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2058 (class 2606 OID 28458)
-- Name: user_login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 28473)
-- Name: usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 2063 (class 2606 OID 28471)
-- Name: usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (usuario_id);


--
-- TOC entry 2065 (class 2606 OID 28475)
-- Name: usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- TOC entry 2059 (class 1259 OID 28459)
-- Name: user_login_attempts_user_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX user_login_attempts_user_id_idx ON user_login_attempts USING btree (user_id);


--
-- TOC entry 2082 (class 2606 OID 28541)
-- Name: entes_organos_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT entes_organos_usuarios_fk FOREIGN KEY (codigo_onapre) REFERENCES entes_organos(codigo_onapre);


--
-- TOC entry 2068 (class 2606 OID 28675)
-- Name: fk_entes_adscritos_entes_organos_hijo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_hijo FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2069 (class 2606 OID 28680)
-- Name: fk_entes_adscritos_entes_organos_padre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_padre FOREIGN KEY (padre_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2070 (class 2606 OID 28486)
-- Name: fk_partida_productos_partidas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 2071 (class 2606 OID 28491)
-- Name: fk_partida_productos_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 2077 (class 2606 OID 28511)
-- Name: fk_presupuesto_importacion_codigos_ncm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_codigos_ncm FOREIGN KEY (codigo_ncm_id) REFERENCES codigos_ncm(codigo_ncm_id);


--
-- TOC entry 2075 (class 2606 OID 28701)
-- Name: fk_presupuesto_importacion_divisas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- TOC entry 2076 (class 2606 OID 28706)
-- Name: fk_presupuesto_importacion_presupuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto FOREIGN KEY (presupuesto_id) REFERENCES presupuesto_productos(presupuesto_id);


--
-- TOC entry 2072 (class 2606 OID 28711)
-- Name: fk_presupuesto_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- TOC entry 2073 (class 2606 OID 28716)
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES proyecto_partidas(proyecto_partida_id);


--
-- TOC entry 2074 (class 2606 OID 28721)
-- Name: fk_presupuesto_unidades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_unidades FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id);


--
-- TOC entry 2078 (class 2606 OID 28521)
-- Name: fk_proyecto_partidas_partidas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- TOC entry 2079 (class 2606 OID 28526)
-- Name: fk_proyecto_partidas_proyectos_acciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_proyectos_acciones FOREIGN KEY (proyecto_id) REFERENCES proyectos_acciones(proyecto_id);


--
-- TOC entry 2080 (class 2606 OID 28685)
-- Name: fk_proyectos_acciones_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT fk_proyectos_acciones_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- TOC entry 2081 (class 2606 OID 28536)
-- Name: user_login_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2014-11-25 19:44:55 VET

--
-- PostgreSQL database dump complete
--

