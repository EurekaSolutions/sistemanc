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
-- Name: trimestre1; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA trimestre1;


ALTER SCHEMA trimestre1 OWNER TO eureka;

--
-- Name: SCHEMA trimestre1; Type: COMMENT; Schema: -; Owner: eureka
--

COMMENT ON SCHEMA trimestre1 IS 'Esquema para la replicación de las tablas relacionadas al Plan de Compras para el trimestre 1.';


--
-- Name: trimestre2; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA trimestre2;


ALTER SCHEMA trimestre2 OWNER TO eureka;

--
-- Name: SCHEMA trimestre2; Type: COMMENT; Schema: -; Owner: eureka
--

COMMENT ON SCHEMA trimestre2 IS 'Esquema para la replicación de las tablas relacionadas al Plan de Compras para el trimestre 2.';


--
-- Name: trimestre3; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA trimestre3;


ALTER SCHEMA trimestre3 OWNER TO eureka;

--
-- Name: SCHEMA trimestre3; Type: COMMENT; Schema: -; Owner: eureka
--

COMMENT ON SCHEMA trimestre3 IS 'Esquema para la replicación de las tablas relacionadas al Plan de Compras para el trimestre 3.';


--
-- Name: trimestre4; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA trimestre4;


ALTER SCHEMA trimestre4 OWNER TO eureka;

--
-- Name: SCHEMA trimestre4; Type: COMMENT; Schema: -; Owner: eureka
--

COMMENT ON SCHEMA trimestre4 IS 'Esquema para la replicación de las tablas relacionadas al Plan de Compras para el trimestre 4.';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
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
-- Name: acciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE acciones (
    accion_id bigint DEFAULT nextval('accion_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo bigint
);


ALTER TABLE public.acciones OWNER TO eureka;

--
-- Name: TABLE acciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE acciones IS 'tabla que contienes las acciones centralizadas';


--
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
    userid integer NOT NULL
);


ALTER TABLE public.activerecordlog OWNER TO eureka;

--
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
-- Name: activerecordlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE activerecordlog_id_seq OWNED BY activerecordlog.id;


--
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
-- Name: TABLE codigos_ncm; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE codigos_ncm IS 'Tbala que contiene los codigos arancelarios ';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_id IS 'identificador unico del codigo arancelario';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_1; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_1 IS 'partida';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_2; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_2 IS 'subpartida';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_3; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_3 IS 'codigo ncm';


--
-- Name: COLUMN codigos_ncm.codigo_ncm_nivel_4; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.codigo_ncm_nivel_4 IS 'especificacion propia del pais';


--
-- Name: COLUMN codigos_ncm.version; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.version IS 'campo de versionamiento';


--
-- Name: COLUMN codigos_ncm.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.fecha_desde IS 'fechas desde la cual es valido el codigo arancelario';


--
-- Name: COLUMN codigos_ncm.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.fecha_hasta IS 'fecha hasta la cual es valido el codigo arancalario';


--
-- Name: COLUMN codigos_ncm.enmienda; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN codigos_ncm.enmienda IS 'este campo indica el numero de la enmienda';


--
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
-- Name: user_login_attempts; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
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


ALTER TABLE public.user_login_attempts OWNER TO eureka;

--
-- Name: conexiones_dia; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW conexiones_dia AS
 SELECT count(date_trunc('day'::text, user_login_attempts.performed_on)) AS conexiones,
    date_trunc('day'::text, user_login_attempts.performed_on) AS dia
   FROM user_login_attempts
  WHERE (user_login_attempts.is_successful = true)
  GROUP BY date_trunc('day'::text, user_login_attempts.performed_on)
  ORDER BY date_trunc('day'::text, user_login_attempts.performed_on);


ALTER TABLE public.conexiones_dia OWNER TO eureka;

--
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
-- Name: COLUMN divisas.divisa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.divisa_id IS 'clave primaria de la tabla';


--
-- Name: COLUMN divisas.abreviatura; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.abreviatura IS 'abreviatura de la divisa';


--
-- Name: COLUMN divisas.simbolo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.simbolo IS 'simbolo de la divisa';


--
-- Name: COLUMN divisas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN divisas.nombre IS 'nombre de la divisa';


--
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
-- Name: TABLE entes_organos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE entes_organos IS 'se encuentran registrados todos los entes y organos';


--
-- Name: COLUMN entes_organos.ente_organo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_organos.ente_organo_id IS 'identificador unico de la tabla';


--
-- Name: COLUMN entes_organos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_organos.nombre IS 'nombre del organo o ente';


--
-- Name: COLUMN entes_organos.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_organos.tipo IS 'existen dos tipos, organos y entes';


--
-- Name: presupuesto_partida_acciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_acciones (
    accion_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    codigo_accion character varying(100) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_accion_padre bigint,
    anho integer NOT NULL
);


ALTER TABLE public.presupuesto_partida_acciones OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partida_acciones.anho; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partida_acciones.anho IS 'Año de presupuesto carga de la acción';


--
-- Name: ente_accion_presupuesto_partida; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW ente_accion_presupuesto_partida AS
 SELECT a.ente_organo_id,
    a.nombre AS ente_nombre,
    a.codigo_onapre,
    a.rif,
    c.codigo_accion,
    c.codigo_accion_padre,
    c.presupuesto_partida_id,
    d.accion_id,
    d.nombre
   FROM ((entes_organos a
     JOIN presupuesto_partida_acciones c ON ((c.ente_organo_id = a.ente_organo_id)))
     JOIN acciones d ON ((d.accion_id = c.accion_id)));


ALTER TABLE public.ente_accion_presupuesto_partida OWNER TO eureka;

--
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
-- Name: proyectos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE proyectos (
    proyecto_id bigint DEFAULT nextval('proyecto_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_padre character varying(20),
    anho integer NOT NULL
);


ALTER TABLE public.proyectos OWNER TO eureka;

--
-- Name: TABLE proyectos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE proyectos IS 'proyectos o acciones centralizadas';


--
-- Name: COLUMN proyectos.proyecto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proyectos.proyecto_id IS 'identificador unico del proyecto';


--
-- Name: COLUMN proyectos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proyectos.nombre IS 'nombre del proyecto o accion centralizada';


--
-- Name: COLUMN proyectos.codigo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proyectos.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- Name: COLUMN proyectos.anho; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proyectos.anho IS 'Año de presupuesto carga del proyecto';


--
-- Name: ente_proyecto; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW ente_proyecto AS
 SELECT a.ente_organo_id,
    a.nombre AS ente_nombre,
    a.codigo_onapre,
    a.rif,
    b.proyecto_id,
    b.nombre,
    b.codigo,
    b.codigo_padre
   FROM (entes_organos a
     JOIN proyectos b ON ((a.ente_organo_id = b.ente_organo_id)));


ALTER TABLE public.ente_proyecto OWNER TO eureka;

--
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
-- Name: COLUMN entes_adscritos.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_adscritos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN entes_adscritos.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_adscritos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- Name: COLUMN entes_adscritos.ente_adscrito_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN entes_adscritos.ente_adscrito_id IS 'Identificador unico de la tabla';


--
-- Name: facturas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas (
    id integer NOT NULL,
    num_factura character varying(255) NOT NULL,
    anho integer,
    proveedor_id integer NOT NULL,
    procedimiento_id integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    fecha_factura date,
    ente_organo_id integer NOT NULL,
    cierre_carga boolean
);


ALTER TABLE public.facturas OWNER TO eureka;

--
-- Name: TABLE facturas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE facturas IS 'Factura del modulo de rendición de cuentas';


--
-- Name: COLUMN facturas.num_factura; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.num_factura IS 'Número de factura.';


--
-- Name: COLUMN facturas.anho; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.anho IS 'Año en que se cargo la factura';


--
-- Name: COLUMN facturas.proveedor_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foránea a la tabla Proveedores';


--
-- Name: COLUMN facturas.procedimiento_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.procedimiento_id IS 'Clave foránea a la tabla Procedimientos';


--
-- Name: COLUMN facturas.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas.fecha_factura; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_factura IS 'Fecha de emisióin de la factura';


--
-- Name: COLUMN facturas.ente_organo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: COLUMN facturas.cierre_carga; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas.cierre_carga IS 'Indica si se finalizó la carga de la  Factura.';


--
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturas_id_seq OWNER TO eureka;

--
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE facturas_id_seq OWNED BY facturas.id;


--
-- Name: facturas_productos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas_productos (
    id integer NOT NULL,
    factura_id integer NOT NULL,
    producto_id integer NOT NULL,
    costo_unitario numeric(38,6) NOT NULL,
    cantidad_adquirida integer,
    iva_id integer,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    presupuesto_partida_id integer NOT NULL
);


ALTER TABLE public.facturas_productos OWNER TO eureka;

--
-- Name: COLUMN facturas_productos.factura_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.factura_id IS 'Factura a la cual esta asociado el producto.';


--
-- Name: COLUMN facturas_productos.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.producto_id IS 'Clave foranea a la tabla productos';


--
-- Name: COLUMN facturas_productos.costo_unitario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.costo_unitario IS 'Costo unitario del producto';


--
-- Name: COLUMN facturas_productos.cantidad_adquirida; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.cantidad_adquirida IS 'Cantidad del producto adquirido en la factura';


--
-- Name: COLUMN facturas_productos.iva_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.iva_id IS 'Clave foránea a la tabla IVA';


--
-- Name: COLUMN facturas_productos.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas_productos.presupuesto_partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.presupuesto_partida_id IS 'Clave foranea a la tabla Presupuesto_partida';


--
-- Name: facturas_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE facturas_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturas_productos_id_seq OWNER TO eureka;

--
-- Name: facturas_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE facturas_productos_id_seq OWNED BY facturas_productos.id;


--
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
-- Name: fuente_presupuesto; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE fuente_presupuesto (
    id integer NOT NULL,
    fuente_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    monto numeric(38,6),
    fecha_registro date DEFAULT now() NOT NULL
);


ALTER TABLE public.fuente_presupuesto OWNER TO eureka;

--
-- Name: COLUMN fuente_presupuesto.monto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.monto IS 'Monto asignado de la fuente de financiamiento';


--
-- Name: COLUMN fuente_presupuesto.fecha_registro; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.fecha_registro IS 'Fecha del momento que se asigna el monto y la fuente de financiamiento al proyecto o accion.';


--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE fuente_presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fuente_presupuesto_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE fuente_presupuesto_id_seq OWNED BY fuente_presupuesto.id;


--
-- Name: fuentes_financiamiento; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE fuentes_financiamiento (
    fuente_financiamiento_id bigint DEFAULT nextval('fuente_financiamiento_id_seq'::regclass) NOT NULL,
    nombre character varying(255) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.fuentes_financiamiento OWNER TO eureka;

--
-- Name: iva; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE iva (
    id integer NOT NULL,
    tipo character varying(255) NOT NULL,
    porcentaje numeric(38,6) NOT NULL,
    fecha timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.iva OWNER TO eureka;

--
-- Name: TABLE iva; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE iva IS 'Almacena los IVA disponible según bien/servicio/obra a cancelar';


--
-- Name: COLUMN iva.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva.tipo IS 'Tipo de IVA (Bien, Servicio u Obra)';


--
-- Name: COLUMN iva.porcentaje; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva.porcentaje IS 'Porcentaje del tipo de IVA';


--
-- Name: COLUMN iva.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva.fecha IS 'Fecha de creación del iva';


--
-- Name: iva_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE iva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iva_id_seq OWNER TO eureka;

--
-- Name: iva_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE iva_id_seq OWNED BY iva.id;


--
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
    proyecto_partida_id bigint NOT NULL,
    fecha_estimada date
);


ALTER TABLE public.presupuesto_productos OWNER TO eureka;

--
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- Name: COLUMN presupuesto_productos.fecha_estimada; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.fecha_estimada IS 'Fecha estimada de adquisición o contratación';


--
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
-- Name: TABLE productos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE productos IS 'productos segun la convencion de las naciones unidas';


--
-- Name: COLUMN productos.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.producto_id IS 'identificador unico del producto';


--
-- Name: COLUMN productos.cod_segmento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_segmento IS 'segmento del codigo de las naciones unidas';


--
-- Name: COLUMN productos.cod_familia; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_familia IS 'familia del codigo de las naciones unidas';


--
-- Name: COLUMN productos.cod_clase; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_clase IS 'clase del codigo de las naciones unidas';


--
-- Name: COLUMN productos.cod_producto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN productos.cod_producto IS 'codigo del producto de las naciones unidas';


--
-- Name: monto_por_prod; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW monto_por_prod AS
 SELECT sum(a.monto_presupuesto) AS monto_pretot,
    b.nombre,
    a.producto_id,
    b.cod_segmento,
    b.cod_familia,
    b.cod_clase,
    b.cod_producto
   FROM (presupuesto_productos a
     JOIN productos b ON ((a.producto_id = b.producto_id)))
  GROUP BY a.producto_id, b.nombre, b.cod_segmento, b.cod_familia, b.cod_clase, b.cod_producto
  ORDER BY sum(a.monto_presupuesto) DESC;


ALTER TABLE public.monto_por_prod OWNER TO eureka;

--
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
-- Name: partidas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE partidas (
    partida_id bigint DEFAULT nextval('partida_id_seq'::regclass) NOT NULL,
    p1 numeric(4,0) NOT NULL,
    p2 numeric(4,0) NOT NULL,
    p3 numeric(4,0) NOT NULL,
    p4 numeric(4,0) NOT NULL,
    nombre text NOT NULL,
    habilitada boolean DEFAULT true NOT NULL
);


ALTER TABLE public.partidas OWNER TO eureka;

--
-- Name: TABLE partidas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE partidas IS 'partidas presupuestarias disponibles';


--
-- Name: COLUMN partidas.partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.partida_id IS 'identificador unico de la partida';


--
-- Name: COLUMN partidas.p1; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p1 IS 'partida';


--
-- Name: COLUMN partidas.p2; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p2 IS 'partida generica';


--
-- Name: COLUMN partidas.p3; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p3 IS 'partida especifica';


--
-- Name: COLUMN partidas.p4; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.p4 IS 'partida sub especifica';


--
-- Name: COLUMN partidas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.nombre IS 'nombre de la partida';


--
-- Name: COLUMN partidas.habilitada; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partidas.habilitada IS 'Operador Lógico que indica si la partida se encuentra habilitada para su uso';


--
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
    presupuesto_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.presupuesto_partidas OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partidas.presupuesto_partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.presupuesto_partida_id IS 'identificador unico ';


--
-- Name: COLUMN presupuesto_partidas.partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- Name: COLUMN presupuesto_partidas.monto_presupuestado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- Name: COLUMN presupuesto_partidas.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN presupuesto_partidas.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
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
-- Name: unidades; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE unidades (
    unidad_id bigint DEFAULT nextval('unidad_id_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.unidades OWNER TO eureka;

--
-- Name: COLUMN unidades.unidad_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN unidades.unidad_id IS 'identificador unico de la tabla';


--
-- Name: COLUMN unidades.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN unidades.nombre IS 'descripcion de la unidad';


--
-- Name: organo_ente_partidas_productos_full; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW organo_ente_partidas_productos_full AS
 SELECT DISTINCT h.nombre AS ente_rector,
    c.nombre AS ente_organo,
    f.nombre AS descipcion_partida,
    ((((((f.p1 || '-'::text) || lpad((f.p2)::text, 2, '0'::text)) || '-'::text) || lpad((f.p3)::text, 2, '0'::text)) || '-'::text) || lpad((f.p4)::text, 2, '0'::text)) AS cod_partida,
    replace((round(b.monto_presupuestado, 2))::text, '.'::text, ','::text) AS monto_presupuesto,
    (((((((d.cod_segmento)::text || '-'::text) || (d.cod_familia)::text) || '-'::text) || (d.cod_clase)::text) || '-'::text) || (d.cod_producto)::text) AS codigo_producto,
    d.nombre AS producto,
    e.nombre AS unidad,
    a.cantidad,
    replace((round(a.costo_unidad, 2))::text, '.'::text, ','::text) AS costo_unitario,
    replace((round(a.monto_presupuesto, 2))::text, '.'::text, ','::text) AS monto_total,
    h.ente_organo_id
   FROM (((((((presupuesto_productos a
     FULL JOIN presupuesto_partidas b ON ((b.presupuesto_partida_id = a.proyecto_partida_id)))
     FULL JOIN entes_organos c ON ((c.ente_organo_id = b.ente_organo_id)))
     FULL JOIN productos d ON ((d.producto_id = a.producto_id)))
     FULL JOIN unidades e ON ((e.unidad_id = a.unidad_id)))
     FULL JOIN partidas f ON ((f.partida_id = b.partida_id)))
     JOIN entes_adscritos g ON (((g.ente_organo_id = b.ente_organo_id) OR (g.padre_id = b.ente_organo_id))))
     FULL JOIN entes_organos h ON ((h.ente_organo_id = g.padre_id)))
  WHERE (c.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint]))
  ORDER BY h.nombre, c.nombre, ((((((f.p1 || '-'::text) || lpad((f.p2)::text, 2, '0'::text)) || '-'::text) || lpad((f.p3)::text, 2, '0'::text)) || '-'::text) || lpad((f.p4)::text, 2, '0'::text));


ALTER TABLE public.organo_ente_partidas_productos_full OWNER TO eureka;

--
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
-- Name: TABLE partida_productos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE partida_productos IS 'tabla que contiene los productos que pueden ser asociados a cada partida';


--
-- Name: COLUMN partida_productos.partida_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.partida_id IS 'clave foranea que referencia a una partida';


--
-- Name: COLUMN partida_productos.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN partida_productos.tipo_operacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.tipo_operacion IS 'este campo indica si se realiza una compra o una venta, puede tomar los valores C= compras y V = venta';


--
-- Name: COLUMN partida_productos.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN partida_productos.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- Name: COLUMN partida_productos.partida_producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN partida_productos.partida_producto_id IS 'identificador unico de una relacion partida-producto';


--
-- Name: partida_presupuesto_prod; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW partida_presupuesto_prod AS
 SELECT a.partida_id,
    a.p1,
    a.p2,
    a.p3,
    a.p4,
    b.producto_id,
    c.monto_presupuesto,
    d.nombre
   FROM (((partidas a
     JOIN partida_productos b ON ((a.partida_id = b.partida_id)))
     JOIN presupuesto_productos c ON ((c.producto_id = b.producto_id)))
     JOIN productos d ON ((d.producto_id = c.producto_id)))
  ORDER BY a.p1, a.p2, a.p3, a.p4;


ALTER TABLE public.partida_presupuesto_prod OWNER TO eureka;

--
-- Name: partidas_productos2; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW partidas_productos2 AS
 SELECT a.partida_id,
    a.p1,
    a.p2,
    a.p3,
    a.p4,
    a.nombre,
    b.producto_id,
    b.tipo_operacion,
    b.partida_producto_id,
    c.nombre AS nombre_prod,
    c.cod_segmento,
    c.cod_familia,
    c.cod_clase,
    c.cod_producto
   FROM ((partidas a
     JOIN partida_productos b ON ((a.partida_id = b.partida_id)))
     JOIN productos c ON ((b.producto_id = c.producto_id)));


ALTER TABLE public.partidas_productos2 OWNER TO eureka;

--
-- Name: rnce_partidas; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_partidas AS
 SELECT p.partida_id,
    p.p1,
    p.p2,
    p.p3,
    p.p4,
    p.nombre
   FROM partidas p
  WHERE ((p.p1 = ANY (ARRAY[(402)::numeric, (403)::numeric, (404)::numeric])) OR (((p.p1 = (401)::numeric) AND (p.p2 = (7)::numeric)) AND (p.p3 = ANY (ARRAY[(8)::numeric, (10)::numeric, (24)::numeric, (26)::numeric, (58)::numeric, (69)::numeric, (81)::numeric, (83)::numeric]))));


ALTER TABLE public.rnce_partidas OWNER TO eureka;

--
-- Name: presupuesto_aprobado_entes_organos; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW presupuesto_aprobado_entes_organos AS
 SELECT sum(b.monto_presupuestado) AS presupuesto_aprobado_rnce,
    b.ente_organo_id,
    c.nombre AS nombre_ente_organo
   FROM ((rnce_partidas a
     JOIN presupuesto_partidas b USING (partida_id))
     JOIN entes_organos c USING (ente_organo_id))
  GROUP BY b.ente_organo_id, c.nombre
  ORDER BY sum(b.monto_presupuestado) DESC;


ALTER TABLE public.presupuesto_aprobado_entes_organos OWNER TO eureka;

--
-- Name: presupuesto_importacion; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
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


ALTER TABLE public.presupuesto_importacion OWNER TO eureka;

--
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- Name: COLUMN presupuesto_importacion.producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.producto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- Name: presupuesto_importados_entes_organos; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW presupuesto_importados_entes_organos AS
 SELECT sum(a.monto_presupuesto) AS presupuesto_importados_rnce,
    b.ente_organo_id,
    c.nombre AS nombre_ente_organo,
    d.nombre AS producto,
    e.nombre AS divisa
   FROM ((((presupuesto_importacion a
     JOIN presupuesto_partidas b USING (presupuesto_partida_id))
     JOIN entes_organos c USING (ente_organo_id))
     JOIN productos d USING (producto_id))
     JOIN divisas e USING (divisa_id))
  WHERE (b.ente_organo_id <> 12615)
  GROUP BY b.ente_organo_id, c.nombre, d.nombre, e.nombre
  ORDER BY sum(a.monto_presupuesto) DESC;


ALTER TABLE public.presupuesto_importados_entes_organos OWNER TO eureka;

--
-- Name: presupuesto_partida_proyecto; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_proyecto (
    proyecto_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE public.presupuesto_partida_proyecto OWNER TO eureka;

--
-- Name: presupuesto_productos_entes_organos; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW presupuesto_productos_entes_organos AS
 SELECT sum(a.monto_presupuesto) AS presupuesto_productos_rnce,
    b.ente_organo_id,
    c.nombre AS nombre_ente_organo
   FROM ((presupuesto_productos a
     JOIN presupuesto_partidas b ON ((a.proyecto_partida_id = b.presupuesto_partida_id)))
     JOIN entes_organos c USING (ente_organo_id))
  GROUP BY b.ente_organo_id, c.nombre
  ORDER BY sum(a.monto_presupuesto) DESC;


ALTER TABLE public.presupuesto_productos_entes_organos OWNER TO eureka;

--
-- Name: presupuesto_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presupuesto_seq OWNER TO eureka;

--
-- Name: presupuestos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuestos (
    presupuesto_id bigint DEFAULT nextval('presupuesto_seq'::regclass) NOT NULL,
    ahno bigint NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.presupuestos OWNER TO eureka;

--
-- Name: procedimientos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE procedimientos (
    id integer NOT NULL,
    num_contrato character varying(255) NOT NULL,
    anho integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    tipo character varying(255) NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE public.procedimientos OWNER TO eureka;

--
-- Name: TABLE procedimientos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE procedimientos IS 'Procedimiento: orden o servicio que le da pie a la carga de una factura en el módulo de rendición de cuentas.';


--
-- Name: COLUMN procedimientos.num_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN procedimientos.num_contrato IS 'Es el modulo donde se carga el Nº de contrato, orden de servicio u orden de compra que le da inicio al proceso de adquisición o contratación.';


--
-- Name: COLUMN procedimientos.anho; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN procedimientos.anho IS 'Año de carga del procedimiento';


--
-- Name: COLUMN procedimientos.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN procedimientos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN procedimientos.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN procedimientos.tipo IS 'Tipo de procedimientos, si es una obra, un servicio o compra';


--
-- Name: COLUMN procedimientos.ente_organo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN procedimientos.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: procedimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE procedimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.procedimientos_id_seq OWNER TO eureka;

--
-- Name: procedimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE procedimientos_id_seq OWNED BY procedimientos.id;


--
-- Name: proveedores; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE proveedores (
    id integer NOT NULL,
    rif character varying(10) NOT NULL,
    razon_social character varying(255) NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE public.proveedores OWNER TO eureka;

--
-- Name: TABLE proveedores; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE proveedores IS 'Proveedores del modulo de rendición de cuentas';


--
-- Name: COLUMN proveedores.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proveedores.rif IS 'RIF del proveedor (Formato: X123456789) Mismo formato que el Sistema de RNC';


--
-- Name: COLUMN proveedores.razon_social; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proveedores.razon_social IS 'Razon social del proveedor';


--
-- Name: COLUMN proveedores.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proveedores.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN proveedores.ente_organo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proveedores.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE proveedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedores_id_seq OWNER TO eureka;

--
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE proveedores_id_seq OWNED BY proveedores.id;


--
-- Name: recurrencia_partidas; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW recurrencia_partidas AS
 SELECT count(partida_presupuesto_prod.partida_id) AS partida_recurrent,
    partida_presupuesto_prod.p1,
    partida_presupuesto_prod.p2,
    partida_presupuesto_prod.p3,
    partida_presupuesto_prod.p4
   FROM partida_presupuesto_prod
  GROUP BY partida_presupuesto_prod.p1, partida_presupuesto_prod.p2, partida_presupuesto_prod.p3, partida_presupuesto_prod.p4
  ORDER BY count(partida_presupuesto_prod.partida_id) DESC;


ALTER TABLE public.recurrencia_partidas OWNER TO eureka;

--
-- Name: rnce_conex_dia; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_conex_dia AS
 SELECT count(date(user_login_attempts.performed_on)) AS conexiones,
    date(user_login_attempts.performed_on) AS fecha
   FROM user_login_attempts
  WHERE ((user_login_attempts.is_successful = true) AND (user_login_attempts.user_id <> ALL (ARRAY[1478, 1372, 1339, 1545])))
  GROUP BY date(user_login_attempts.performed_on)
  ORDER BY date(user_login_attempts.performed_on);


ALTER TABLE public.rnce_conex_dia OWNER TO eureka;

--
-- Name: rnce_conexiones_dia; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_conexiones_dia AS
 SELECT count(date(user_login_attempts.performed_on)) AS conexiones,
    date(user_login_attempts.performed_on) AS fecha
   FROM user_login_attempts
  WHERE ((user_login_attempts.is_successful = true) AND (user_login_attempts.user_id <> ALL (ARRAY[1478, 1372, 1339, 1545, 1634])))
  GROUP BY date(user_login_attempts.performed_on)
  ORDER BY date(user_login_attempts.performed_on);


ALTER TABLE public.rnce_conexiones_dia OWNER TO eureka;

--
-- Name: rnce_entes_organos_cargaron; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_entes_organos_cargaron AS
 SELECT DISTINCT c.ente_organo_id,
    c.codigo_onapre,
    c.nombre,
    c.rif
   FROM ((presupuesto_partidas a
     JOIN presupuesto_productos b ON ((a.presupuesto_partida_id = b.proyecto_partida_id)))
     JOIN entes_organos c ON ((a.ente_organo_id = c.ente_organo_id)))
  WHERE (c.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint, (12619)::bigint]))
  ORDER BY c.codigo_onapre;


ALTER TABLE public.rnce_entes_organos_cargaron OWNER TO eureka;

--
-- Name: rnce_importaciones; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_importaciones AS
 SELECT replace(to_char(sum(a.monto_presupuesto), '999999999990D99'::text), '.'::text, ','::text) AS presupuesto_importacion,
    a.descripcion,
    c.nombre AS nombre_ente_organo,
    d.nombre AS producto,
    e.nombre AS divisa,
    f.codigo_ncm_nivel_1,
    f.codigo_ncm_nivel_2,
    f.codigo_ncm_nivel_3,
    f.codigo_ncm_nivel_4
   FROM (((((presupuesto_importacion a
     JOIN presupuesto_partidas b USING (presupuesto_partida_id))
     JOIN entes_organos c USING (ente_organo_id))
     JOIN productos d USING (producto_id))
     JOIN divisas e USING (divisa_id))
     JOIN codigos_ncm f USING (codigo_ncm_id))
  WHERE (b.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint, (12619)::bigint]))
  GROUP BY b.ente_organo_id, c.nombre, d.nombre, e.nombre, a.descripcion, f.codigo_ncm_nivel_1, f.codigo_ncm_nivel_2, f.codigo_ncm_nivel_3, f.codigo_ncm_nivel_4
  ORDER BY e.nombre, sum(a.monto_presupuesto) DESC;


ALTER TABLE public.rnce_importaciones OWNER TO eureka;

--
-- Name: rnce_porcentaje_carga; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_porcentaje_carga AS
 SELECT DISTINCT d.nombre AS ente_rector,
    a.nombre_ente_organo,
    replace((round(a.presupuesto_aprobado_rnce, 2))::text, '.'::text, ','::text) AS presupuesto_aprobado,
    replace((round(b.presupuesto_productos_rnce, 2))::text, '.'::text, ','::text) AS presupuesto_productos,
    replace((round((a.presupuesto_aprobado_rnce - b.presupuesto_productos_rnce), 2))::text, '.'::text, ','::text) AS presupuesto_resta,
    round(((b.presupuesto_productos_rnce / a.presupuesto_aprobado_rnce) * (100)::numeric), 0) AS porcentaje_cargado
   FROM (((presupuesto_aprobado_entes_organos a
     FULL JOIN presupuesto_productos_entes_organos b USING (ente_organo_id))
     FULL JOIN entes_adscritos c(padre_id, ente_organo_id_1, fecha_desde, fecha_hasta, ente_adscrito_id) ON (((c.padre_id = b.ente_organo_id) OR (c.ente_organo_id_1 = b.ente_organo_id))))
     FULL JOIN entes_organos d(ente_organo_id_1, codigo_onapre, nombre, tipo, rif, creado_por) ON ((d.ente_organo_id_1 = c.padre_id)))
  WHERE (a.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint, (12619)::bigint]))
  ORDER BY round(((b.presupuesto_productos_rnce / a.presupuesto_aprobado_rnce) * (100)::numeric), 0) DESC;


ALTER TABLE public.rnce_porcentaje_carga OWNER TO eureka;

--
-- Name: rnce_presup_porcent; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_presup_porcent AS
 SELECT a.nombre_ente_organo,
    replace((a.presupuesto_aprobado_rnce)::text, '.'::text, ','::text) AS presupuesto_aprobado,
    replace((b.presupuesto_productos_rnce)::text, '.'::text, ','::text) AS presupuesto_productos,
    replace(((a.presupuesto_aprobado_rnce - b.presupuesto_productos_rnce))::text, '.'::text, ','::text) AS presupuesto_resta,
    (round(((b.presupuesto_productos_rnce / a.presupuesto_aprobado_rnce) * (100)::numeric), 0) || '%'::text) AS porcentaje_cargado
   FROM (presupuesto_aprobado_entes_organos a
     JOIN presupuesto_productos_entes_organos b USING (ente_organo_id))
  WHERE (a.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint]))
  ORDER BY round(((b.presupuesto_productos_rnce / a.presupuesto_aprobado_rnce) * (100)::numeric), 0) DESC;


ALTER TABLE public.rnce_presup_porcent OWNER TO eureka;

--
-- Name: rnce_presupuesto_ente_organo; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_presupuesto_ente_organo AS
 SELECT replace((round(sum(a.monto_presupuesto), 2))::text, '.'::text, ','::text) AS presupuesto_productos,
    c.nombre AS ente_organo
   FROM ((presupuesto_productos a
     JOIN presupuesto_partidas b ON ((a.proyecto_partida_id = b.presupuesto_partida_id)))
     JOIN entes_organos c USING (ente_organo_id))
  GROUP BY b.ente_organo_id, c.nombre
  ORDER BY sum(a.monto_presupuesto) DESC;


ALTER TABLE public.rnce_presupuesto_ente_organo OWNER TO eureka;

--
-- Name: rnce_presupuesto_partida; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_presupuesto_partida AS
 SELECT replace((round(sum(a.monto_presupuesto), 2))::text, '.'::text, ','::text) AS total_partida,
    ((((((c.p1 || '-'::text) || lpad((c.p2)::text, 2, '0'::text)) || '-'::text) || lpad((c.p3)::text, 2, '0'::text)) || '-'::text) || lpad((c.p4)::text, 2, '0'::text)) AS cod_presupuesto,
    c.nombre AS concepto_partida
   FROM ((presupuesto_productos a
     JOIN presupuesto_partidas b ON ((a.proyecto_partida_id = b.presupuesto_partida_id)))
     JOIN rnce_partidas c USING (partida_id))
  GROUP BY b.partida_id, c.p1, c.p2, c.p3, c.p4, c.nombre
  ORDER BY b.partida_id;


ALTER TABLE public.rnce_presupuesto_partida OWNER TO eureka;

--
-- Name: rnce_productos_financiamiento; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_productos_financiamiento AS
 SELECT count(c.fuente_id) AS cantidad_productos,
    c.fuente_id,
    d.nombre AS fuente_financiamiento
   FROM ((((presupuesto_productos a
     JOIN presupuesto_partidas b ON ((a.proyecto_partida_id = b.presupuesto_partida_id)))
     JOIN fuente_presupuesto c ON ((b.presupuesto_partida_id = c.presupuesto_partida_id)))
     JOIN fuentes_financiamiento d ON ((c.fuente_id = d.fuente_financiamiento_id)))
     JOIN productos e USING (producto_id))
  WHERE (b.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint, (12619)::bigint]))
  GROUP BY d.nombre, c.fuente_id
  ORDER BY count(c.fuente_id) DESC;


ALTER TABLE public.rnce_productos_financiamiento OWNER TO eureka;

--
-- Name: rnce_productos_montos_var; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_productos_montos_var AS
 SELECT (((((((b.cod_segmento)::text || '-'::text) || (b.cod_familia)::text) || '-'::text) || (b.cod_clase)::text) || '-'::text) || (b.cod_producto)::text) AS codigo_producto,
    b.nombre AS nombre_producto,
    c.nombre AS unidad_medida,
    sum(a.cantidad) AS cantidad_total,
    replace((round(sum(a.monto_presupuesto), 2))::text, '.'::text, ','::text) AS monto_total,
    replace((round(avg(a.costo_unidad), 2))::text, '.'::text, ','::text) AS precio_unidad_promedio,
    replace((round(max(a.costo_unidad), 2))::text, '.'::text, ','::text) AS precio_unidad_maximo,
    replace((round(min(a.costo_unidad), 2))::text, '.'::text, ','::text) AS precio_unidad_minimo
   FROM (((presupuesto_productos a
     JOIN productos b ON ((a.producto_id = b.producto_id)))
     JOIN unidades c ON ((a.unidad_id = c.unidad_id)))
     JOIN presupuesto_partidas d ON ((a.proyecto_partida_id = d.presupuesto_partida_id)))
  WHERE (d.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint, (12619)::bigint]))
  GROUP BY c.nombre, a.unidad_id, a.producto_id, b.nombre, b.cod_segmento, b.cod_familia, b.cod_clase, b.cod_producto
  ORDER BY sum(a.monto_presupuesto) DESC;


ALTER TABLE public.rnce_productos_montos_var OWNER TO eureka;

--
-- Name: rnce_recurrencia_productos; Type: VIEW; Schema: public; Owner: eureka
--

CREATE VIEW rnce_recurrencia_productos AS
 SELECT count(a.producto_id) AS recurrencia,
    b.nombre AS producto,
    (((((((b.cod_segmento)::text || '-'::text) || (b.cod_familia)::text) || '-'::text) || (b.cod_clase)::text) || '-'::text) || (b.cod_producto)::text) AS codigo_producto
   FROM ((presupuesto_productos a
     JOIN productos b ON ((a.producto_id = b.producto_id)))
     JOIN presupuesto_partidas c ON ((a.proyecto_partida_id = c.presupuesto_partida_id)))
  WHERE (c.ente_organo_id <> ALL (ARRAY[(12615)::bigint, (12616)::bigint, (12617)::bigint, (12618)::bigint, (12619)::bigint]))
  GROUP BY a.producto_id, b.nombre, b.cod_segmento, b.cod_familia, b.cod_clase, b.cod_producto
  ORDER BY count(a.producto_id) DESC;


ALTER TABLE public.rnce_recurrencia_productos OWNER TO eureka;

--
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
-- Name: tasas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE tasas (
    divisa_id bigint NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    tasa numeric(20,4) NOT NULL,
    tasa_id bigint DEFAULT nextval('tasa_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.tasas OWNER TO eureka;

--
-- Name: TABLE tasas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE tasas IS 'Tabla que almacena el historico de las tasas';


--
-- Name: COLUMN tasas.fecha_desde; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN tasas.fecha_desde IS 'fecha desde la cual es valida la tasa';


--
-- Name: COLUMN tasas.fecha_hasta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN tasas.fecha_hasta IS 'fecha hasta la cual es valida';


--
-- Name: COLUMN tasas.tasa; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN tasas.tasa IS 'Tasa de intercambio  vigente de una divisa';


--
-- Name: COLUMN tasas.tasa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN tasas.tasa_id IS 'Identificador unico de la tasa';


--
-- Name: tbl_migration; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE tbl_migration (
    version character varying(255) NOT NULL,
    apply_time integer
);


ALTER TABLE public.tbl_migration OWNER TO eureka;

--
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
-- Name: user_used_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE user_used_passwords_id_seq OWNED BY user_used_passwords.id;


--
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
-- Name: usuarios; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE usuarios (
    usuario_id bigint DEFAULT nextval('usuarios_usuario_id_seq'::regclass) NOT NULL,
    usuario character varying(255) NOT NULL,
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
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE usuarios IS 'Tabla de usuarios';


--
-- Name: COLUMN usuarios.usuario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.usuario IS 'Nombre de usuario del ente u organismo';


--
-- Name: COLUMN usuarios.contrasena; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.contrasena IS 'Contraseña del usuario';


--
-- Name: COLUMN usuarios.correo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.correo IS 'Correo del usuario';


--
-- Name: COLUMN usuarios.creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.creado_el IS 'Fecha de creación de la cuenta';


--
-- Name: COLUMN usuarios.actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.actualizado_el IS 'Fecha de actualización de la cuenta';


--
-- Name: COLUMN usuarios.ente_organo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN usuarios.ente_organo_id IS 'clave foranea';


SET search_path = trimestre1, pg_catalog;

--
-- Name: accion_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.accion_id_seq OWNER TO eureka;

--
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.codigo_ncm_id_seq OWNER TO eureka;

--
-- Name: divisa_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE divisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.divisa_id_seq OWNER TO eureka;

--
-- Name: ente_adscrito_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE ente_adscrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.ente_adscrito_id_seq OWNER TO eureka;

--
-- Name: ente_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.ente_id_seq OWNER TO eureka;

--
-- Name: facturas; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas (
    id integer NOT NULL,
    num_factura character varying(255) NOT NULL,
    anho integer,
    proveedor_id integer NOT NULL,
    procedimiento_id integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    fecha_factura date,
    ente_organo_id integer NOT NULL,
    cierre_carga boolean
);


ALTER TABLE trimestre1.facturas OWNER TO eureka;

--
-- Name: TABLE facturas; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON TABLE facturas IS 'Factura del modulo de rendición de cuentas';


--
-- Name: COLUMN facturas.num_factura; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.num_factura IS 'Número de factura.';


--
-- Name: COLUMN facturas.anho; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.anho IS 'Año en que se cargo la factura';


--
-- Name: COLUMN facturas.proveedor_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foránea a la tabla Proveedores';


--
-- Name: COLUMN facturas.procedimiento_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.procedimiento_id IS 'Clave foránea a la tabla Procedimientos';


--
-- Name: COLUMN facturas.fecha; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas.fecha_factura; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_factura IS 'Fecha de emisióin de la factura';


--
-- Name: COLUMN facturas.ente_organo_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: COLUMN facturas.cierre_carga; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas.cierre_carga IS 'Indica si se finalizó la carga de la  Factura.';


--
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.facturas_id_seq OWNER TO eureka;

--
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre1; Owner: eureka
--

ALTER SEQUENCE facturas_id_seq OWNED BY facturas.id;


--
-- Name: facturas_productos; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas_productos (
    id integer NOT NULL,
    factura_id integer NOT NULL,
    producto_id integer NOT NULL,
    costo_unitario numeric(38,6) NOT NULL,
    cantidad_adquirida integer,
    iva_id integer,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    presupuesto_partida_id integer NOT NULL
);


ALTER TABLE trimestre1.facturas_productos OWNER TO eureka;

--
-- Name: COLUMN facturas_productos.factura_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.factura_id IS 'Factura a la cual esta asociado el producto.';


--
-- Name: COLUMN facturas_productos.producto_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.producto_id IS 'Clave foranea a la tabla productos';


--
-- Name: COLUMN facturas_productos.costo_unitario; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.costo_unitario IS 'Costo unitario del producto';


--
-- Name: COLUMN facturas_productos.cantidad_adquirida; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.cantidad_adquirida IS 'Cantidad del producto adquirido en la factura';


--
-- Name: COLUMN facturas_productos.iva_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.iva_id IS 'Clave foránea a la tabla IVA';


--
-- Name: COLUMN facturas_productos.fecha; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas_productos.presupuesto_partida_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.presupuesto_partida_id IS 'Clave foranea a la tabla Presupuesto_partida';


--
-- Name: facturas_productos_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE facturas_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.facturas_productos_id_seq OWNER TO eureka;

--
-- Name: facturas_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre1; Owner: eureka
--

ALTER SEQUENCE facturas_productos_id_seq OWNED BY facturas_productos.id;


--
-- Name: fuente_financiamiento_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE fuente_financiamiento_id_seq
    START WITH 3000
    INCREMENT BY 1
    MINVALUE 3000
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.fuente_financiamiento_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE fuente_presupuesto (
    id integer NOT NULL,
    fuente_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    monto numeric(38,6),
    fecha_registro date DEFAULT now() NOT NULL
);


ALTER TABLE trimestre1.fuente_presupuesto OWNER TO eureka;

--
-- Name: COLUMN fuente_presupuesto.monto; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.monto IS 'Monto asignado de la fuente de financiamiento';


--
-- Name: COLUMN fuente_presupuesto.fecha_registro; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.fecha_registro IS 'Fecha del momento que se asigna el monto y la fuente de financiamiento al proyecto o accion.';


--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE fuente_presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.fuente_presupuesto_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre1; Owner: eureka
--

ALTER SEQUENCE fuente_presupuesto_id_seq OWNED BY fuente_presupuesto.id;


--
-- Name: partida_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.partida_id_seq OWNER TO eureka;

--
-- Name: partida_producto_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE partida_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.partida_producto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.presupuesto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_importacion; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
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


ALTER TABLE trimestre1.presupuesto_importacion OWNER TO eureka;

--
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- Name: COLUMN presupuesto_importacion.producto_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.producto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- Name: presupuesto_partida_acciones; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_acciones (
    accion_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    codigo_accion character varying(100) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_accion_padre bigint,
    anho integer NOT NULL
);


ALTER TABLE trimestre1.presupuesto_partida_acciones OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partida_acciones.anho; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partida_acciones.anho IS 'Año de presupuesto carga de la acción';


--
-- Name: presupuesto_partida_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE presupuesto_partida_id_seq
    START WITH 100000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.presupuesto_partida_id_seq OWNER TO eureka;

--
-- Name: presupuesto_partida_proyecto; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_proyecto (
    proyecto_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE trimestre1.presupuesto_partida_proyecto OWNER TO eureka;

--
-- Name: presupuesto_partidas; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
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
    presupuesto_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE trimestre1.presupuesto_partidas OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partidas.presupuesto_partida_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.presupuesto_partida_id IS 'identificador unico ';


--
-- Name: COLUMN presupuesto_partidas.partida_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- Name: COLUMN presupuesto_partidas.monto_presupuestado; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- Name: COLUMN presupuesto_partidas.fecha_desde; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN presupuesto_partidas.fecha_hasta; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- Name: presupuesto_productos; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
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
    proyecto_partida_id bigint NOT NULL,
    fecha_estimada date
);


ALTER TABLE trimestre1.presupuesto_productos OWNER TO eureka;

--
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- Name: COLUMN presupuesto_productos.fecha_estimada; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.fecha_estimada IS 'Fecha estimada de adquisición o contratación';


--
-- Name: presupuesto_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.presupuesto_seq OWNER TO eureka;

--
-- Name: procedimientos; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE procedimientos (
    id integer NOT NULL,
    num_contrato character varying(255) NOT NULL,
    anho integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    tipo character varying(255) NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre1.procedimientos OWNER TO eureka;

--
-- Name: TABLE procedimientos; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON TABLE procedimientos IS 'Procedimiento: orden o servicio que le da pie a la carga de una factura en el módulo de rendición de cuentas.';


--
-- Name: COLUMN procedimientos.num_contrato; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN procedimientos.num_contrato IS 'Es el modulo donde se carga el Nº de contrato, orden de servicio u orden de compra que le da inicio al proceso de adquisición o contratación.';


--
-- Name: COLUMN procedimientos.anho; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN procedimientos.anho IS 'Año de carga del procedimiento';


--
-- Name: COLUMN procedimientos.fecha; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN procedimientos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN procedimientos.tipo; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN procedimientos.tipo IS 'Tipo de procedimientos, si es una obra, un servicio o compra';


--
-- Name: COLUMN procedimientos.ente_organo_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN procedimientos.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: procedimientos_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE procedimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.procedimientos_id_seq OWNER TO eureka;

--
-- Name: procedimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre1; Owner: eureka
--

ALTER SEQUENCE procedimientos_id_seq OWNED BY procedimientos.id;


--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.producto_id_seq OWNER TO eureka;

--
-- Name: proveedores; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE proveedores (
    id integer NOT NULL,
    rif character varying(10) NOT NULL,
    razon_social character varying(255) NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre1.proveedores OWNER TO eureka;

--
-- Name: TABLE proveedores; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON TABLE proveedores IS 'Proveedores del modulo de rendición de cuentas';


--
-- Name: COLUMN proveedores.rif; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proveedores.rif IS 'RIF del proveedor (Formato: X123456789) Mismo formato que el Sistema de RNC';


--
-- Name: COLUMN proveedores.razon_social; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proveedores.razon_social IS 'Razon social del proveedor';


--
-- Name: COLUMN proveedores.fecha; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proveedores.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN proveedores.ente_organo_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proveedores.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE proveedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.proveedores_id_seq OWNER TO eureka;

--
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre1; Owner: eureka
--

ALTER SEQUENCE proveedores_id_seq OWNED BY proveedores.id;


--
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.proyecto_id_seq OWNER TO eureka;

--
-- Name: proyectos; Type: TABLE; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE TABLE proyectos (
    proyecto_id bigint DEFAULT nextval('proyecto_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_padre character varying(20),
    anho integer NOT NULL
);


ALTER TABLE trimestre1.proyectos OWNER TO eureka;

--
-- Name: TABLE proyectos; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON TABLE proyectos IS 'proyectos o acciones centralizadas';


--
-- Name: COLUMN proyectos.proyecto_id; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proyectos.proyecto_id IS 'identificador unico del proyecto';


--
-- Name: COLUMN proyectos.nombre; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proyectos.nombre IS 'nombre del proyecto o accion centralizada';


--
-- Name: COLUMN proyectos.codigo; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proyectos.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- Name: COLUMN proyectos.anho; Type: COMMENT; Schema: trimestre1; Owner: eureka
--

COMMENT ON COLUMN proyectos.anho IS 'Año de presupuesto carga del proyecto';


--
-- Name: tasa_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE tasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.tasa_id_seq OWNER TO eureka;

--
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.unidad_id_seq OWNER TO eureka;

--
-- Name: user_login_attempts_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE user_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.user_login_attempts_id_seq OWNER TO eureka;

--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: trimestre1; Owner: eureka
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre1.usuarios_usuario_id_seq OWNER TO eureka;

SET search_path = trimestre2, pg_catalog;

--
-- Name: accion_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.accion_id_seq OWNER TO eureka;

--
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.codigo_ncm_id_seq OWNER TO eureka;

--
-- Name: divisa_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE divisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.divisa_id_seq OWNER TO eureka;

--
-- Name: ente_adscrito_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE ente_adscrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.ente_adscrito_id_seq OWNER TO eureka;

--
-- Name: ente_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.ente_id_seq OWNER TO eureka;

--
-- Name: facturas; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas (
    id integer NOT NULL,
    num_factura character varying(255) NOT NULL,
    anho integer,
    proveedor_id integer NOT NULL,
    procedimiento_id integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    fecha_factura date,
    ente_organo_id integer NOT NULL,
    cierre_carga boolean
);


ALTER TABLE trimestre2.facturas OWNER TO eureka;

--
-- Name: TABLE facturas; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON TABLE facturas IS 'Factura del modulo de rendición de cuentas';


--
-- Name: COLUMN facturas.num_factura; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.num_factura IS 'Número de factura.';


--
-- Name: COLUMN facturas.anho; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.anho IS 'Año en que se cargo la factura';


--
-- Name: COLUMN facturas.proveedor_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foránea a la tabla Proveedores';


--
-- Name: COLUMN facturas.procedimiento_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.procedimiento_id IS 'Clave foránea a la tabla Procedimientos';


--
-- Name: COLUMN facturas.fecha; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas.fecha_factura; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_factura IS 'Fecha de emisióin de la factura';


--
-- Name: COLUMN facturas.ente_organo_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: COLUMN facturas.cierre_carga; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas.cierre_carga IS 'Indica si se finalizó la carga de la  Factura.';


--
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.facturas_id_seq OWNER TO eureka;

--
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre2; Owner: eureka
--

ALTER SEQUENCE facturas_id_seq OWNED BY facturas.id;


--
-- Name: facturas_productos; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas_productos (
    id integer NOT NULL,
    factura_id integer NOT NULL,
    producto_id integer NOT NULL,
    costo_unitario numeric(38,6) NOT NULL,
    cantidad_adquirida integer,
    iva_id integer,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    presupuesto_partida_id integer NOT NULL
);


ALTER TABLE trimestre2.facturas_productos OWNER TO eureka;

--
-- Name: COLUMN facturas_productos.factura_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.factura_id IS 'Factura a la cual esta asociado el producto.';


--
-- Name: COLUMN facturas_productos.producto_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.producto_id IS 'Clave foranea a la tabla productos';


--
-- Name: COLUMN facturas_productos.costo_unitario; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.costo_unitario IS 'Costo unitario del producto';


--
-- Name: COLUMN facturas_productos.cantidad_adquirida; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.cantidad_adquirida IS 'Cantidad del producto adquirido en la factura';


--
-- Name: COLUMN facturas_productos.iva_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.iva_id IS 'Clave foránea a la tabla IVA';


--
-- Name: COLUMN facturas_productos.fecha; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas_productos.presupuesto_partida_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.presupuesto_partida_id IS 'Clave foranea a la tabla Presupuesto_partida';


--
-- Name: facturas_productos_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE facturas_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.facturas_productos_id_seq OWNER TO eureka;

--
-- Name: facturas_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre2; Owner: eureka
--

ALTER SEQUENCE facturas_productos_id_seq OWNED BY facturas_productos.id;


--
-- Name: fuente_financiamiento_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE fuente_financiamiento_id_seq
    START WITH 3000
    INCREMENT BY 1
    MINVALUE 3000
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.fuente_financiamiento_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE fuente_presupuesto (
    id integer NOT NULL,
    fuente_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    monto numeric(38,6),
    fecha_registro date DEFAULT now() NOT NULL
);


ALTER TABLE trimestre2.fuente_presupuesto OWNER TO eureka;

--
-- Name: COLUMN fuente_presupuesto.monto; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.monto IS 'Monto asignado de la fuente de financiamiento';


--
-- Name: COLUMN fuente_presupuesto.fecha_registro; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.fecha_registro IS 'Fecha del momento que se asigna el monto y la fuente de financiamiento al proyecto o accion.';


--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE fuente_presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.fuente_presupuesto_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre2; Owner: eureka
--

ALTER SEQUENCE fuente_presupuesto_id_seq OWNED BY fuente_presupuesto.id;


--
-- Name: partida_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.partida_id_seq OWNER TO eureka;

--
-- Name: partida_producto_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE partida_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.partida_producto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.presupuesto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_importacion; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
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


ALTER TABLE trimestre2.presupuesto_importacion OWNER TO eureka;

--
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- Name: COLUMN presupuesto_importacion.producto_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.producto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- Name: presupuesto_partida_acciones; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_acciones (
    accion_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    codigo_accion character varying(100) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_accion_padre bigint,
    anho integer NOT NULL
);


ALTER TABLE trimestre2.presupuesto_partida_acciones OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partida_acciones.anho; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partida_acciones.anho IS 'Año de presupuesto carga de la acción';


--
-- Name: presupuesto_partida_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE presupuesto_partida_id_seq
    START WITH 100000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.presupuesto_partida_id_seq OWNER TO eureka;

--
-- Name: presupuesto_partida_proyecto; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_proyecto (
    proyecto_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE trimestre2.presupuesto_partida_proyecto OWNER TO eureka;

--
-- Name: presupuesto_partidas; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
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
    presupuesto_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE trimestre2.presupuesto_partidas OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partidas.presupuesto_partida_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.presupuesto_partida_id IS 'identificador unico ';


--
-- Name: COLUMN presupuesto_partidas.partida_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- Name: COLUMN presupuesto_partidas.monto_presupuestado; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- Name: COLUMN presupuesto_partidas.fecha_desde; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN presupuesto_partidas.fecha_hasta; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- Name: presupuesto_productos; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
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
    proyecto_partida_id bigint NOT NULL,
    fecha_estimada date
);


ALTER TABLE trimestre2.presupuesto_productos OWNER TO eureka;

--
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- Name: COLUMN presupuesto_productos.fecha_estimada; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.fecha_estimada IS 'Fecha estimada de adquisición o contratación';


--
-- Name: presupuesto_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.presupuesto_seq OWNER TO eureka;

--
-- Name: procedimientos; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE procedimientos (
    id integer NOT NULL,
    num_contrato character varying(255) NOT NULL,
    anho integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    tipo character varying(255) NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre2.procedimientos OWNER TO eureka;

--
-- Name: TABLE procedimientos; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON TABLE procedimientos IS 'Procedimiento: orden o servicio que le da pie a la carga de una factura en el módulo de rendición de cuentas.';


--
-- Name: COLUMN procedimientos.num_contrato; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN procedimientos.num_contrato IS 'Es el modulo donde se carga el Nº de contrato, orden de servicio u orden de compra que le da inicio al proceso de adquisición o contratación.';


--
-- Name: COLUMN procedimientos.anho; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN procedimientos.anho IS 'Año de carga del procedimiento';


--
-- Name: COLUMN procedimientos.fecha; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN procedimientos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN procedimientos.tipo; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN procedimientos.tipo IS 'Tipo de procedimientos, si es una obra, un servicio o compra';


--
-- Name: COLUMN procedimientos.ente_organo_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN procedimientos.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: procedimientos_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE procedimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.procedimientos_id_seq OWNER TO eureka;

--
-- Name: procedimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre2; Owner: eureka
--

ALTER SEQUENCE procedimientos_id_seq OWNED BY procedimientos.id;


--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.producto_id_seq OWNER TO eureka;

--
-- Name: proveedores; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE proveedores (
    id integer NOT NULL,
    rif character varying(10) NOT NULL,
    razon_social character varying(255) NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre2.proveedores OWNER TO eureka;

--
-- Name: TABLE proveedores; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON TABLE proveedores IS 'Proveedores del modulo de rendición de cuentas';


--
-- Name: COLUMN proveedores.rif; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proveedores.rif IS 'RIF del proveedor (Formato: X123456789) Mismo formato que el Sistema de RNC';


--
-- Name: COLUMN proveedores.razon_social; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proveedores.razon_social IS 'Razon social del proveedor';


--
-- Name: COLUMN proveedores.fecha; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proveedores.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN proveedores.ente_organo_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proveedores.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE proveedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.proveedores_id_seq OWNER TO eureka;

--
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre2; Owner: eureka
--

ALTER SEQUENCE proveedores_id_seq OWNED BY proveedores.id;


--
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.proyecto_id_seq OWNER TO eureka;

--
-- Name: proyectos; Type: TABLE; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE TABLE proyectos (
    proyecto_id bigint DEFAULT nextval('proyecto_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_padre character varying(20),
    anho integer NOT NULL
);


ALTER TABLE trimestre2.proyectos OWNER TO eureka;

--
-- Name: TABLE proyectos; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON TABLE proyectos IS 'proyectos o acciones centralizadas';


--
-- Name: COLUMN proyectos.proyecto_id; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proyectos.proyecto_id IS 'identificador unico del proyecto';


--
-- Name: COLUMN proyectos.nombre; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proyectos.nombre IS 'nombre del proyecto o accion centralizada';


--
-- Name: COLUMN proyectos.codigo; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proyectos.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- Name: COLUMN proyectos.anho; Type: COMMENT; Schema: trimestre2; Owner: eureka
--

COMMENT ON COLUMN proyectos.anho IS 'Año de presupuesto carga del proyecto';


--
-- Name: tasa_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE tasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.tasa_id_seq OWNER TO eureka;

--
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.unidad_id_seq OWNER TO eureka;

--
-- Name: user_login_attempts_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE user_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.user_login_attempts_id_seq OWNER TO eureka;

--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: trimestre2; Owner: eureka
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre2.usuarios_usuario_id_seq OWNER TO eureka;

SET search_path = trimestre3, pg_catalog;

--
-- Name: accion_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.accion_id_seq OWNER TO eureka;

--
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.codigo_ncm_id_seq OWNER TO eureka;

--
-- Name: divisa_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE divisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.divisa_id_seq OWNER TO eureka;

--
-- Name: ente_adscrito_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE ente_adscrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.ente_adscrito_id_seq OWNER TO eureka;

--
-- Name: ente_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.ente_id_seq OWNER TO eureka;

--
-- Name: facturas; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas (
    id integer NOT NULL,
    num_factura character varying(255) NOT NULL,
    anho integer,
    proveedor_id integer NOT NULL,
    procedimiento_id integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    fecha_factura date,
    ente_organo_id integer NOT NULL,
    cierre_carga boolean
);


ALTER TABLE trimestre3.facturas OWNER TO eureka;

--
-- Name: TABLE facturas; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON TABLE facturas IS 'Factura del modulo de rendición de cuentas';


--
-- Name: COLUMN facturas.num_factura; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.num_factura IS 'Número de factura.';


--
-- Name: COLUMN facturas.anho; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.anho IS 'Año en que se cargo la factura';


--
-- Name: COLUMN facturas.proveedor_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foránea a la tabla Proveedores';


--
-- Name: COLUMN facturas.procedimiento_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.procedimiento_id IS 'Clave foránea a la tabla Procedimientos';


--
-- Name: COLUMN facturas.fecha; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas.fecha_factura; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_factura IS 'Fecha de emisióin de la factura';


--
-- Name: COLUMN facturas.ente_organo_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: COLUMN facturas.cierre_carga; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas.cierre_carga IS 'Indica si se finalizó la carga de la  Factura.';


--
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.facturas_id_seq OWNER TO eureka;

--
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre3; Owner: eureka
--

ALTER SEQUENCE facturas_id_seq OWNED BY facturas.id;


--
-- Name: facturas_productos; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas_productos (
    id integer NOT NULL,
    factura_id integer NOT NULL,
    producto_id integer NOT NULL,
    costo_unitario numeric(38,6) NOT NULL,
    cantidad_adquirida integer,
    iva_id integer,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    presupuesto_partida_id integer NOT NULL
);


ALTER TABLE trimestre3.facturas_productos OWNER TO eureka;

--
-- Name: COLUMN facturas_productos.factura_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.factura_id IS 'Factura a la cual esta asociado el producto.';


--
-- Name: COLUMN facturas_productos.producto_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.producto_id IS 'Clave foranea a la tabla productos';


--
-- Name: COLUMN facturas_productos.costo_unitario; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.costo_unitario IS 'Costo unitario del producto';


--
-- Name: COLUMN facturas_productos.cantidad_adquirida; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.cantidad_adquirida IS 'Cantidad del producto adquirido en la factura';


--
-- Name: COLUMN facturas_productos.iva_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.iva_id IS 'Clave foránea a la tabla IVA';


--
-- Name: COLUMN facturas_productos.fecha; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas_productos.presupuesto_partida_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.presupuesto_partida_id IS 'Clave foranea a la tabla Presupuesto_partida';


--
-- Name: facturas_productos_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE facturas_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.facturas_productos_id_seq OWNER TO eureka;

--
-- Name: facturas_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre3; Owner: eureka
--

ALTER SEQUENCE facturas_productos_id_seq OWNED BY facturas_productos.id;


--
-- Name: fuente_financiamiento_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE fuente_financiamiento_id_seq
    START WITH 3000
    INCREMENT BY 1
    MINVALUE 3000
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.fuente_financiamiento_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE fuente_presupuesto (
    id integer NOT NULL,
    fuente_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    monto numeric(38,6),
    fecha_registro date DEFAULT now() NOT NULL
);


ALTER TABLE trimestre3.fuente_presupuesto OWNER TO eureka;

--
-- Name: COLUMN fuente_presupuesto.monto; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.monto IS 'Monto asignado de la fuente de financiamiento';


--
-- Name: COLUMN fuente_presupuesto.fecha_registro; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.fecha_registro IS 'Fecha del momento que se asigna el monto y la fuente de financiamiento al proyecto o accion.';


--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE fuente_presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.fuente_presupuesto_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre3; Owner: eureka
--

ALTER SEQUENCE fuente_presupuesto_id_seq OWNED BY fuente_presupuesto.id;


--
-- Name: partida_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.partida_id_seq OWNER TO eureka;

--
-- Name: partida_producto_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE partida_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.partida_producto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.presupuesto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_importacion; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
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


ALTER TABLE trimestre3.presupuesto_importacion OWNER TO eureka;

--
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- Name: COLUMN presupuesto_importacion.producto_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.producto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- Name: presupuesto_partida_acciones; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_acciones (
    accion_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    codigo_accion character varying(100) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_accion_padre bigint,
    anho integer NOT NULL
);


ALTER TABLE trimestre3.presupuesto_partida_acciones OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partida_acciones.anho; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partida_acciones.anho IS 'Año de presupuesto carga de la acción';


--
-- Name: presupuesto_partida_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE presupuesto_partida_id_seq
    START WITH 100000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.presupuesto_partida_id_seq OWNER TO eureka;

--
-- Name: presupuesto_partida_proyecto; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_proyecto (
    proyecto_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE trimestre3.presupuesto_partida_proyecto OWNER TO eureka;

--
-- Name: presupuesto_partidas; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
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
    presupuesto_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE trimestre3.presupuesto_partidas OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partidas.presupuesto_partida_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.presupuesto_partida_id IS 'identificador unico ';


--
-- Name: COLUMN presupuesto_partidas.partida_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- Name: COLUMN presupuesto_partidas.monto_presupuestado; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- Name: COLUMN presupuesto_partidas.fecha_desde; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN presupuesto_partidas.fecha_hasta; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- Name: presupuesto_productos; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
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
    proyecto_partida_id bigint NOT NULL,
    fecha_estimada date
);


ALTER TABLE trimestre3.presupuesto_productos OWNER TO eureka;

--
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- Name: COLUMN presupuesto_productos.fecha_estimada; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.fecha_estimada IS 'Fecha estimada de adquisición o contratación';


--
-- Name: presupuesto_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.presupuesto_seq OWNER TO eureka;

--
-- Name: procedimientos; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE procedimientos (
    id integer NOT NULL,
    num_contrato character varying(255) NOT NULL,
    anho integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    tipo character varying(255) NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre3.procedimientos OWNER TO eureka;

--
-- Name: TABLE procedimientos; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON TABLE procedimientos IS 'Procedimiento: orden o servicio que le da pie a la carga de una factura en el módulo de rendición de cuentas.';


--
-- Name: COLUMN procedimientos.num_contrato; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN procedimientos.num_contrato IS 'Es el modulo donde se carga el Nº de contrato, orden de servicio u orden de compra que le da inicio al proceso de adquisición o contratación.';


--
-- Name: COLUMN procedimientos.anho; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN procedimientos.anho IS 'Año de carga del procedimiento';


--
-- Name: COLUMN procedimientos.fecha; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN procedimientos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN procedimientos.tipo; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN procedimientos.tipo IS 'Tipo de procedimientos, si es una obra, un servicio o compra';


--
-- Name: COLUMN procedimientos.ente_organo_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN procedimientos.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: procedimientos_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE procedimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.procedimientos_id_seq OWNER TO eureka;

--
-- Name: procedimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre3; Owner: eureka
--

ALTER SEQUENCE procedimientos_id_seq OWNED BY procedimientos.id;


--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.producto_id_seq OWNER TO eureka;

--
-- Name: proveedores; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE proveedores (
    id integer NOT NULL,
    rif character varying(10) NOT NULL,
    razon_social character varying(255) NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre3.proveedores OWNER TO eureka;

--
-- Name: TABLE proveedores; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON TABLE proveedores IS 'Proveedores del modulo de rendición de cuentas';


--
-- Name: COLUMN proveedores.rif; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proveedores.rif IS 'RIF del proveedor (Formato: X123456789) Mismo formato que el Sistema de RNC';


--
-- Name: COLUMN proveedores.razon_social; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proveedores.razon_social IS 'Razon social del proveedor';


--
-- Name: COLUMN proveedores.fecha; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proveedores.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN proveedores.ente_organo_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proveedores.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE proveedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.proveedores_id_seq OWNER TO eureka;

--
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre3; Owner: eureka
--

ALTER SEQUENCE proveedores_id_seq OWNED BY proveedores.id;


--
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.proyecto_id_seq OWNER TO eureka;

--
-- Name: proyectos; Type: TABLE; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE TABLE proyectos (
    proyecto_id bigint DEFAULT nextval('proyecto_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_padre character varying(20),
    anho integer NOT NULL
);


ALTER TABLE trimestre3.proyectos OWNER TO eureka;

--
-- Name: TABLE proyectos; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON TABLE proyectos IS 'proyectos o acciones centralizadas';


--
-- Name: COLUMN proyectos.proyecto_id; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proyectos.proyecto_id IS 'identificador unico del proyecto';


--
-- Name: COLUMN proyectos.nombre; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proyectos.nombre IS 'nombre del proyecto o accion centralizada';


--
-- Name: COLUMN proyectos.codigo; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proyectos.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- Name: COLUMN proyectos.anho; Type: COMMENT; Schema: trimestre3; Owner: eureka
--

COMMENT ON COLUMN proyectos.anho IS 'Año de presupuesto carga del proyecto';


--
-- Name: tasa_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE tasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.tasa_id_seq OWNER TO eureka;

--
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.unidad_id_seq OWNER TO eureka;

--
-- Name: user_login_attempts_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE user_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.user_login_attempts_id_seq OWNER TO eureka;

--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: trimestre3; Owner: eureka
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre3.usuarios_usuario_id_seq OWNER TO eureka;

SET search_path = trimestre4, pg_catalog;

--
-- Name: accion_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.accion_id_seq OWNER TO eureka;

--
-- Name: codigo_ncm_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE codigo_ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.codigo_ncm_id_seq OWNER TO eureka;

--
-- Name: divisa_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE divisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.divisa_id_seq OWNER TO eureka;

--
-- Name: ente_adscrito_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE ente_adscrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.ente_adscrito_id_seq OWNER TO eureka;

--
-- Name: ente_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE ente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.ente_id_seq OWNER TO eureka;

--
-- Name: facturas; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas (
    id integer NOT NULL,
    num_factura character varying(255) NOT NULL,
    anho integer,
    proveedor_id integer NOT NULL,
    procedimiento_id integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    fecha_factura date,
    ente_organo_id integer NOT NULL,
    cierre_carga boolean
);


ALTER TABLE trimestre4.facturas OWNER TO eureka;

--
-- Name: TABLE facturas; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON TABLE facturas IS 'Factura del modulo de rendición de cuentas';


--
-- Name: COLUMN facturas.num_factura; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.num_factura IS 'Número de factura.';


--
-- Name: COLUMN facturas.anho; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.anho IS 'Año en que se cargo la factura';


--
-- Name: COLUMN facturas.proveedor_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foránea a la tabla Proveedores';


--
-- Name: COLUMN facturas.procedimiento_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.procedimiento_id IS 'Clave foránea a la tabla Procedimientos';


--
-- Name: COLUMN facturas.fecha; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas.fecha_factura; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_factura IS 'Fecha de emisióin de la factura';


--
-- Name: COLUMN facturas.ente_organo_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: COLUMN facturas.cierre_carga; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas.cierre_carga IS 'Indica si se finalizó la carga de la  Factura.';


--
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.facturas_id_seq OWNER TO eureka;

--
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre4; Owner: eureka
--

ALTER SEQUENCE facturas_id_seq OWNED BY facturas.id;


--
-- Name: facturas_productos; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas_productos (
    id integer NOT NULL,
    factura_id integer NOT NULL,
    producto_id integer NOT NULL,
    costo_unitario numeric(38,6) NOT NULL,
    cantidad_adquirida integer,
    iva_id integer,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    presupuesto_partida_id integer NOT NULL
);


ALTER TABLE trimestre4.facturas_productos OWNER TO eureka;

--
-- Name: COLUMN facturas_productos.factura_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.factura_id IS 'Factura a la cual esta asociado el producto.';


--
-- Name: COLUMN facturas_productos.producto_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.producto_id IS 'Clave foranea a la tabla productos';


--
-- Name: COLUMN facturas_productos.costo_unitario; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.costo_unitario IS 'Costo unitario del producto';


--
-- Name: COLUMN facturas_productos.cantidad_adquirida; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.cantidad_adquirida IS 'Cantidad del producto adquirido en la factura';


--
-- Name: COLUMN facturas_productos.iva_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.iva_id IS 'Clave foránea a la tabla IVA';


--
-- Name: COLUMN facturas_productos.fecha; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN facturas_productos.presupuesto_partida_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN facturas_productos.presupuesto_partida_id IS 'Clave foranea a la tabla Presupuesto_partida';


--
-- Name: facturas_productos_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE facturas_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.facturas_productos_id_seq OWNER TO eureka;

--
-- Name: facturas_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre4; Owner: eureka
--

ALTER SEQUENCE facturas_productos_id_seq OWNED BY facturas_productos.id;


--
-- Name: fuente_financiamiento_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE fuente_financiamiento_id_seq
    START WITH 3000
    INCREMENT BY 1
    MINVALUE 3000
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.fuente_financiamiento_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE fuente_presupuesto (
    id integer NOT NULL,
    fuente_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    monto numeric(38,6),
    fecha_registro date DEFAULT now() NOT NULL
);


ALTER TABLE trimestre4.fuente_presupuesto OWNER TO eureka;

--
-- Name: COLUMN fuente_presupuesto.monto; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.monto IS 'Monto asignado de la fuente de financiamiento';


--
-- Name: COLUMN fuente_presupuesto.fecha_registro; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN fuente_presupuesto.fecha_registro IS 'Fecha del momento que se asigna el monto y la fuente de financiamiento al proyecto o accion.';


--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE fuente_presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.fuente_presupuesto_id_seq OWNER TO eureka;

--
-- Name: fuente_presupuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre4; Owner: eureka
--

ALTER SEQUENCE fuente_presupuesto_id_seq OWNED BY fuente_presupuesto.id;


--
-- Name: partida_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.partida_id_seq OWNER TO eureka;

--
-- Name: partida_producto_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE partida_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.partida_producto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE presupuesto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.presupuesto_id_seq OWNER TO eureka;

--
-- Name: presupuesto_importacion; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
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


ALTER TABLE trimestre4.presupuesto_importacion OWNER TO eureka;

--
-- Name: TABLE presupuesto_importacion; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON TABLE presupuesto_importacion IS 'Tabla que contiene la informacion de los productos presuepuestados que seran importados';


--
-- Name: COLUMN presupuesto_importacion.codigo_ncm_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.codigo_ncm_id IS 'clave foranea que referencia el codigo arancelario ';


--
-- Name: COLUMN presupuesto_importacion.producto_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.producto_id IS 'clave foranea que referencia a un presupuesto de un producto determinado';


--
-- Name: COLUMN presupuesto_importacion.cantidad; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.cantidad IS 'cantidad del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.monto_presupuesto; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.monto_presupuesto IS 'monto expresado en dolares del producto que se importara';


--
-- Name: COLUMN presupuesto_importacion.tipo; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_importacion.tipo IS 'copovex o licitacion internacional';


--
-- Name: presupuesto_partida_acciones; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_acciones (
    accion_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL,
    codigo_accion character varying(100) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_accion_padre bigint,
    anho integer NOT NULL
);


ALTER TABLE trimestre4.presupuesto_partida_acciones OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partida_acciones.anho; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partida_acciones.anho IS 'Año de presupuesto carga de la acción';


--
-- Name: presupuesto_partida_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE presupuesto_partida_id_seq
    START WITH 100000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.presupuesto_partida_id_seq OWNER TO eureka;

--
-- Name: presupuesto_partida_proyecto; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE presupuesto_partida_proyecto (
    proyecto_id bigint NOT NULL,
    presupuesto_partida_id bigint NOT NULL
);


ALTER TABLE trimestre4.presupuesto_partida_proyecto OWNER TO eureka;

--
-- Name: presupuesto_partidas; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
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
    presupuesto_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE trimestre4.presupuesto_partidas OWNER TO eureka;

--
-- Name: COLUMN presupuesto_partidas.presupuesto_partida_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.presupuesto_partida_id IS 'identificador unico ';


--
-- Name: COLUMN presupuesto_partidas.partida_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.partida_id IS 'clave foranea que hace referencia a una partida';


--
-- Name: COLUMN presupuesto_partidas.monto_presupuestado; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.monto_presupuestado IS 'monto presupuestado para un la partida de un proyecto particular';


--
-- Name: COLUMN presupuesto_partidas.fecha_desde; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_desde IS 'fecha de inicio de validez del campo';


--
-- Name: COLUMN presupuesto_partidas.fecha_hasta; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_partidas.fecha_hasta IS 'fecha hasta la cual es valido del campo';


--
-- Name: presupuesto_productos; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
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
    proyecto_partida_id bigint NOT NULL,
    fecha_estimada date
);


ALTER TABLE trimestre4.presupuesto_productos OWNER TO eureka;

--
-- Name: TABLE presupuesto_productos; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON TABLE presupuesto_productos IS 'La tabla contiene la informacion de los productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.presupuesto_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.presupuesto_id IS 'identificador unico de un productos de una partida presupuestado';


--
-- Name: COLUMN presupuesto_productos.producto_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.producto_id IS 'clave foranea que referencia a un producto';


--
-- Name: COLUMN presupuesto_productos.unidad_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.unidad_id IS 'clave foranea que referencia a una unidad';


--
-- Name: COLUMN presupuesto_productos.costo_unidad; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.costo_unidad IS 'costo en bolibares de la unidad de un producto';


--
-- Name: COLUMN presupuesto_productos.cantidad; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.cantidad IS 'cantidad de productos presupuestados';


--
-- Name: COLUMN presupuesto_productos.monto_presupuesto; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.monto_presupuesto IS 'monto total de un producto por n veces las unidades expresado en bolivares';


--
-- Name: COLUMN presupuesto_productos.tipo; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.tipo IS 'los bienes pueden ser comprados nacionalmente o internacionalmente';


--
-- Name: COLUMN presupuesto_productos.fecha_estimada; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN presupuesto_productos.fecha_estimada IS 'Fecha estimada de adquisición o contratación';


--
-- Name: presupuesto_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.presupuesto_seq OWNER TO eureka;

--
-- Name: procedimientos; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE procedimientos (
    id integer NOT NULL,
    num_contrato character varying(255) NOT NULL,
    anho integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    tipo character varying(255) NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre4.procedimientos OWNER TO eureka;

--
-- Name: TABLE procedimientos; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON TABLE procedimientos IS 'Procedimiento: orden o servicio que le da pie a la carga de una factura en el módulo de rendición de cuentas.';


--
-- Name: COLUMN procedimientos.num_contrato; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN procedimientos.num_contrato IS 'Es el modulo donde se carga el Nº de contrato, orden de servicio u orden de compra que le da inicio al proceso de adquisición o contratación.';


--
-- Name: COLUMN procedimientos.anho; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN procedimientos.anho IS 'Año de carga del procedimiento';


--
-- Name: COLUMN procedimientos.fecha; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN procedimientos.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN procedimientos.tipo; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN procedimientos.tipo IS 'Tipo de procedimientos, si es una obra, un servicio o compra';


--
-- Name: COLUMN procedimientos.ente_organo_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN procedimientos.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: procedimientos_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE procedimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.procedimientos_id_seq OWNER TO eureka;

--
-- Name: procedimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre4; Owner: eureka
--

ALTER SEQUENCE procedimientos_id_seq OWNED BY procedimientos.id;


--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.producto_id_seq OWNER TO eureka;

--
-- Name: proveedores; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE proveedores (
    id integer NOT NULL,
    rif character varying(10) NOT NULL,
    razon_social character varying(255) NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    ente_organo_id integer NOT NULL
);


ALTER TABLE trimestre4.proveedores OWNER TO eureka;

--
-- Name: TABLE proveedores; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON TABLE proveedores IS 'Proveedores del modulo de rendición de cuentas';


--
-- Name: COLUMN proveedores.rif; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proveedores.rif IS 'RIF del proveedor (Formato: X123456789) Mismo formato que el Sistema de RNC';


--
-- Name: COLUMN proveedores.razon_social; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proveedores.razon_social IS 'Razon social del proveedor';


--
-- Name: COLUMN proveedores.fecha; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proveedores.fecha IS 'Fecha de creación del registro';


--
-- Name: COLUMN proveedores.ente_organo_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proveedores.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE proveedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.proveedores_id_seq OWNER TO eureka;

--
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: trimestre4; Owner: eureka
--

ALTER SEQUENCE proveedores_id_seq OWNED BY proveedores.id;


--
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.proyecto_id_seq OWNER TO eureka;

--
-- Name: proyectos; Type: TABLE; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE TABLE proyectos (
    proyecto_id bigint DEFAULT nextval('proyecto_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    codigo character varying(20) NOT NULL,
    ente_organo_id bigint NOT NULL,
    codigo_padre character varying(20),
    anho integer NOT NULL
);


ALTER TABLE trimestre4.proyectos OWNER TO eureka;

--
-- Name: TABLE proyectos; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON TABLE proyectos IS 'proyectos o acciones centralizadas';


--
-- Name: COLUMN proyectos.proyecto_id; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proyectos.proyecto_id IS 'identificador unico del proyecto';


--
-- Name: COLUMN proyectos.nombre; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proyectos.nombre IS 'nombre del proyecto o accion centralizada';


--
-- Name: COLUMN proyectos.codigo; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proyectos.codigo IS 'codigo del proyecto o accion centralizada segun especificacion de onapre';


--
-- Name: COLUMN proyectos.anho; Type: COMMENT; Schema: trimestre4; Owner: eureka
--

COMMENT ON COLUMN proyectos.anho IS 'Año de presupuesto carga del proyecto';


--
-- Name: tasa_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE tasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.tasa_id_seq OWNER TO eureka;

--
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.unidad_id_seq OWNER TO eureka;

--
-- Name: user_login_attempts_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE user_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.user_login_attempts_id_seq OWNER TO eureka;

--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: trimestre4; Owner: eureka
--

CREATE SEQUENCE usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trimestre4.usuarios_usuario_id_seq OWNER TO eureka;

SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY activerecordlog ALTER COLUMN id SET DEFAULT nextval('activerecordlog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas ALTER COLUMN id SET DEFAULT nextval('facturas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas_productos ALTER COLUMN id SET DEFAULT nextval('facturas_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto ALTER COLUMN id SET DEFAULT nextval('fuente_presupuesto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY iva ALTER COLUMN id SET DEFAULT nextval('iva_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY procedimientos ALTER COLUMN id SET DEFAULT nextval('procedimientos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY proveedores ALTER COLUMN id SET DEFAULT nextval('proveedores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY user_used_passwords ALTER COLUMN id SET DEFAULT nextval('user_used_passwords_id_seq'::regclass);


SET search_path = trimestre1, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas ALTER COLUMN id SET DEFAULT nextval('facturas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas_productos ALTER COLUMN id SET DEFAULT nextval('facturas_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto ALTER COLUMN id SET DEFAULT nextval('fuente_presupuesto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY procedimientos ALTER COLUMN id SET DEFAULT nextval('procedimientos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY proveedores ALTER COLUMN id SET DEFAULT nextval('proveedores_id_seq'::regclass);


SET search_path = trimestre2, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas ALTER COLUMN id SET DEFAULT nextval('facturas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas_productos ALTER COLUMN id SET DEFAULT nextval('facturas_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto ALTER COLUMN id SET DEFAULT nextval('fuente_presupuesto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY procedimientos ALTER COLUMN id SET DEFAULT nextval('procedimientos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY proveedores ALTER COLUMN id SET DEFAULT nextval('proveedores_id_seq'::regclass);


SET search_path = trimestre3, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas ALTER COLUMN id SET DEFAULT nextval('facturas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas_productos ALTER COLUMN id SET DEFAULT nextval('facturas_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto ALTER COLUMN id SET DEFAULT nextval('fuente_presupuesto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY procedimientos ALTER COLUMN id SET DEFAULT nextval('procedimientos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY proveedores ALTER COLUMN id SET DEFAULT nextval('proveedores_id_seq'::regclass);


SET search_path = trimestre4, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas ALTER COLUMN id SET DEFAULT nextval('facturas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas_productos ALTER COLUMN id SET DEFAULT nextval('facturas_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto ALTER COLUMN id SET DEFAULT nextval('fuente_presupuesto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY procedimientos ALTER COLUMN id SET DEFAULT nextval('procedimientos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY proveedores ALTER COLUMN id SET DEFAULT nextval('proveedores_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: activerecordlog_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY activerecordlog
    ADD CONSTRAINT activerecordlog_pkey PRIMARY KEY (id);


--
-- Name: facturas_num_factura_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_num_factura_key UNIQUE (num_factura);


--
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- Name: facturas_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_pkey PRIMARY KEY (id);


--
-- Name: fuente_presupuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_pkey PRIMARY KEY (id);


--
-- Name: iva_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY iva
    ADD CONSTRAINT iva_pkey PRIMARY KEY (id);


--
-- Name: pkacciones; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY acciones
    ADD CONSTRAINT pkacciones PRIMARY KEY (accion_id);


--
-- Name: pkcodigos_ncm; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY codigos_ncm
    ADD CONSTRAINT pkcodigos_ncm PRIMARY KEY (codigo_ncm_id);


--
-- Name: pkdivisas; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY divisas
    ADD CONSTRAINT pkdivisas PRIMARY KEY (divisa_id);


--
-- Name: pkentes_adscritos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT pkentes_adscritos PRIMARY KEY (ente_adscrito_id);


--
-- Name: pkentes_organos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY entes_organos
    ADD CONSTRAINT pkentes_organos PRIMARY KEY (ente_organo_id);


--
-- Name: pkfuentes_financiamiento; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuentes_financiamiento
    ADD CONSTRAINT pkfuentes_financiamiento PRIMARY KEY (fuente_financiamiento_id);


--
-- Name: pkpartida_productos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT pkpartida_productos PRIMARY KEY (partida_producto_id);


--
-- Name: pkpartidas; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY partidas
    ADD CONSTRAINT pkpartidas PRIMARY KEY (partida_id);


--
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, producto_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_acciones; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT pkpresupuesto_partida_acciones PRIMARY KEY (accion_id, ente_organo_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_proyecto; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT pkpresupuesto_partida_proyecto PRIMARY KEY (proyecto_id, presupuesto_partida_id);


--
-- Name: pkpresupuestos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuestos
    ADD CONSTRAINT pkpresupuestos PRIMARY KEY (presupuesto_id);


--
-- Name: pkproductos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pkproductos PRIMARY KEY (producto_id);


--
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (presupuesto_partida_id);


--
-- Name: pkproyectos; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT pkproyectos PRIMARY KEY (proyecto_id);


--
-- Name: pktasas; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY tasas
    ADD CONSTRAINT pktasas PRIMARY KEY (tasa_id);


--
-- Name: pkunidades; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT pkunidades PRIMARY KEY (unidad_id);


--
-- Name: procedimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_pkey PRIMARY KEY (id);


--
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: proveedores_rif_ente_organo_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_rif_ente_organo_id_key UNIQUE (rif, ente_organo_id);


--
-- Name: tbl_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY tbl_migration
    ADD CONSTRAINT tbl_migration_pkey PRIMARY KEY (version);


--
-- Name: user_login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_pkey PRIMARY KEY (id);


--
-- Name: user_used_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_pkey PRIMARY KEY (id);


--
-- Name: usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- Name: usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (usuario_id);


--
-- Name: usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


SET search_path = trimestre1, pg_catalog;

--
-- Name: facturas_num_factura_key; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_num_factura_key UNIQUE (num_factura);


--
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- Name: facturas_productos_pkey; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_pkey PRIMARY KEY (id);


--
-- Name: fuente_presupuesto_pkey; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_pkey PRIMARY KEY (id);


--
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, producto_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_acciones; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT pkpresupuesto_partida_acciones PRIMARY KEY (accion_id, ente_organo_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_proyecto; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT pkpresupuesto_partida_proyecto PRIMARY KEY (proyecto_id, presupuesto_partida_id);


--
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (presupuesto_partida_id);


--
-- Name: pkproyectos; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT pkproyectos PRIMARY KEY (proyecto_id);


--
-- Name: procedimientos_pkey; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_pkey PRIMARY KEY (id);


--
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: proveedores_rif_ente_organo_id_key; Type: CONSTRAINT; Schema: trimestre1; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_rif_ente_organo_id_key UNIQUE (rif, ente_organo_id);


SET search_path = trimestre2, pg_catalog;

--
-- Name: facturas_num_factura_key; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_num_factura_key UNIQUE (num_factura);


--
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- Name: facturas_productos_pkey; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_pkey PRIMARY KEY (id);


--
-- Name: fuente_presupuesto_pkey; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_pkey PRIMARY KEY (id);


--
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, producto_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_acciones; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT pkpresupuesto_partida_acciones PRIMARY KEY (accion_id, ente_organo_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_proyecto; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT pkpresupuesto_partida_proyecto PRIMARY KEY (proyecto_id, presupuesto_partida_id);


--
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (presupuesto_partida_id);


--
-- Name: pkproyectos; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT pkproyectos PRIMARY KEY (proyecto_id);


--
-- Name: procedimientos_pkey; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_pkey PRIMARY KEY (id);


--
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: proveedores_rif_ente_organo_id_key; Type: CONSTRAINT; Schema: trimestre2; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_rif_ente_organo_id_key UNIQUE (rif, ente_organo_id);


SET search_path = trimestre3, pg_catalog;

--
-- Name: facturas_num_factura_key; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_num_factura_key UNIQUE (num_factura);


--
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- Name: facturas_productos_pkey; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_pkey PRIMARY KEY (id);


--
-- Name: fuente_presupuesto_pkey; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_pkey PRIMARY KEY (id);


--
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, producto_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_acciones; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT pkpresupuesto_partida_acciones PRIMARY KEY (accion_id, ente_organo_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_proyecto; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT pkpresupuesto_partida_proyecto PRIMARY KEY (proyecto_id, presupuesto_partida_id);


--
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (presupuesto_partida_id);


--
-- Name: pkproyectos; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT pkproyectos PRIMARY KEY (proyecto_id);


--
-- Name: procedimientos_pkey; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_pkey PRIMARY KEY (id);


--
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: proveedores_rif_ente_organo_id_key; Type: CONSTRAINT; Schema: trimestre3; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_rif_ente_organo_id_key UNIQUE (rif, ente_organo_id);


SET search_path = trimestre4, pg_catalog;

--
-- Name: facturas_num_factura_key; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_num_factura_key UNIQUE (num_factura);


--
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- Name: facturas_productos_pkey; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_pkey PRIMARY KEY (id);


--
-- Name: fuente_presupuesto_pkey; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_pkey PRIMARY KEY (id);


--
-- Name: pkpresupuesto; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT pkpresupuesto PRIMARY KEY (presupuesto_id);


--
-- Name: pkpresupuesto_importacion; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT pkpresupuesto_importacion PRIMARY KEY (codigo_ncm_id, producto_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_acciones; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT pkpresupuesto_partida_acciones PRIMARY KEY (accion_id, ente_organo_id, presupuesto_partida_id);


--
-- Name: pkpresupuesto_partida_proyecto; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT pkpresupuesto_partida_proyecto PRIMARY KEY (proyecto_id, presupuesto_partida_id);


--
-- Name: pkproyecto_partidas; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT pkproyecto_partidas PRIMARY KEY (presupuesto_partida_id);


--
-- Name: pkproyectos; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT pkproyectos PRIMARY KEY (proyecto_id);


--
-- Name: procedimientos_pkey; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_pkey PRIMARY KEY (id);


--
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: proveedores_rif_ente_organo_id_key; Type: CONSTRAINT; Schema: trimestre4; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_rif_ente_organo_id_key UNIQUE (rif, ente_organo_id);


SET search_path = public, pg_catalog;

--
-- Name: fki_fuente; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_fuente ON fuente_presupuesto USING btree (fuente_id);


--
-- Name: fki_presupuesto_fk; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_presupuesto_fk ON fuente_presupuesto USING btree (presupuesto_partida_id);


--
-- Name: user_login_attempts_user_id_idx; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX user_login_attempts_user_id_idx ON user_login_attempts USING btree (user_id);


--
-- Name: user_used_passwords_user_id_idx; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX user_used_passwords_user_id_idx ON user_used_passwords USING btree (user_id);


SET search_path = trimestre1, pg_catalog;

--
-- Name: fki_fuente; Type: INDEX; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_fuente ON fuente_presupuesto USING btree (fuente_id);


--
-- Name: fki_presupuesto_fk; Type: INDEX; Schema: trimestre1; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_presupuesto_fk ON fuente_presupuesto USING btree (presupuesto_partida_id);


SET search_path = trimestre2, pg_catalog;

--
-- Name: fki_fuente; Type: INDEX; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_fuente ON fuente_presupuesto USING btree (fuente_id);


--
-- Name: fki_presupuesto_fk; Type: INDEX; Schema: trimestre2; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_presupuesto_fk ON fuente_presupuesto USING btree (presupuesto_partida_id);


SET search_path = trimestre3, pg_catalog;

--
-- Name: fki_fuente; Type: INDEX; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_fuente ON fuente_presupuesto USING btree (fuente_id);


--
-- Name: fki_presupuesto_fk; Type: INDEX; Schema: trimestre3; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_presupuesto_fk ON fuente_presupuesto USING btree (presupuesto_partida_id);


SET search_path = trimestre4, pg_catalog;

--
-- Name: fki_fuente; Type: INDEX; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_fuente ON fuente_presupuesto USING btree (fuente_id);


--
-- Name: fki_presupuesto_fk; Type: INDEX; Schema: trimestre4; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_presupuesto_fk ON fuente_presupuesto USING btree (presupuesto_partida_id);


SET search_path = public, pg_catalog;

--
-- Name: facturas_procedimiento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_procedimiento_id_fkey FOREIGN KEY (procedimiento_id) REFERENCES procedimientos(id);


--
-- Name: facturas_productos_factura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_factura_id_fkey FOREIGN KEY (factura_id) REFERENCES facturas(id);


--
-- Name: facturas_productos_iva_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_iva_id_fkey FOREIGN KEY (iva_id) REFERENCES iva(id);


--
-- Name: facturas_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- Name: facturas_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES proveedores(id);


--
-- Name: fk_ente_organo_id_factura; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT fk_ente_organo_id_factura FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_ente_organo_procedimientos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT fk_ente_organo_procedimientos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_ente_organo_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT fk_ente_organo_proveedor FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_entes_adscritos_entes_organos_hijo; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_hijo FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_entes_adscritos_entes_organos_padre; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY entes_adscritos
    ADD CONSTRAINT fk_entes_adscritos_entes_organos_padre FOREIGN KEY (padre_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_fuente; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_fuente FOREIGN KEY (fuente_id) REFERENCES fuentes_financiamiento(fuente_financiamiento_id);


--
-- Name: fk_partida_productos_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- Name: fk_partida_productos_productos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY partida_productos
    ADD CONSTRAINT fk_partida_productos_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- Name: fk_presupuesto_fk; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_presupuesto_fk FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_importacion_codigos_ncm; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_codigos_ncm FOREIGN KEY (codigo_ncm_id) REFERENCES codigos_ncm(codigo_ncm_id);


--
-- Name: fk_presupuesto_importacion_divisas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- Name: fk_presupuesto_importacion_presupuesto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_importacion_productos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- Name: fk_presupuesto_partida_acciones_acciones; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_acciones FOREIGN KEY (accion_id) REFERENCES acciones(accion_id);


--
-- Name: fk_presupuesto_partida_acciones_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_presupuesto_partida_acciones_presupuesto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_id; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT fk_presupuesto_partida_id FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_presupuesto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_proyectos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_proyectos FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id);


--
-- Name: fk_presupuesto_partidas_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT fk_presupuesto_partidas_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_presupuesto_partidas_presupuestos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT fk_presupuesto_partidas_presupuestos FOREIGN KEY (presupuesto_id) REFERENCES presupuestos(presupuesto_id);


--
-- Name: fk_presupuesto_productos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);


--
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_unidades; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_unidades FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id);


--
-- Name: fk_proyecto_partidas_partidas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT fk_proyecto_partidas_partidas FOREIGN KEY (partida_id) REFERENCES partidas(partida_id);


--
-- Name: fk_proyectos_acciones_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_proyectos_acciones_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: fk_tasas_divisas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY tasas
    ADD CONSTRAINT fk_tasas_divisas FOREIGN KEY (divisa_id) REFERENCES divisas(divisa_id);


--
-- Name: fk_usuarios_entes_organos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT fk_usuarios_entes_organos FOREIGN KEY (ente_organo_id) REFERENCES entes_organos(ente_organo_id);


--
-- Name: user_login_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY user_login_attempts
    ADD CONSTRAINT user_login_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_used_passwords_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY user_used_passwords
    ADD CONSTRAINT user_used_passwords_user_id_fkey FOREIGN KEY (user_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = trimestre1, pg_catalog;

--
-- Name: facturas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: facturas_procedimiento_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_procedimiento_id_fkey FOREIGN KEY (procedimiento_id) REFERENCES procedimientos(id);


--
-- Name: facturas_productos_factura_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_factura_id_fkey FOREIGN KEY (factura_id) REFERENCES facturas(id);


--
-- Name: facturas_productos_iva_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_iva_id_fkey FOREIGN KEY (iva_id) REFERENCES public.iva(id);


--
-- Name: facturas_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: facturas_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES proveedores(id);


--
-- Name: fk_presupuesto_fk; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_presupuesto_fk FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_importacion_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_acciones_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_id; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT fk_presupuesto_partida_id FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_proyectos; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_proyectos FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id);


--
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fuente_presupuesto_fuente_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_fuente_id_fkey FOREIGN KEY (fuente_id) REFERENCES public.fuentes_financiamiento(fuente_financiamiento_id);


--
-- Name: presupuesto_importacion_codigo_ncm_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_codigo_ncm_id_fkey FOREIGN KEY (codigo_ncm_id) REFERENCES public.codigos_ncm(codigo_ncm_id);


--
-- Name: presupuesto_importacion_divisa_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_divisa_id_fkey FOREIGN KEY (divisa_id) REFERENCES public.divisas(divisa_id);


--
-- Name: presupuesto_importacion_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_partida_acciones_accion_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_accion_id_fkey FOREIGN KEY (accion_id) REFERENCES public.acciones(accion_id);


--
-- Name: presupuesto_partida_acciones_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_partida_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_partida_id_fkey FOREIGN KEY (partida_id) REFERENCES public.partidas(partida_id);


--
-- Name: presupuesto_partidas_presupuesto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_presupuesto_id_fkey FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos(presupuesto_id);


--
-- Name: presupuesto_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_productos_unidad_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_unidad_id_fkey FOREIGN KEY (unidad_id) REFERENCES public.unidades(unidad_id);


--
-- Name: procedimientos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proveedores_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proyectos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre1; Owner: eureka
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


SET search_path = trimestre2, pg_catalog;

--
-- Name: facturas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: facturas_procedimiento_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_procedimiento_id_fkey FOREIGN KEY (procedimiento_id) REFERENCES procedimientos(id);


--
-- Name: facturas_productos_factura_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_factura_id_fkey FOREIGN KEY (factura_id) REFERENCES facturas(id);


--
-- Name: facturas_productos_iva_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_iva_id_fkey FOREIGN KEY (iva_id) REFERENCES public.iva(id);


--
-- Name: facturas_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: facturas_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES proveedores(id);


--
-- Name: fk_presupuesto_fk; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_presupuesto_fk FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_importacion_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_acciones_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_id; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT fk_presupuesto_partida_id FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_proyectos; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_proyectos FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id);


--
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fuente_presupuesto_fuente_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_fuente_id_fkey FOREIGN KEY (fuente_id) REFERENCES public.fuentes_financiamiento(fuente_financiamiento_id);


--
-- Name: presupuesto_importacion_codigo_ncm_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_codigo_ncm_id_fkey FOREIGN KEY (codigo_ncm_id) REFERENCES public.codigos_ncm(codigo_ncm_id);


--
-- Name: presupuesto_importacion_divisa_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_divisa_id_fkey FOREIGN KEY (divisa_id) REFERENCES public.divisas(divisa_id);


--
-- Name: presupuesto_importacion_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_partida_acciones_accion_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_accion_id_fkey FOREIGN KEY (accion_id) REFERENCES public.acciones(accion_id);


--
-- Name: presupuesto_partida_acciones_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_partida_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_partida_id_fkey FOREIGN KEY (partida_id) REFERENCES public.partidas(partida_id);


--
-- Name: presupuesto_partidas_presupuesto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_presupuesto_id_fkey FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos(presupuesto_id);


--
-- Name: presupuesto_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_productos_unidad_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_unidad_id_fkey FOREIGN KEY (unidad_id) REFERENCES public.unidades(unidad_id);


--
-- Name: procedimientos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proveedores_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proyectos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre2; Owner: eureka
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


SET search_path = trimestre3, pg_catalog;

--
-- Name: facturas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: facturas_procedimiento_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_procedimiento_id_fkey FOREIGN KEY (procedimiento_id) REFERENCES procedimientos(id);


--
-- Name: facturas_productos_factura_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_factura_id_fkey FOREIGN KEY (factura_id) REFERENCES facturas(id);


--
-- Name: facturas_productos_iva_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_iva_id_fkey FOREIGN KEY (iva_id) REFERENCES public.iva(id);


--
-- Name: facturas_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: facturas_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES proveedores(id);


--
-- Name: fk_presupuesto_fk; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_presupuesto_fk FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_importacion_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_acciones_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_id; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT fk_presupuesto_partida_id FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_proyectos; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_proyectos FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id);


--
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fuente_presupuesto_fuente_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_fuente_id_fkey FOREIGN KEY (fuente_id) REFERENCES public.fuentes_financiamiento(fuente_financiamiento_id);


--
-- Name: presupuesto_importacion_codigo_ncm_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_codigo_ncm_id_fkey FOREIGN KEY (codigo_ncm_id) REFERENCES public.codigos_ncm(codigo_ncm_id);


--
-- Name: presupuesto_importacion_divisa_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_divisa_id_fkey FOREIGN KEY (divisa_id) REFERENCES public.divisas(divisa_id);


--
-- Name: presupuesto_importacion_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_partida_acciones_accion_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_accion_id_fkey FOREIGN KEY (accion_id) REFERENCES public.acciones(accion_id);


--
-- Name: presupuesto_partida_acciones_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_partida_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_partida_id_fkey FOREIGN KEY (partida_id) REFERENCES public.partidas(partida_id);


--
-- Name: presupuesto_partidas_presupuesto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_presupuesto_id_fkey FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos(presupuesto_id);


--
-- Name: presupuesto_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_productos_unidad_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_unidad_id_fkey FOREIGN KEY (unidad_id) REFERENCES public.unidades(unidad_id);


--
-- Name: procedimientos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proveedores_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proyectos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre3; Owner: eureka
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


SET search_path = trimestre4, pg_catalog;

--
-- Name: facturas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: facturas_procedimiento_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_procedimiento_id_fkey FOREIGN KEY (procedimiento_id) REFERENCES procedimientos(id);


--
-- Name: facturas_productos_factura_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_factura_id_fkey FOREIGN KEY (factura_id) REFERENCES facturas(id);


--
-- Name: facturas_productos_iva_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_iva_id_fkey FOREIGN KEY (iva_id) REFERENCES public.iva(id);


--
-- Name: facturas_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT facturas_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: facturas_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES proveedores(id);


--
-- Name: fk_presupuesto_fk; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fk_presupuesto_fk FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_importacion_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT fk_presupuesto_importacion_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_acciones_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT fk_presupuesto_partida_acciones_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_id; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY facturas_productos
    ADD CONSTRAINT fk_presupuesto_partida_id FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_presupuesto_partidas; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_presupuesto_partidas FOREIGN KEY (presupuesto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fk_presupuesto_partida_proyecto_proyectos; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_proyecto
    ADD CONSTRAINT fk_presupuesto_partida_proyecto_proyectos FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id);


--
-- Name: fk_presupuesto_proyecto_partidas; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT fk_presupuesto_proyecto_partidas FOREIGN KEY (proyecto_partida_id) REFERENCES presupuesto_partidas(presupuesto_partida_id);


--
-- Name: fuente_presupuesto_fuente_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY fuente_presupuesto
    ADD CONSTRAINT fuente_presupuesto_fuente_id_fkey FOREIGN KEY (fuente_id) REFERENCES public.fuentes_financiamiento(fuente_financiamiento_id);


--
-- Name: presupuesto_importacion_codigo_ncm_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_codigo_ncm_id_fkey FOREIGN KEY (codigo_ncm_id) REFERENCES public.codigos_ncm(codigo_ncm_id);


--
-- Name: presupuesto_importacion_divisa_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_divisa_id_fkey FOREIGN KEY (divisa_id) REFERENCES public.divisas(divisa_id);


--
-- Name: presupuesto_importacion_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_importacion
    ADD CONSTRAINT presupuesto_importacion_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_partida_acciones_accion_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_accion_id_fkey FOREIGN KEY (accion_id) REFERENCES public.acciones(accion_id);


--
-- Name: presupuesto_partida_acciones_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partida_acciones
    ADD CONSTRAINT presupuesto_partida_acciones_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: presupuesto_partidas_partida_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_partida_id_fkey FOREIGN KEY (partida_id) REFERENCES public.partidas(partida_id);


--
-- Name: presupuesto_partidas_presupuesto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_partidas
    ADD CONSTRAINT presupuesto_partidas_presupuesto_id_fkey FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos(presupuesto_id);


--
-- Name: presupuesto_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- Name: presupuesto_productos_unidad_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY presupuesto_productos
    ADD CONSTRAINT presupuesto_productos_unidad_id_fkey FOREIGN KEY (unidad_id) REFERENCES public.unidades(unidad_id);


--
-- Name: procedimientos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY procedimientos
    ADD CONSTRAINT procedimientos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proveedores_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: proyectos_ente_organo_id_fkey; Type: FK CONSTRAINT; Schema: trimestre4; Owner: eureka
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id) REFERENCES public.entes_organos(ente_organo_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: eureka
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM eureka;
GRANT ALL ON SCHEMA public TO eureka;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: trimestre1; Type: ACL; Schema: -; Owner: eureka
--

REVOKE ALL ON SCHEMA trimestre1 FROM PUBLIC;
REVOKE ALL ON SCHEMA trimestre1 FROM eureka;
GRANT ALL ON SCHEMA trimestre1 TO eureka;
GRANT ALL ON SCHEMA trimestre1 TO postgres;
GRANT ALL ON SCHEMA trimestre1 TO PUBLIC;


--
-- Name: trimestre2; Type: ACL; Schema: -; Owner: eureka
--

REVOKE ALL ON SCHEMA trimestre2 FROM PUBLIC;
REVOKE ALL ON SCHEMA trimestre2 FROM eureka;
GRANT ALL ON SCHEMA trimestre2 TO eureka;
GRANT ALL ON SCHEMA trimestre2 TO PUBLIC;


--
-- Name: trimestre3; Type: ACL; Schema: -; Owner: eureka
--

REVOKE ALL ON SCHEMA trimestre3 FROM PUBLIC;
REVOKE ALL ON SCHEMA trimestre3 FROM eureka;
GRANT ALL ON SCHEMA trimestre3 TO eureka;
GRANT ALL ON SCHEMA trimestre3 TO PUBLIC;


--
-- Name: trimestre4; Type: ACL; Schema: -; Owner: eureka
--

REVOKE ALL ON SCHEMA trimestre4 FROM PUBLIC;
REVOKE ALL ON SCHEMA trimestre4 FROM eureka;
GRANT ALL ON SCHEMA trimestre4 TO eureka;
GRANT ALL ON SCHEMA trimestre4 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

