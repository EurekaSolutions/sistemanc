--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
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
-- Name: activerecordlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compras
--

ALTER SEQUENCE activerecordlog_id_seq OWNED BY activerecordlog.id;


--
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
-- Name: TABLE codigos_ncm; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE codigos_ncm IS 'Tbala que contiene los codigos arancelarios ';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_id IS 'identificador unico del codigo arancelario';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_1; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_1 IS 'partida';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_2; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_2 IS 'subpartida';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_3; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_3 IS 'codigo ncm';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_4; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_4 IS 'especificacion propia del pais';


--
-- Name: COLUMN codigos_ncm.version; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.version IS 'campo de versionamiento';


--
-- Name: COLUMN codigos_ncm.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.fecha_desde IS 'fechas desde la cual es valido el codigo arancelario';


--
-- Name: COLUMN codigos_ncm.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.fecha_hasta IS 'fecha hasta la cual es valido el codigo arancalario';


--
-- Name: COLUMN codigos_ncm.enmienda; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN codigos_ncm.enmienda IS 'este campo indica el numero de la enmienda';


--
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
-- Name: divisas; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
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


ALTER TABLE public.divisas OWNER TO compras;

--
-- Name: COLUMN divisas.divisa_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.divisa_id IS 'clave primaria de la tabla';


--
-- Name: COLUMN divisas.abreviatura; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.abreviatura IS 'abreviatura de la divisa';


--
-- Name: COLUMN divisas.simbolo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.simbolo IS 'simbolo de la divisa';


--
-- Name: COLUMN divisas.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.nombre IS 'nombre de la divisa';


--
-- Name: COLUMN divisas.tasa; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.tasa IS 'tasa de cambio';


--
-- Name: COLUMN divisas.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN divisas.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN divisas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
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
-- Name: COLUMN entes_adscritos.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_adscritos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN entes_adscritos.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_adscritos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
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
-- Name: TABLE entes_organos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE entes_organos IS 'se encuentran registrados todos los entes y organos';


--
-- Name: COLUMN entes_organos.ente_organo_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_organos.ente_organo_id IS 'identificador unico de la tabla';


--
-- Name: COLUMN entes_organos.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_organos.nombre IS 'nombre del organo o ente';


--
-- Name: COLUMN entes_organos.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN entes_organos.tipo IS 'existen dos tipos, organos y entes';


--
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
-- Name: partida_productos; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE partida_productos (
    partida_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    tipo_operacion character varying(1) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL
);


ALTER TABLE public.partida_productos OWNER TO compras;

--
-- Name: TABLE partida_productos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE partida_productos IS 'tabla que contiene los productos que pueden ser asociados a cada partida';


--
-- Name: COLUMN partida_productos.partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.partida_id IS 'clave foranea que referencia a una partida';


--
-- Name: COLUMN partida_productos.producto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN partida_productos.tipo_operacion; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.tipo_operacion IS 'este campo indica si se realiza una compra o una venta, puede tomar los valores C= compras y V = venta';


--
-- Name: COLUMN partida_productos.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN partida_productos.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partida_productos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
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
-- Name: TABLE partidas; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE partidas IS 'partidas presupuestarias disponibles';


--
-- Name: COLUMN partidas.partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.partida_id IS 'identificador unico de la partida';


--
-- Name: COLUMN partidas.p1; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p1 IS 'partida';


--
-- Name: COLUMN partidas.p2; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p2 IS 'partida generica';


--
-- Name: COLUMN partidas.p3; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p3 IS 'partida especifica';


--
-- Name: COLUMN partidas.p4; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.p4 IS 'partida sub especifica';


--
-- Name: COLUMN partidas.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN partidas.nombre IS 'nombre de la partida';


--
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
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- Name: COLUMN presupuesto_importacion.presupuesto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.presupuesto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
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
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
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
-- Name: TABLE productos; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE productos IS 'productos segun la convencion de las naciones unidas';


--
-- Name: COLUMN productos.producto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.producto_id IS 'identificador unico del producto';


--
-- Name: COLUMN productos.cod_segmento; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_segmento IS 'segmento del codigo de las naciones unidas';


--
-- Name: COLUMN productos.cod_familia; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_familia IS 'familia del codigo de las naciones unidas';


--
-- Name: COLUMN productos.cod_clase; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_clase IS 'clase del codigo de las naciones unidas';


--
-- Name: COLUMN productos.cod_producto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN productos.cod_producto IS 'codigo del producto de las naciones unidas';


--
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
-- Name: COLUMN proyecto_partidas.proyecto_partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.proyecto_partida_id IS 'identificador unico ';


--
-- Name: COLUMN proyecto_partidas.proyecto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.proyecto_id IS 'clave foranea que hace referencia a un proyecto o accion centralizada';


--
-- Name: COLUMN proyecto_partidas.partida_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- Name: COLUMN proyecto_partidas.monto_presupuestado; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- Name: COLUMN proyecto_partidas.fecha_desde; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN proyecto_partidas.fecha_hasta; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyecto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
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
-- Name: TABLE proyectos_acciones; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE proyectos_acciones IS 'proyectos o acciones centralizadas';


--
-- Name: COLUMN proyectos_acciones.proyecto_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.proyecto_id IS 'identificador unico del proyecto';


--
-- Name: COLUMN proyectos_acciones.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.nombre IS 'nombre del proyecto o accion centralizada';


--
-- Name: COLUMN proyectos_acciones.monto; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.monto IS 'monto del proyecto a accion centralizada';


--
-- Name: COLUMN proyectos_acciones.codigo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- Name: COLUMN proyectos_acciones.tipo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.tipo IS 'puede tomar los valores de "proyecto" y "accion centralizada"';


--
-- Name: COLUMN proyectos_acciones.fecha; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN proyectos_acciones.fecha IS 'fecha de comienzo del proyecto';


--
-- Name: tbl_migration; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE tbl_migration (
    version character varying(255) NOT NULL,
    apply_time integer
);


ALTER TABLE public.tbl_migration OWNER TO compras;

--
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
-- Name: unidades; Type: TABLE; Schema: public; Owner: compras; Tablespace: 
--

CREATE TABLE unidades (
    unidad_id bigint DEFAULT nextval('unidad_id_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.unidades OWNER TO compras;

--
-- Name: COLUMN unidades.unidad_id; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN unidades.unidad_id IS 'identificador unico de la tabla';


--
-- Name: COLUMN unidades.nombre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN unidades.nombre IS 'descripcion de la unidad';


--
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
-- Name: user_used_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compras
--

ALTER SEQUENCE user_used_passwords_id_seq OWNED BY user_used_passwords.id;


--
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
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON TABLE usuarios IS 'Tabla de usuarios';


--
-- Name: COLUMN usuarios.codigo_onapre; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.codigo_onapre IS 'Clave foranea del codigo_onapre en la tabla entes_organos';


--
-- Name: COLUMN usuarios.usuario; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.usuario IS 'Nombre de usuario del ente u organismo';


--
-- Name: COLUMN usuarios.contrasena; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.contrasena IS 'Contraseña del usuario';


--
-- Name: COLUMN usuarios.correo; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.correo IS 'Correo del usuario';


--
-- Name: COLUMN usuarios.creado_el; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.creado_el IS 'Fecha de creación de la cuenta';


--
-- Name: COLUMN usuarios.actualizado_el; Type: COMMENT; Schema: public; Owner: compras
--

COMMENT ON COLUMN usuarios.actualizado_el IS 'Fecha de actualización de la cuenta';


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compras
--

ALTER TABLE ONLY activerecordlog ALTER COLUMN id SET DEFAULT nextval('activerecordlog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compras
--

ALTER TABLE ONLY user_used_passwords ALTER COLUMN id SET DEFAULT nextval('user_used_passwords_id_seq'::regclass);


--
-- Data for Name: activerecordlog; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY activerecordlog (id, descripcion, accion, model, idmodel, field, creationdate, userid) FROM stdin;
\.


--
-- Name: activerecordlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('activerecordlog_id_seq', 1, false);


--
-- Name: codigo_ncm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('codigo_ncm_id_seq', 1, false);


--
-- Data for Name: codigos_ncm; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY codigos_ncm (codigo_ncm_id, codigo_ncm_nivel_1, codigo_ncm_nivel_2, codigo_ncm_nivel_3, codigo_ncm_nivel_4, descripcion_ncm, version, fecha_desde, fecha_hasta, unidad, enmienda) FROM stdin;
\.


--
-- Name: divisa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('divisa_id_seq', 1, false);


--
-- Data for Name: divisas; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY divisas (divisa_id, abreviatura, simbolo, nombre, tasa, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- Name: ente_adscrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('ente_adscrito_id_seq', 1, false);


--
-- Name: ente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('ente_id_seq', 1, false);


--
-- Data for Name: entes_adscritos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY entes_adscritos (padre_id, ente_organo_id, fecha_desde, fecha_hasta, ente_adscrito_id) FROM stdin;
\.


--
-- Data for Name: entes_organos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY entes_organos (ente_organo_id, codigo_onapre, nombre, tipo) FROM stdin;
\.


--
-- Name: partida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('partida_id_seq', 1, false);


--
-- Data for Name: partida_productos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY partida_productos (partida_id, producto_id, tipo_operacion, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- Data for Name: partidas; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY partidas (partida_id, p1, p2, p3, p4, nombre) FROM stdin;
\.


--
-- Name: presupuesto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('presupuesto_id_seq', 1, false);


--
-- Data for Name: presupuesto_importacion; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY presupuesto_importacion (codigo_ncm_id, presupuesto_id, cantidad, fecha_llegada, monto_presupuesto, tipo, monto_ejecutado, divisa_id) FROM stdin;
\.


--
-- Data for Name: presupuesto_productos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY presupuesto_productos (presupuesto_id, producto_id, unidad_id, costo_unidad, cantidad, monto_presupuesto, tipo, monto_ejecutado, proyecto_partida_id) FROM stdin;
\.


--
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('producto_id_seq', 1, false);


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY productos (producto_id, cod_segmento, cod_familia, cod_clase, cod_producto, nombre) FROM stdin;
\.


--
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('proyecto_id_seq', 1, false);


--
-- Name: proyecto_partida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('proyecto_partida_id_seq', 1, false);


--
-- Data for Name: proyecto_partidas; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY proyecto_partidas (proyecto_partida_id, proyecto_id, partida_id, monto_presupuestado, fecha_desde, fecha_hasta) FROM stdin;
\.


--
-- Data for Name: proyectos_acciones; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY proyectos_acciones (proyecto_id, nombre, monto, codigo, ente_organo_id, tipo, fecha) FROM stdin;
\.


--
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
-- Name: unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('unidad_id_seq', 1, false);


--
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY unidades (unidad_id, nombre) FROM stdin;
\.


--
-- Data for Name: user_login_attempts; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY user_login_attempts (id, username, user_id, performed_on, is_successful, session_id, ipv4, user_agent) FROM stdin;
\.


--
-- Name: user_login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('user_login_attempts_id_seq', 1, false);


--
-- Data for Name: user_used_passwords; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY user_used_passwords (id, user_id, password, set_on) FROM stdin;
\.


--
-- Name: user_used_passwords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('user_used_passwords_id_seq', 1, false);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY usuarios (usuario_id, codigo_onapre, usuario, contrasena, correo, creado_el, actualizado_el, esta_activo, esta_deshabilitado, correo_verificado, llave_activacion, ultima_visita_el) FROM stdin;
\.


--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compras
--

SELECT pg_catalog.setval('usuarios_usuario_id_seq', 1, false);


--
-- Name: activerecordlog_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY activerecordlog
    ADD CONSTRAINT activerecordlog_pkey PRIMARY KEY (id);


--
-- Name: codigo_onapre_unique; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT codigo_onapre_unique UNIQUE (codigo_onapre);


--
-- Name: pkcodigos_ncm; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY codigos_ncm
    ADD CONSTRAINT pkcodigos_ncm PRIMARY KEY (codigo_ncm_id);


--
-- Name: pkdivisas; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY divisas
    ADD CONSTRAINT pkdivisas PRIMARY KEY (divisa_id);


--
-- Name: pkentes_adscritos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT pkentes_adscritos PRIMARY KEY (ente_adscrito_id);


--
-- Name: pkentes_organos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT pkentes_organos PRIMARY KEY (ente_organo_id);


--
-- Name: pkpartida_productos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT pkpartida_productos PRIMARY KEY (partida_id, producto_id, tipo_operacion);


--
-- Name: pkpartidas; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY partidas
    ADD CONSTRAINT pkpartidas PRIMARY KEY (partida_id);


--
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, presupuesto_id);


--
-- Name: pkproductos; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pkproductos PRIMARY KEY (producto_id);


--
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (proyecto_partida_id);


--
-- Name: pkproyectos_acciones; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT pkproyectos_acciones PRIMARY KEY (proyecto_id);


--
-- Name: pkunidades; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT pkunidades PRIMARY KEY (unidad_id);


--
-- Name: tbl_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY tbl_migration
    ADD CONSTRAINT tbl_migration_pkey PRIMARY KEY (version);


--
-- Name: user_login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_pkey PRIMARY KEY (id);


--
-- Name: user_used_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_pkey PRIMARY KEY (id);


--
-- Name: usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- Name: usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (usuario_id);


--
-- Name: usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: compras; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- Name: user_login_attempts_user_id_idx; Type: INDEX; Schema: public; Owner: compras; Tablespace: 
--

CREATE INDEX user_login_attempts_user_id_idx ON user_login_attempts USING btree (user_id);


--
-- Name: user_used_passwords_user_id_idx; Type: INDEX; Schema: public; Owner: compras; Tablespace: 
--

CREATE INDEX user_used_passwords_user_id_idx ON user_used_passwords USING btree (user_id);


--
-- Name: entes_organos_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT entes_organos_usuarios_fk FOREIGN KEY (codigo_onapre) REFERENCES entes_organos(codigo_onapre);


--
-- Name: fk_entes_adscritos_entes_organos_hijo; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_hijo FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_entes_adscritos_entes_organos_padre; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_padre FOREIGN KEY (padre_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_partida_productos_partidas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- Name: fk_partida_productos_productos; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- Name: fk_presupuesto_importacion_codigos_ncm; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_codigos_ncm FOREIGN KEY (codigo_ncm_id) REFERENCES codigos_ncm(codigo_ncm_id);


--
-- Name: fk_presupuesto_importacion_divisas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- Name: fk_presupuesto_importacion_presupuesto; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto FOREIGN KEY (presupuesto_id) REFERENCES presupuesto_productos(presupuesto_id);


--
-- Name: fk_presupuesto_productos; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES proyecto_partidas(proyecto_partida_id);


--
-- Name: fk_presupuesto_unidades; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_unidades FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id);


--
-- Name: fk_proyecto_partidas_partidas; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- Name: fk_proyecto_partidas_proyectos_acciones; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY proyecto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_proyectos_acciones FOREIGN KEY (proyecto_id) REFERENCES proyectos_acciones(proyecto_id);


--
-- Name: fk_proyectos_acciones_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY proyectos_acciones
    ADD CONSTRAINT fk_proyectos_acciones_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: user_login_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_used_passwords_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: compras
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: compras
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM compras;
GRANT ALL ON SCHEMA public TO compras;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

