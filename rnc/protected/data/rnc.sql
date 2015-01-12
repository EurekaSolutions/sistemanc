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

--
-- Name: enum_caja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_caja AS ENUM (
    'caja',
    'caja chica'
);


ALTER TYPE public.enum_caja OWNER TO postgres;

--
-- Name: enum_gastos; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_gastos AS ENUM (
    'Intereses',
    'Arrendamiento de bienes inmuebles',
    'Arrendamiento de bienes muebles',
    'Pólizas de seguro',
    'Fianza Fiel cumplimiento',
    'Fianza garantía laboral',
    'Otros pagos anticipado (Especificar)',
    'Existencia artículos de oficina',
    'Existencia artículos de limpieza',
    'Otras existencias (Especificar)'
);


ALTER TYPE public.enum_gastos OWNER TO postgres;

--
-- Name: enum_inventario; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_inventario AS ENUM (
    'Materias primas',
    'Productos en proceso',
    'Productos terminados',
    'Materiales y suministros',
    'Repuestos, accesorios y herramientas',
    'Material de empaque y embalaje',
    'Mercancías',
    'Servicios en proceso',
    'Otros inventarios'
);


ALTER TYPE public.enum_inventario OWNER TO postgres;

--
-- Name: enum_islr; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_islr AS ENUM (
    'Declaración estimada',
    'Retenido por clientes',
    'Otros créditos fiscales'
);


ALTER TYPE public.enum_islr OWNER TO postgres;

--
-- Name: enum_iva_otros; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_iva_otros AS ENUM (
    'Excedente de crédito fiscal',
    'Retenido por clientes',
    'Otros créditos fiscales',
    'Otros tributos pagados por anticipado'
);


ALTER TYPE public.enum_iva_otros OWNER TO postgres;

--
-- Name: enum_meses; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_meses AS ENUM (
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
);


ALTER TYPE public.enum_meses OWNER TO postgres;

--
-- Name: enum_otros_activos; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_otros_activos AS ENUM (
    'Corrientes',
    'No Corrientes'
);


ALTER TYPE public.enum_otros_activos OWNER TO postgres;

--
-- Name: enum_sector; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_sector AS ENUM (
    'Privado',
    'Publico'
);


ALTER TYPE public.enum_sector OWNER TO postgres;

--
-- Name: enum_tipo_propiedad; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_tipo_propiedad AS ENUM (
    'Terreno',
    'Edificio'
);


ALTER TYPE public.enum_tipo_propiedad OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bancos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE bancos (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    rif character varying(100) NOT NULL
);


ALTER TABLE public.bancos OWNER TO eureka;

--
-- Name: COLUMN bancos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos.id IS 'Clave primaria';


--
-- Name: COLUMN bancos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos.nombre IS 'Nombre del banco';


--
-- Name: COLUMN bancos.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos.rif IS 'Rif del banco';


--
-- Name: Bancos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE "Bancos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Bancos_id_seq" OWNER TO eureka;

--
-- Name: Bancos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE "Bancos_id_seq" OWNED BY bancos.id;


--
-- Name: accionistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE accionistas (
    id integer NOT NULL,
    persona_natural_id integer NOT NULL,
    contratista_id integer NOT NULL,
    otras_cuentas_pagar_id integer NOT NULL
);


ALTER TABLE public.accionistas OWNER TO eureka;

--
-- Name: TABLE accionistas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE accionistas IS 'Accionistas de la contratista';


--
-- Name: COLUMN accionistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas.id IS 'Clave primaria';


--
-- Name: COLUMN accionistas.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas.persona_natural_id IS 'Clave foranea a "id" en la tabla persona_natural';


--
-- Name: COLUMN accionistas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas.contratista_id IS 'Clave foranea a "id" en la tabla contratistas';


--
-- Name: COLUMN accionistas.otras_cuentas_pagar_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas.otras_cuentas_pagar_id IS 'Clave foránea a la tabla otras_cuentas_pagar';


--
-- Name: accionistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE accionistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accionistas_id_seq OWNER TO eureka;

--
-- Name: accionistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE accionistas_id_seq OWNED BY accionistas.id;


--
-- Name: otros_activos_pasivos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE otros_activos_pasivos (
    id integer NOT NULL,
    ref_proveedor_ppal character varying(255) NOT NULL,
    saldo_per_ant numeric(38,6) NOT NULL,
    impt_contratado_per character varying(255) NOT NULL,
    reintegro_ap_am character varying(255) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    corriente boolean NOT NULL,
    tipo character(1),
    soporte_distinto boolean,
    ano date NOT NULL
);


ALTER TABLE public.otros_activos_pasivos OWNER TO eureka;

--
-- Name: COLUMN otros_activos_pasivos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.id IS 'Clave primaria';


--
-- Name: COLUMN otros_activos_pasivos.ref_proveedor_ppal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.ref_proveedor_ppal IS 'Referencia o Proveedor Principal';


--
-- Name: COLUMN otros_activos_pasivos.saldo_per_ant; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.saldo_per_ant IS 'Saldo del Período Anterior';


--
-- Name: COLUMN otros_activos_pasivos.impt_contratado_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.impt_contratado_per IS 'Importe Contratado en el período';


--
-- Name: COLUMN otros_activos_pasivos.reintegro_ap_am; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.reintegro_ap_am IS 'Reintegro Aplicación o Amortización';


--
-- Name: COLUMN otros_activos_pasivos.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.saldo_contabilidad IS 'Saldo según Contabilidad';


--
-- Name: COLUMN otros_activos_pasivos.corriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.corriente IS 'Indica si es Corriente o No corriente';


--
-- Name: COLUMN otros_activos_pasivos.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.tipo IS 'Indica si es Activo(A) o Pasivo(P)';


--
-- Name: COLUMN otros_activos_pasivos.soporte_distinto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.soporte_distinto IS 'No facturado o con soporte distinto de facturas o contratos';


--
-- Name: COLUMN otros_activos_pasivos.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_activos_pasivos.ano IS 'Año';


--
-- Name: activos_pasivos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE activos_pasivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activos_pasivos_id_seq OWNER TO eureka;

--
-- Name: activos_pasivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE activos_pasivos_id_seq OWNED BY otros_activos_pasivos.id;


--
-- Name: bancos_contratistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE bancos_contratistas (
    id integer NOT NULL,
    banco_id integer NOT NULL,
    contratista_id integer NOT NULL,
    num_cuenta character varying(150),
    ano date
);


ALTER TABLE public.bancos_contratistas OWNER TO eureka;

--
-- Name: COLUMN bancos_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.id IS 'Clave primaria';


--
-- Name: COLUMN bancos_contratistas.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.banco_id IS 'Clave foranea a la tabla Banco';


--
-- Name: COLUMN bancos_contratistas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.contratista_id IS 'Clave foranea a la tabla Contratista';


--
-- Name: COLUMN bancos_contratistas.num_cuenta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.num_cuenta IS 'Número de cuenta bancaria';


--
-- Name: COLUMN bancos_contratistas.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.ano IS 'Año cargado';


--
-- Name: bancos_contratistas_contratista_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE bancos_contratistas_contratista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bancos_contratistas_contratista_id_seq OWNER TO eureka;

--
-- Name: bancos_contratistas_contratista_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE bancos_contratistas_contratista_id_seq OWNED BY bancos_contratistas.contratista_id;


--
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE bancos_contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bancos_contratistas_id_seq OWNER TO eureka;

--
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE bancos_contratistas_id_seq OWNED BY bancos_contratistas.id;


--
-- Name: capital_social; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE capital_social (
    id integer NOT NULL,
    concepto character varying(255) NOT NULL,
    fecha_aporte date NOT NULL,
    fecha_origen date NOT NULL,
    aporte_accionistas numeric(38,6) NOT NULL,
    incr_correc_monetaria numeric(38,6) NOT NULL,
    ajuste_inflacion numeric(38,6) NOT NULL,
    total_cs_azdo numeric(38,6) NOT NULL,
    primas_descuentos numeric(38,6) NOT NULL,
    acciones_tesoreria numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.capital_social OWNER TO eureka;

--
-- Name: TABLE capital_social; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE capital_social IS 'Capital Social';


--
-- Name: COLUMN capital_social.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.id IS 'Clave primaria';


--
-- Name: COLUMN capital_social.concepto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.concepto IS 'Concepto';


--
-- Name: COLUMN capital_social.fecha_aporte; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.fecha_aporte IS 'Fecha de Aporte';


--
-- Name: COLUMN capital_social.fecha_origen; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.fecha_origen IS 'Fecha de origen';


--
-- Name: COLUMN capital_social.aporte_accionistas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.aporte_accionistas IS 'Aporte de los Accionistas';


--
-- Name: COLUMN capital_social.incr_correc_monetaria; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.incr_correc_monetaria IS 'Incremento corrección monetaria';


--
-- Name: COLUMN capital_social.ajuste_inflacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.ajuste_inflacion IS 'Ajuste por inflación';


--
-- Name: COLUMN capital_social.total_cs_azdo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.total_cs_azdo IS 'Total Capital Social Actualizado';


--
-- Name: COLUMN capital_social.primas_descuentos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.primas_descuentos IS 'Primas o descuentos';


--
-- Name: COLUMN capital_social.acciones_tesoreria; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.acciones_tesoreria IS 'Acciones en tesorería';


--
-- Name: COLUMN capital_social.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capital_social.ano IS 'Año';


--
-- Name: capital_social_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE capital_social_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capital_social_id_seq OWNER TO eureka;

--
-- Name: capital_social_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE capital_social_id_seq OWNED BY capital_social.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE clientes (
    id integer NOT NULL,
    nombre character varying(255)
);


ALTER TABLE public.clientes OWNER TO eureka;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO eureka;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE clientes_id_seq OWNED BY clientes.id;


--
-- Name: contratistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE contratistas (
    id integer NOT NULL,
    empresa_id integer NOT NULL
);


ALTER TABLE public.contratistas OWNER TO eureka;

--
-- Name: COLUMN contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.id IS 'Clave primaria';


--
-- Name: COLUMN contratistas.empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.empresa_id IS 'Empresa la cual es una contratista';


--
-- Name: contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratistas_id_seq OWNER TO eureka;

--
-- Name: contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE contratistas_id_seq OWNED BY contratistas.id;


--
-- Name: cts_pagar_comerciales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE cts_pagar_comerciales (
    id integer NOT NULL,
    condiciones character varying(255) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    tipo enum_otros_activos NOT NULL,
    proveedor_id integer NOT NULL
);


ALTER TABLE public.cts_pagar_comerciales OWNER TO eureka;

--
-- Name: COLUMN cts_pagar_comerciales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cts_pagar_comerciales.id IS 'Clave primaria';


--
-- Name: COLUMN cts_pagar_comerciales.condiciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cts_pagar_comerciales.condiciones IS 'Condiciones';


--
-- Name: COLUMN cts_pagar_comerciales.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cts_pagar_comerciales.saldo_contabilidad IS 'Saldo según Contabilidad';


--
-- Name: COLUMN cts_pagar_comerciales.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cts_pagar_comerciales.tipo IS 'Tipo de activo';


--
-- Name: COLUMN cts_pagar_comerciales.proveedor_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cts_pagar_comerciales.proveedor_id IS 'Proveedor';


--
-- Name: cts_pagar_comerciales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE cts_pagar_comerciales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cts_pagar_comerciales_id_seq OWNER TO eureka;

--
-- Name: cts_pagar_comerciales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cts_pagar_comerciales_id_seq OWNED BY cts_pagar_comerciales.id;


--
-- Name: cuentas_cobrar_contrato; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE cuentas_cobrar_contrato (
    id integer NOT NULL,
    condiciones character varying(255) NOT NULL,
    num_contrato character varying(100) NOT NULL,
    porcentaje_avance character varying(50) NOT NULL,
    plazo_contrato character varying(100) NOT NULL,
    saldo_cont_corriente numeric(38,6) NOT NULL,
    saldo_cont_ncorriente numeric(38,6) NOT NULL,
    contratista_id integer NOT NULL,
    ano date NOT NULL,
    cliente_id integer
);


ALTER TABLE public.cuentas_cobrar_contrato OWNER TO eureka;

--
-- Name: COLUMN cuentas_cobrar_contrato.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.id IS 'Clave primaria';


--
-- Name: COLUMN cuentas_cobrar_contrato.num_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.num_contrato IS 'Número de contrato';


--
-- Name: COLUMN cuentas_cobrar_contrato.porcentaje_avance; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.porcentaje_avance IS 'Porcentaje de avance';


--
-- Name: COLUMN cuentas_cobrar_contrato.saldo_cont_corriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.saldo_cont_corriente IS 'Saldo según contabilidad corriente';


--
-- Name: COLUMN cuentas_cobrar_contrato.saldo_cont_ncorriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.saldo_cont_ncorriente IS 'Saldo según contabilidad no corriente';


--
-- Name: COLUMN cuentas_cobrar_contrato.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- Name: COLUMN cuentas_cobrar_contrato.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.ano IS 'Año a cargar';


--
-- Name: COLUMN cuentas_cobrar_contrato.cliente_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.cliente_id IS 'Clave foranea a la tabla Clientes';


--
-- Name: cuentas_cobrar_contrato_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE cuentas_cobrar_contrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuentas_cobrar_contrato_id_seq OWNER TO eureka;

--
-- Name: cuentas_cobrar_contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cuentas_cobrar_contrato_id_seq OWNED BY cuentas_cobrar_contrato.id;


--
-- Name: cuentas_cobrar_scontrato; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE cuentas_cobrar_scontrato (
    id integer NOT NULL,
    condiciones character varying(255) NOT NULL,
    saldo_conta_corriente numeric(38,6) NOT NULL,
    saldo_conta_ncorriente numeric(38,6) NOT NULL,
    contratista_id integer NOT NULL,
    ano date NOT NULL,
    cliente_id integer NOT NULL
);


ALTER TABLE public.cuentas_cobrar_scontrato OWNER TO eureka;

--
-- Name: COLUMN cuentas_cobrar_scontrato.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.id IS 'Clave primaria';


--
-- Name: COLUMN cuentas_cobrar_scontrato.saldo_conta_corriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.saldo_conta_corriente IS 'Saldo según contabilidad corriente';


--
-- Name: COLUMN cuentas_cobrar_scontrato.saldo_conta_ncorriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.saldo_conta_ncorriente IS 'Saldo según contabilidad no corriente';


--
-- Name: COLUMN cuentas_cobrar_scontrato.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- Name: COLUMN cuentas_cobrar_scontrato.cliente_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.cliente_id IS 'Clave foranea a la tabla Clientes';


--
-- Name: cuentas_cobrar_scontrato_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE cuentas_cobrar_scontrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuentas_cobrar_scontrato_id_seq OWNER TO eureka;

--
-- Name: cuentas_cobrar_scontrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cuentas_cobrar_scontrato_id_seq OWNED BY cuentas_cobrar_scontrato.id;


--
-- Name: cuentas_cobro_dudoso; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE cuentas_cobro_dudoso (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    cliente_id integer NOT NULL,
    cta_cobrar30 numeric(38,6) NOT NULL,
    cta_cobrar60 numeric(38,6) NOT NULL,
    cta_cobrar90 numeric(38,6) NOT NULL,
    cta_cobrar_m numeric(38,6) NOT NULL,
    estimacion character varying(100) NOT NULL,
    saldo_conta_corriente numeric(38,6) NOT NULL,
    saldo_conta_ncorriente numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.cuentas_cobro_dudoso OWNER TO eureka;

--
-- Name: COLUMN cuentas_cobro_dudoso.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.id IS 'Clave primaria';


--
-- Name: COLUMN cuentas_cobro_dudoso.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- Name: COLUMN cuentas_cobro_dudoso.cliente_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cliente_id IS 'Clave foranea a la tabla Cliente';


--
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar30; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar30 IS 'Saldos cuentas por cobrar de 0 a 30 dias';


--
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar60; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar60 IS 'Saldos cuentas por cobrar de 31  a 60 dias';


--
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar90; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar90 IS 'Saldos cuentas por cobrar de 61  a 90 dias';


--
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar_m; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar_m IS 'Saldos cuentas por cobrar mas de 90 dias';


--
-- Name: COLUMN cuentas_cobro_dudoso.saldo_conta_corriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.saldo_conta_corriente IS 'Saldo según contabilidad corriente';


--
-- Name: COLUMN cuentas_cobro_dudoso.saldo_conta_ncorriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.saldo_conta_ncorriente IS 'Saldo según contabilidad no corriente';


--
-- Name: cuentas_cobro_dudoso_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE cuentas_cobro_dudoso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuentas_cobro_dudoso_id_seq OWNER TO eureka;

--
-- Name: cuentas_cobro_dudoso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cuentas_cobro_dudoso_id_seq OWNED BY cuentas_cobro_dudoso.id;


--
-- Name: otras_cuentas_cobrar; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE otras_cuentas_cobrar (
    id integer NOT NULL,
    deudor_id integer,
    nombre character varying(255) NOT NULL,
    origen character varying(255) NOT NULL,
    fecha time without time zone NOT NULL,
    garantia character varying(255) NOT NULL,
    plazo character varying(255) NOT NULL,
    saldo_contabilidad_c numeric(38,6) NOT NULL,
    saldo_contabilidad_nc numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.otras_cuentas_cobrar OWNER TO eureka;

--
-- Name: COLUMN otras_cuentas_cobrar.saldo_contabilidad_c; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_cobrar.saldo_contabilidad_c IS 'Saldo según Contabilidad CORRIENTE';


--
-- Name: COLUMN otras_cuentas_cobrar.saldo_contabilidad_nc; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_cobrar.saldo_contabilidad_nc IS 'Saldo según Contabilidad NO CORRIENTE';


--
-- Name: cuentas_por_cobrar_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE cuentas_por_cobrar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuentas_por_cobrar_id_seq OWNER TO eureka;

--
-- Name: cuentas_por_cobrar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cuentas_por_cobrar_id_seq OWNED BY otras_cuentas_cobrar.id;


--
-- Name: deudor; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE deudor (
    id integer NOT NULL,
    otras_cuentas_pagar_id integer NOT NULL
);


ALTER TABLE public.deudor OWNER TO eureka;

--
-- Name: COLUMN deudor.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN deudor.id IS 'Clave primaria';


--
-- Name: COLUMN deudor.otras_cuentas_pagar_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN deudor.otras_cuentas_pagar_id IS 'Clave foránea a la tabla otras_cuentas_pagar';


--
-- Name: deudor_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE deudor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deudor_id_seq OWNER TO eureka;

--
-- Name: deudor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE deudor_id_seq OWNED BY deudor.id;


--
-- Name: directores; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE directores (
    id integer NOT NULL,
    persona_natural_id integer NOT NULL,
    contratista_id integer NOT NULL,
    otras_cuentas_pagar_id integer NOT NULL
);


ALTER TABLE public.directores OWNER TO eureka;

--
-- Name: TABLE directores; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE directores IS 'Directores Administradores de una contratista';


--
-- Name: COLUMN directores.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.id IS 'Clave primaria';


--
-- Name: COLUMN directores.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.persona_natural_id IS 'Persona natural';


--
-- Name: COLUMN directores.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.contratista_id IS 'Contratista';


--
-- Name: COLUMN directores.otras_cuentas_pagar_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.otras_cuentas_pagar_id IS 'Clave foránea a la tabla otras_cuentas_pagar';


--
-- Name: directores_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE directores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directores_id_seq OWNER TO eureka;

--
-- Name: directores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE directores_id_seq OWNED BY directores.id;


--
-- Name: efectivo_banco; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE efectivo_banco (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    banco_id integer NOT NULL,
    saldo_banco numeric(38,6) NOT NULL,
    depos_transito numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    che_transito numeric(38,6) NOT NULL,
    nd_contabilizadas numeric(38,6) NOT NULL,
    nc_contabilizadas numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.efectivo_banco OWNER TO eureka;

--
-- Name: COLUMN efectivo_banco.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.id IS 'Clave primaria';


--
-- Name: COLUMN efectivo_banco.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- Name: COLUMN efectivo_banco.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.banco_id IS 'Clave primaria a la tabla Banco';


--
-- Name: COLUMN efectivo_banco.saldo_banco; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.saldo_banco IS 'Saldo según bancos';


--
-- Name: COLUMN efectivo_banco.depos_transito; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.depos_transito IS 'Depositos en transito';


--
-- Name: COLUMN efectivo_banco.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- Name: COLUMN efectivo_banco.che_transito; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.che_transito IS 'Cheques en tránsito';


--
-- Name: COLUMN efectivo_banco.nd_contabilizadas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.nd_contabilizadas IS 'ND no contabilizadas errores/DB';


--
-- Name: COLUMN efectivo_banco.nc_contabilizadas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_banco.nc_contabilizadas IS 'NC no contabilizadas errores/Cr';


--
-- Name: efectivo_banco_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE efectivo_banco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.efectivo_banco_id_seq OWNER TO eureka;

--
-- Name: efectivo_banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE efectivo_banco_id_seq OWNED BY efectivo_banco.id;


--
-- Name: efectivo_caja; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE efectivo_caja (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    principal numeric(38,6) NOT NULL,
    produccion numeric(38,6) NOT NULL,
    venta numeric(38,6) NOT NULL,
    administracion numeric(38,6) NOT NULL,
    otras numeric(38,6) NOT NULL,
    ano date NOT NULL,
    tipo enum_caja NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL
);


ALTER TABLE public.efectivo_caja OWNER TO eureka;

--
-- Name: COLUMN efectivo_caja.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.id IS 'Clave primaria';


--
-- Name: COLUMN efectivo_caja.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- Name: COLUMN efectivo_caja.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.tipo IS 'Caja/Caja chica';


--
-- Name: COLUMN efectivo_caja.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- Name: efectivo_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE efectivo_caja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.efectivo_caja_id_seq OWNER TO eureka;

--
-- Name: efectivo_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE efectivo_caja_id_seq OWNED BY efectivo_caja.id;


--
-- Name: empleados; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE empleados (
    id integer NOT NULL,
    cargo character varying(255),
    contratista_id integer NOT NULL,
    persona_natural_id integer NOT NULL,
    otras_cuentas_pagar_id integer NOT NULL
);


ALTER TABLE public.empleados OWNER TO eureka;

--
-- Name: COLUMN empleados.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empleados.id IS 'Clave primaria';


--
-- Name: COLUMN empleados.cargo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empleados.cargo IS 'Cargo del empleado';


--
-- Name: COLUMN empleados.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empleados.persona_natural_id IS 'Persona Natural';


--
-- Name: COLUMN empleados.otras_cuentas_pagar_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empleados.otras_cuentas_pagar_id IS 'Clave foránea a la tabla otras_cuentas_pagar';


--
-- Name: empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_id_seq OWNER TO eureka;

--
-- Name: empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE empleado_id_seq OWNED BY empleados.id;


--
-- Name: empresas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE empresas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    rif character varying(255) NOT NULL
);


ALTER TABLE public.empresas OWNER TO eureka;

--
-- Name: empresas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresas_id_seq OWNER TO eureka;

--
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE empresas_id_seq OWNED BY empresas.id;


--
-- Name: empresas_relacionadas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE empresas_relacionadas (
    id integer NOT NULL,
    empresa_id integer NOT NULL,
    contratista_id integer NOT NULL,
    otras_cuentas_pagar_id integer NOT NULL
);


ALTER TABLE public.empresas_relacionadas OWNER TO eureka;

--
-- Name: COLUMN empresas_relacionadas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.id IS 'Clave primaria';


--
-- Name: COLUMN empresas_relacionadas.empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.empresa_id IS 'Empresa relacionada';


--
-- Name: COLUMN empresas_relacionadas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.contratista_id IS 'Empresa contratista';


--
-- Name: COLUMN empresas_relacionadas.otras_cuentas_pagar_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.otras_cuentas_pagar_id IS 'Clave foránea a la tabla otras_cuentas_pagar';


--
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE empresas_relacionadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresas_relacionadas_id_seq OWNER TO eureka;

--
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE empresas_relacionadas_id_seq OWNED BY empresas_relacionadas.id;


--
-- Name: fondos_reservas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE fondos_reservas (
    id integer NOT NULL,
    concepto character varying(255) NOT NULL,
    fecha_aporte date NOT NULL,
    fecha_origen date NOT NULL,
    val_nominal numeric(38,6) NOT NULL,
    val_constante numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.fondos_reservas OWNER TO eureka;

--
-- Name: COLUMN fondos_reservas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.id IS 'Clave primaria';


--
-- Name: COLUMN fondos_reservas.concepto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.concepto IS 'Concepto';


--
-- Name: COLUMN fondos_reservas.fecha_aporte; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.fecha_aporte IS 'Fecha Aporte';


--
-- Name: COLUMN fondos_reservas.fecha_origen; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.fecha_origen IS 'Fecha Origen';


--
-- Name: COLUMN fondos_reservas.val_nominal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.val_nominal IS 'Fondos y reservas Valor nominal';


--
-- Name: COLUMN fondos_reservas.val_constante; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.val_constante IS 'Fondos y reservas Valor Constante';


--
-- Name: COLUMN fondos_reservas.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.ano IS 'Año';


--
-- Name: fondos_reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE fondos_reservas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fondos_reservas_id_seq OWNER TO eureka;

--
-- Name: fondos_reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE fondos_reservas_id_seq OWNED BY fondos_reservas.id;


--
-- Name: gastos_pag_ant; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE gastos_pag_ant (
    id integer NOT NULL,
    gastos enum_gastos NOT NULL,
    ref_proveedor_ppal character varying(255) NOT NULL,
    saldo_per_ant numeric(38,6) NOT NULL,
    importe_contratado_per numeric(38,6) NOT NULL,
    reintegro_apli_amorti numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.gastos_pag_ant OWNER TO eureka;

--
-- Name: COLUMN gastos_pag_ant.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_pag_ant.id IS 'Clave primaria';


--
-- Name: COLUMN gastos_pag_ant.gastos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_pag_ant.gastos IS 'Gastos pagados por anticipado';


--
-- Name: COLUMN gastos_pag_ant.ref_proveedor_ppal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_pag_ant.ref_proveedor_ppal IS 'Referencia Proveedor Principal';


--
-- Name: COLUMN gastos_pag_ant.saldo_per_ant; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_pag_ant.saldo_per_ant IS 'Saldo del Período Anterior';


--
-- Name: COLUMN gastos_pag_ant.importe_contratado_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_pag_ant.importe_contratado_per IS 'Importe Contratado en el período';


--
-- Name: COLUMN gastos_pag_ant.reintegro_apli_amorti; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_pag_ant.reintegro_apli_amorti IS 'Reintegro Aplicación o Amortización';


--
-- Name: COLUMN gastos_pag_ant.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_pag_ant.saldo_contabilidad IS 'Saldo según Contabilidad';


--
-- Name: gastos_pag_ant_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE gastos_pag_ant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gastos_pag_ant_id_seq OWNER TO eureka;

--
-- Name: gastos_pag_ant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE gastos_pag_ant_id_seq OWNED BY gastos_pag_ant.id;


--
-- Name: gastos_tributos_pasivos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE gastos_tributos_pasivos (
    id integer NOT NULL,
    saldo_per_anterior numeric(38,6) NOT NULL,
    importe_gasto_per numeric(38,6) NOT NULL,
    importe_pago_per numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL
);


ALTER TABLE public.gastos_tributos_pasivos OWNER TO eureka;

--
-- Name: TABLE gastos_tributos_pasivos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE gastos_tributos_pasivos IS 'Contiene las columnas comunes entre Otros tributos por pagar y Pasivo Laboral';


--
-- Name: COLUMN gastos_tributos_pasivos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_tributos_pasivos.id IS 'Clave primaria';


--
-- Name: COLUMN gastos_tributos_pasivos.saldo_per_anterior; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_tributos_pasivos.saldo_per_anterior IS 'Saldo Período Anterior';


--
-- Name: COLUMN gastos_tributos_pasivos.importe_gasto_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_tributos_pasivos.importe_gasto_per IS 'Importe Gasto del período';


--
-- Name: COLUMN gastos_tributos_pasivos.importe_pago_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_tributos_pasivos.importe_pago_per IS 'Importe Pago del período';


--
-- Name: COLUMN gastos_tributos_pasivos.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN gastos_tributos_pasivos.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- Name: gastos_tributos_pasivos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE gastos_tributos_pasivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gastos_tributos_pasivos_id_seq OWNER TO eureka;

--
-- Name: gastos_tributos_pasivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE gastos_tributos_pasivos_id_seq OWNED BY gastos_tributos_pasivos.id;


--
-- Name: ingresos_iva_islr; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE ingresos_iva_islr (
    id integer NOT NULL,
    certificado_electronico character varying(255) NOT NULL,
    sujetos_iva numeric(38,6) NOT NULL,
    no_sujetos_iva numeric(38,6) NOT NULL,
    total_libro_venta numeric(38,6) NOT NULL,
    ano date NOT NULL,
    mes enum_meses NOT NULL
);


ALTER TABLE public.ingresos_iva_islr OWNER TO eureka;

--
-- Name: TABLE ingresos_iva_islr; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE ingresos_iva_islr IS 'Relación de ingresos según declaraciones IVA y conciliación con los ingresos según la declaración ISLR';


--
-- Name: COLUMN ingresos_iva_islr.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_iva_islr.id IS 'Clave primaria';


--
-- Name: COLUMN ingresos_iva_islr.certificado_electronico; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_iva_islr.certificado_electronico IS 'Certificado Electrónico';


--
-- Name: COLUMN ingresos_iva_islr.sujetos_iva; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_iva_islr.sujetos_iva IS 'Ingresos sujetos a IVA';


--
-- Name: COLUMN ingresos_iva_islr.no_sujetos_iva; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_iva_islr.no_sujetos_iva IS 'Igresos no Sujetos a IVA';


--
-- Name: COLUMN ingresos_iva_islr.total_libro_venta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_iva_islr.total_libro_venta IS 'Ingresos Totales según Libro Venta';


--
-- Name: COLUMN ingresos_iva_islr.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_iva_islr.ano IS 'Año';


--
-- Name: COLUMN ingresos_iva_islr.mes; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_iva_islr.mes IS 'Mes del periodo';


--
-- Name: ingresos_iva_islr_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE ingresos_iva_islr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingresos_iva_islr_id_seq OWNER TO eureka;

--
-- Name: ingresos_iva_islr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE ingresos_iva_islr_id_seq OWNED BY ingresos_iva_islr.id;


--
-- Name: ingresos_operacionales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE ingresos_operacionales (
    id integer NOT NULL,
    num_contrato integer,
    sector enum_sector NOT NULL,
    venta numeric(38,6) NOT NULL,
    servicio numeric(38,6) NOT NULL,
    obra numeric(38,6) NOT NULL,
    porcentaje_avance numeric(38,6) NOT NULL,
    otras_operaciones numeric(38,6) NOT NULL
);


ALTER TABLE public.ingresos_operacionales OWNER TO eureka;

--
-- Name: TABLE ingresos_operacionales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE ingresos_operacionales IS 'Ingresos Operacionales';


--
-- Name: COLUMN ingresos_operacionales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.id IS 'Clave primaria';


--
-- Name: COLUMN ingresos_operacionales.num_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.num_contrato IS 'Número de contrato';


--
-- Name: COLUMN ingresos_operacionales.sector; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.sector IS 'Sector Privado o Sector Público';


--
-- Name: COLUMN ingresos_operacionales.venta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.venta IS 'Venta';


--
-- Name: COLUMN ingresos_operacionales.servicio; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.servicio IS 'Servicio';


--
-- Name: COLUMN ingresos_operacionales.obra; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.obra IS 'Obra';


--
-- Name: COLUMN ingresos_operacionales.porcentaje_avance; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.porcentaje_avance IS 'Porcentaje de Avance';


--
-- Name: COLUMN ingresos_operacionales.otras_operaciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN ingresos_operacionales.otras_operaciones IS 'Otras Operaciones';


--
-- Name: ingresos_operacionales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE ingresos_operacionales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingresos_operacionales_id_seq OWNER TO eureka;

--
-- Name: ingresos_operacionales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE ingresos_operacionales_id_seq OWNED BY ingresos_operacionales.id;


--
-- Name: inventarios; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE inventarios (
    id integer NOT NULL,
    tec_med_costo character varying(255) NOT NULL,
    for_cal_costo character varying(255) NOT NULL,
    costo_adquisicion numeric(38,6) NOT NULL,
    ajuste_inflacion character varying(255) NOT NULL,
    reverso_deterioro character varying(255) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    inventario enum_inventario NOT NULL
);


ALTER TABLE public.inventarios OWNER TO eureka;

--
-- Name: COLUMN inventarios.tec_med_costo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inventarios.tec_med_costo IS 'Técnica de Medición del Costo';


--
-- Name: COLUMN inventarios.for_cal_costo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inventarios.for_cal_costo IS 'Fórmula de cálculo del Costo';


--
-- Name: COLUMN inventarios.costo_adquisicion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inventarios.costo_adquisicion IS 'Costo de adqusición o producción';


--
-- Name: COLUMN inventarios.ajuste_inflacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inventarios.ajuste_inflacion IS 'Ajuste por inflacion';


--
-- Name: COLUMN inventarios.reverso_deterioro; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inventarios.reverso_deterioro IS 'Reverso del deterioro (Deterioro)';


--
-- Name: COLUMN inventarios.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inventarios.saldo_contabilidad IS 'Saldo según Contabilidad';


--
-- Name: COLUMN inventarios.inventario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inventarios.inventario IS 'Inventario';


--
-- Name: inventario_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE inventario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventario_id_seq OWNER TO eureka;

--
-- Name: inventario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inventario_id_seq OWNED BY inventarios.id;


--
-- Name: inversiones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE inversiones (
    id integer NOT NULL,
    banco_id integer NOT NULL,
    condiciones character varying(250) NOT NULL,
    costo_adquisicion numeric(38,6) NOT NULL,
    valor_desvalorizacion numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    contratista_id integer NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.inversiones OWNER TO eureka;

--
-- Name: COLUMN inversiones.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.banco_id IS 'Clave foranea a la tabla Bancos';


--
-- Name: COLUMN inversiones.valor_desvalorizacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.valor_desvalorizacion IS 'Valorización desvalorización';


--
-- Name: COLUMN inversiones.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- Name: COLUMN inversiones.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- Name: inversiones_act_corr; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE inversiones_act_corr (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    instrumento character varying(255) NOT NULL,
    condiciones character varying(255) NOT NULL,
    costo_adquisicion numeric(38,6) NOT NULL,
    ajuste_inflacion numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    ano date NOT NULL,
    perdida_valor numeric(38,6) NOT NULL,
    tipo character varying(255) NOT NULL,
    empresa_id integer NOT NULL
);


ALTER TABLE public.inversiones_act_corr OWNER TO eureka;

--
-- Name: COLUMN inversiones_act_corr.ajuste_inflacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.ajuste_inflacion IS 'Ajuste por inflación';


--
-- Name: COLUMN inversiones_act_corr.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- Name: COLUMN inversiones_act_corr.perdida_valor; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.perdida_valor IS 'Pérdida por deterioro del valor';


--
-- Name: COLUMN inversiones_act_corr.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.tipo IS 'Clasificadas como activo corriente
Clasificadas como activo no corriente Disponibles para la venta y mantenidas hasta el vencimiento';


--
-- Name: COLUMN inversiones_act_corr.empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.empresa_id IS 'Clave foranea a la tabla Empresas';


--
-- Name: inversiones1_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE inversiones1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inversiones1_id_seq OWNER TO eureka;

--
-- Name: inversiones1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inversiones1_id_seq OWNED BY inversiones_act_corr.id;


--
-- Name: inversiones_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE inversiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inversiones_id_seq OWNER TO eureka;

--
-- Name: inversiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inversiones_id_seq OWNED BY inversiones.id;


--
-- Name: inversiones_subsi; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE inversiones_subsi (
    instrumento character varying(255) NOT NULL,
    condiciones character varying(255) NOT NULL,
    porcentaje_participacion character varying(255) NOT NULL,
    costo_adquisicion numeric(38,6) NOT NULL,
    ajuste_inflacion numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    ano date NOT NULL,
    empresa_id integer NOT NULL,
    contratista_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.inversiones_subsi OWNER TO eureka;

--
-- Name: COLUMN inversiones_subsi.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- Name: COLUMN inversiones_subsi.empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.empresa_id IS 'Clave foranea a la tabla Empresas';


--
-- Name: COLUMN inversiones_subsi.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.contratista_id IS 'Clave foranea a la tabla Contratista';


--
-- Name: COLUMN inversiones_subsi.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.id IS 'Clave primaria';


--
-- Name: inversiones_subsi_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE inversiones_subsi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inversiones_subsi_id_seq OWNER TO eureka;

--
-- Name: inversiones_subsi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inversiones_subsi_id_seq OWNED BY inversiones_subsi.id;


--
-- Name: islr_diferido; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE islr_diferido (
    id integer NOT NULL,
    act_pas_tributarios character varying(255) NOT NULL,
    base_financiera character varying(255) NOT NULL,
    base_fiscal character varying(255) NOT NULL,
    diferencia_temporaria numeric(38,6) NOT NULL
);


ALTER TABLE public.islr_diferido OWNER TO eureka;

--
-- Name: TABLE islr_diferido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE islr_diferido IS 'Impuesto sobre la renta diferido';


--
-- Name: COLUMN islr_diferido.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_diferido.id IS 'Clave primaria';


--
-- Name: COLUMN islr_diferido.act_pas_tributarios; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_diferido.act_pas_tributarios IS 'Activos y pasivos con efectos tributarios


';


--
-- Name: COLUMN islr_diferido.base_financiera; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_diferido.base_financiera IS 'Base financiera';


--
-- Name: COLUMN islr_diferido.base_fiscal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_diferido.base_fiscal IS 'Base fiscal';


--
-- Name: COLUMN islr_diferido.diferencia_temporaria; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_diferido.diferencia_temporaria IS 'Diferencia temporaria';


--
-- Name: islr_diferido_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE islr_diferido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.islr_diferido_id_seq OWNER TO eureka;

--
-- Name: islr_diferido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE islr_diferido_id_seq OWNED BY islr_diferido.id;


--
-- Name: islr_pagos_anticipados; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE islr_pagos_anticipados (
    id integer NOT NULL,
    islr enum_islr NOT NULL,
    saldo_per_ant numeric(38,6) NOT NULL,
    importe_pagado_per numeric(38,6) NOT NULL,
    importe_cedido_per numeric(38,6) NOT NULL,
    importe_utilizado_per numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.islr_pagos_anticipados OWNER TO eureka;

--
-- Name: COLUMN islr_pagos_anticipados.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_pagos_anticipados.id IS 'Clave primaria';


--
-- Name: COLUMN islr_pagos_anticipados.islr; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_pagos_anticipados.islr IS 'Impuesto Sobre la Renta';


--
-- Name: COLUMN islr_pagos_anticipados.saldo_per_ant; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_pagos_anticipados.saldo_per_ant IS 'Saldo del Período Anterior';


--
-- Name: COLUMN islr_pagos_anticipados.importe_pagado_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_pagos_anticipados.importe_pagado_per IS 'Importe Pagado en el período';


--
-- Name: COLUMN islr_pagos_anticipados.importe_cedido_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_pagos_anticipados.importe_cedido_per IS 'Importe Cedido en el período';


--
-- Name: COLUMN islr_pagos_anticipados.importe_utilizado_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_pagos_anticipados.importe_utilizado_per IS 'Importe Utilizado en el período';


--
-- Name: COLUMN islr_pagos_anticipados.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN islr_pagos_anticipados.saldo_contabilidad IS 'Saldo según Contabilidad';


--
-- Name: islr_pagos_anticipados_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE islr_pagos_anticipados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.islr_pagos_anticipados_id_seq OWNER TO eureka;

--
-- Name: islr_pagos_anticipados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE islr_pagos_anticipados_id_seq OWNED BY islr_pagos_anticipados.id;


--
-- Name: iva_otros_pag_ant; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE iva_otros_pag_ant (
    id integer NOT NULL,
    iva_otros enum_iva_otros NOT NULL,
    saldo_per_ant numeric(38,6) NOT NULL,
    importe_pagado_per numeric(38,6) NOT NULL,
    importe_cedido_per numeric(38,6) NOT NULL,
    importe_utilizado_per numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.iva_otros_pag_ant OWNER TO eureka;

--
-- Name: COLUMN iva_otros_pag_ant.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva_otros_pag_ant.id IS 'Clave primaria';


--
-- Name: COLUMN iva_otros_pag_ant.iva_otros; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva_otros_pag_ant.iva_otros IS 'IVA y otros tributos';


--
-- Name: COLUMN iva_otros_pag_ant.saldo_per_ant; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva_otros_pag_ant.saldo_per_ant IS 'Saldo del Período Anterior';


--
-- Name: COLUMN iva_otros_pag_ant.importe_pagado_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva_otros_pag_ant.importe_pagado_per IS 'Importe Pagado en el período';


--
-- Name: COLUMN iva_otros_pag_ant.importe_cedido_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva_otros_pag_ant.importe_cedido_per IS 'Importe Cedido en el período';


--
-- Name: COLUMN iva_otros_pag_ant.importe_utilizado_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva_otros_pag_ant.importe_utilizado_per IS 'Importe Utilizado en el período';


--
-- Name: COLUMN iva_otros_pag_ant.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN iva_otros_pag_ant.saldo_contabilidad IS 'Saldo según Contabilidad';


--
-- Name: iva_otros_pag_ant_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE iva_otros_pag_ant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iva_otros_pag_ant_id_seq OWNER TO eureka;

--
-- Name: iva_otros_pag_ant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE iva_otros_pag_ant_id_seq OWNED BY iva_otros_pag_ant.id;


--
-- Name: obligaciones_bancarias; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE obligaciones_bancarias (
    id integer NOT NULL,
    tipo enum_otros_activos NOT NULL,
    obligacion character varying(255) NOT NULL,
    entidad_bancaria character varying(255),
    tasa_interes numeric(38,6) NOT NULL,
    garantia character varying(255) NOT NULL,
    vencimiento date NOT NULL,
    intereses_periodo numeric(38,6) NOT NULL,
    interes_pagar numeric(38,6) NOT NULL,
    importe_deuda numeric(38,6) NOT NULL
);


ALTER TABLE public.obligaciones_bancarias OWNER TO eureka;

--
-- Name: COLUMN obligaciones_bancarias.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.id IS 'Clave primaria';


--
-- Name: COLUMN obligaciones_bancarias.entidad_bancaria; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.entidad_bancaria IS 'Entidad Bancaria';


--
-- Name: COLUMN obligaciones_bancarias.tasa_interes; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.tasa_interes IS 'Tasa de interés';


--
-- Name: COLUMN obligaciones_bancarias.garantia; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.garantia IS 'Garantía';


--
-- Name: COLUMN obligaciones_bancarias.vencimiento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.vencimiento IS 'Vencimiento';


--
-- Name: COLUMN obligaciones_bancarias.intereses_periodo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.intereses_periodo IS 'Interes del período';


--
-- Name: COLUMN obligaciones_bancarias.interes_pagar; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.interes_pagar IS 'Intereses por pagar';


--
-- Name: COLUMN obligaciones_bancarias.importe_deuda; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN obligaciones_bancarias.importe_deuda IS 'Importe de la deuda';


--
-- Name: obligaciones_bancarias_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE obligaciones_bancarias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obligaciones_bancarias_id_seq OWNER TO eureka;

--
-- Name: obligaciones_bancarias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE obligaciones_bancarias_id_seq OWNED BY obligaciones_bancarias.id;


--
-- Name: otras_cts_pagar_otros; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE otras_cts_pagar_otros (
    id integer NOT NULL,
    deudor_id integer NOT NULL,
    otras_cuentas_pagar_id integer NOT NULL
);


ALTER TABLE public.otras_cts_pagar_otros OWNER TO eureka;

--
-- Name: COLUMN otras_cts_pagar_otros.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cts_pagar_otros.id IS 'Clave primaria';


--
-- Name: COLUMN otras_cts_pagar_otros.deudor_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cts_pagar_otros.deudor_id IS 'Clave foranea a "id" en la tabla deudor';


--
-- Name: COLUMN otras_cts_pagar_otros.otras_cuentas_pagar_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cts_pagar_otros.otras_cuentas_pagar_id IS 'Clave foranea a "id" en la tabla otras_cuentas_pagar';


--
-- Name: otras_cts_pagar_otros_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE otras_cts_pagar_otros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otras_cts_pagar_otros_id_seq OWNER TO eureka;

--
-- Name: otras_cts_pagar_otros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE otras_cts_pagar_otros_id_seq OWNED BY otras_cts_pagar_otros.id;


--
-- Name: otras_cuentas_pagar; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE otras_cuentas_pagar (
    id integer NOT NULL,
    fecha date NOT NULL,
    garantia character varying(255) NOT NULL,
    plazo character varying(255) NOT NULL,
    saldo_contabilidad_c numeric(38,6) NOT NULL,
    saldo_contabilidad_nc numeric(38,6) NOT NULL,
    tipo_prestamo character varying(255)
);


ALTER TABLE public.otras_cuentas_pagar OWNER TO eureka;

--
-- Name: COLUMN otras_cuentas_pagar.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_pagar.id IS 'Clave primaria';


--
-- Name: COLUMN otras_cuentas_pagar.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_pagar.fecha IS 'Fecha';


--
-- Name: COLUMN otras_cuentas_pagar.garantia; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_pagar.garantia IS 'Grantía';


--
-- Name: COLUMN otras_cuentas_pagar.plazo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_pagar.plazo IS 'Plazo';


--
-- Name: COLUMN otras_cuentas_pagar.saldo_contabilidad_c; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_pagar.saldo_contabilidad_c IS 'Saldo según Contabilidad Corriente';


--
-- Name: COLUMN otras_cuentas_pagar.saldo_contabilidad_nc; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_pagar.saldo_contabilidad_nc IS 'Saldo según Contabilidad No Corriente';


--
-- Name: COLUMN otras_cuentas_pagar.tipo_prestamo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otras_cuentas_pagar.tipo_prestamo IS 'Tipo de Préstamo o origen?';


--
-- Name: otras_cuentas_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE otras_cuentas_pagar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otras_cuentas_pagar_id_seq OWNER TO eureka;

--
-- Name: otras_cuentas_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE otras_cuentas_pagar_id_seq OWNED BY otras_cuentas_pagar.id;


--
-- Name: otros_cmpts_patr; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE otros_cmpts_patr (
    id integer NOT NULL,
    concepto character varying(255) NOT NULL,
    fecha_aporte date NOT NULL,
    fecha_origen date NOT NULL,
    val_nominal numeric(38,6) NOT NULL,
    ajuste_inflacion numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.otros_cmpts_patr OWNER TO eureka;

--
-- Name: TABLE otros_cmpts_patr; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE otros_cmpts_patr IS 'Otros componentes del patrimonio';


--
-- Name: COLUMN otros_cmpts_patr.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_cmpts_patr.id IS 'Clave primaria';


--
-- Name: COLUMN otros_cmpts_patr.concepto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_cmpts_patr.concepto IS 'Concepto';


--
-- Name: COLUMN otros_cmpts_patr.fecha_aporte; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_cmpts_patr.fecha_aporte IS 'Fecha Aporte';


--
-- Name: COLUMN otros_cmpts_patr.fecha_origen; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_cmpts_patr.fecha_origen IS 'Fecha Origen';


--
-- Name: COLUMN otros_cmpts_patr.val_nominal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_cmpts_patr.val_nominal IS 'Otros componentes del patrimonio Valor Nominal';


--
-- Name: COLUMN otros_cmpts_patr.ajuste_inflacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_cmpts_patr.ajuste_inflacion IS 'Otros componentes del patrimonio Ajuste por Inflación';


--
-- Name: COLUMN otros_cmpts_patr.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_cmpts_patr.ano IS 'Año';


--
-- Name: otros_cmpnts_patr_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE otros_cmpnts_patr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otros_cmpnts_patr_id_seq OWNER TO eureka;

--
-- Name: otros_cmpnts_patr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE otros_cmpnts_patr_id_seq OWNED BY otros_cmpts_patr.id;


--
-- Name: otros_tributos_pagar; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE otros_tributos_pagar (
    id integer NOT NULL,
    tributo character varying(255),
    gasto_tributo_pasivo_id integer NOT NULL
);


ALTER TABLE public.otros_tributos_pagar OWNER TO eureka;

--
-- Name: TABLE otros_tributos_pagar; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE otros_tributos_pagar IS 'Otros tributos por pagar';


--
-- Name: COLUMN otros_tributos_pagar.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_tributos_pagar.id IS 'Clave primaria';


--
-- Name: COLUMN otros_tributos_pagar.tributo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_tributos_pagar.tributo IS 'Tributo';


--
-- Name: COLUMN otros_tributos_pagar.gasto_tributo_pasivo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN otros_tributos_pagar.gasto_tributo_pasivo_id IS 'Clave foranea a la tabla gastos_tributos_pasivos';


--
-- Name: otros_tributos_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE otros_tributos_pagar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otros_tributos_pagar_id_seq OWNER TO eureka;

--
-- Name: otros_tributos_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE otros_tributos_pagar_id_seq OWNED BY otros_tributos_pagar.id;


--
-- Name: pasivo_laboral; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE pasivo_laboral (
    id integer NOT NULL,
    concepto character varying(255) NOT NULL,
    gasto_tributo_pasivo_id integer NOT NULL
);


ALTER TABLE public.pasivo_laboral OWNER TO eureka;

--
-- Name: COLUMN pasivo_laboral.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN pasivo_laboral.id IS 'Clave primaria';


--
-- Name: COLUMN pasivo_laboral.concepto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN pasivo_laboral.concepto IS 'Concepto';


--
-- Name: COLUMN pasivo_laboral.gasto_tributo_pasivo_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN pasivo_laboral.gasto_tributo_pasivo_id IS 'Clave foránea a la tabla gastos_tributos_pasivos';


--
-- Name: pasivo_laboral_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE pasivo_laboral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pasivo_laboral_id_seq OWNER TO eureka;

--
-- Name: pasivo_laboral_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE pasivo_laboral_id_seq OWNED BY pasivo_laboral.id;


--
-- Name: personas_naturales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE personas_naturales (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    cedula character varying(50) NOT NULL
);


ALTER TABLE public.personas_naturales OWNER TO eureka;

--
-- Name: TABLE personas_naturales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE personas_naturales IS 'Toda persona natural que pueda estar registrada en una contratista, ya sea como accionista, empleado, etc.';


--
-- Name: COLUMN personas_naturales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.id IS 'Clave primaria';


--
-- Name: COLUMN personas_naturales.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.nombre IS 'Nombre de la persona';


--
-- Name: COLUMN personas_naturales.cedula; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.cedula IS 'Cédula de identidad de la persona';


--
-- Name: personas_naturales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE personas_naturales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_naturales_id_seq OWNER TO eureka;

--
-- Name: personas_naturales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE personas_naturales_id_seq OWNED BY personas_naturales.id;


--
-- Name: propiedades; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE propiedades (
    id integer NOT NULL,
    tipo enum_tipo_propiedad NOT NULL,
    costo_adquisicion numeric(38,6),
    cambios_val_raz character varying(255) NOT NULL,
    saldo_contablilidad numeric(38,6) NOT NULL,
    ano date NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.propiedades OWNER TO eureka;

--
-- Name: COLUMN propiedades.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN propiedades.id IS 'Clave primaria';


--
-- Name: COLUMN propiedades.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN propiedades.tipo IS 'Tipo de propiedad';


--
-- Name: COLUMN propiedades.costo_adquisicion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN propiedades.costo_adquisicion IS 'Costo de Adquisición';


--
-- Name: COLUMN propiedades.cambios_val_raz; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN propiedades.cambios_val_raz IS 'Cambios en valor Razonable';


--
-- Name: COLUMN propiedades.saldo_contablilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN propiedades.saldo_contablilidad IS 'Saldo según contabilidad';


--
-- Name: propiedades_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE propiedades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propiedades_id_seq OWNER TO eureka;

--
-- Name: propiedades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE propiedades_id_seq OWNED BY propiedades.id;


--
-- Name: propiedades_inversion; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE propiedades_inversion (
    id integer NOT NULL,
    saldo_al date
);


ALTER TABLE public.propiedades_inversion OWNER TO eureka;

--
-- Name: COLUMN propiedades_inversion.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN propiedades_inversion.id IS 'Clave primaria';


--
-- Name: COLUMN propiedades_inversion.saldo_al; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN propiedades_inversion.saldo_al IS 'Saldo al 31/12/20X0-20X1-20X2';


--
-- Name: propiedades_inversion_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE propiedades_inversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propiedades_inversion_id_seq OWNER TO eureka;

--
-- Name: propiedades_inversion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE propiedades_inversion_id_seq OWNED BY propiedades_inversion.id;


--
-- Name: proveedor; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE proveedor (
    id integer NOT NULL,
    empresa_id integer NOT NULL,
    contratista_id integer NOT NULL
);


ALTER TABLE public.proveedor OWNER TO eureka;

--
-- Name: COLUMN proveedor.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proveedor.id IS 'Clave primaria';


--
-- Name: COLUMN proveedor.empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proveedor.empresa_id IS 'Empresa proveedor';


--
-- Name: COLUMN proveedor.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN proveedor.contratista_id IS 'Contratista';


--
-- Name: proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedor_id_seq OWNER TO eureka;

--
-- Name: proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE proveedor_id_seq OWNED BY proveedor.id;


--
-- Name: provisiones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE provisiones (
    id integer NOT NULL,
    concepto character varying(255) NOT NULL,
    corriente boolean NOT NULL,
    saldo_per_ant numeric(38,6) NOT NULL,
    aplicacion_am_per character varying(255) NOT NULL,
    importe_provi_per numeric(38,6) NOT NULL,
    saldo_contabilidad numeric(38,6) NOT NULL
);


ALTER TABLE public.provisiones OWNER TO eureka;

--
-- Name: TABLE provisiones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE provisiones IS 'Provisiones';


--
-- Name: COLUMN provisiones.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN provisiones.id IS 'Clave primaria';


--
-- Name: COLUMN provisiones.concepto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN provisiones.concepto IS 'Concepto';


--
-- Name: COLUMN provisiones.corriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN provisiones.corriente IS 'Corriente o No corriente';


--
-- Name: COLUMN provisiones.saldo_per_ant; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN provisiones.saldo_per_ant IS 'Saldo del período anterior';


--
-- Name: COLUMN provisiones.aplicacion_am_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN provisiones.aplicacion_am_per IS 'Aplicación o amortización del periodo';


--
-- Name: COLUMN provisiones.importe_provi_per; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN provisiones.importe_provi_per IS 'Importe Provisionado del período';


--
-- Name: COLUMN provisiones.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN provisiones.saldo_contabilidad IS 'Saldo según Contabilidad';


--
-- Name: provisiones_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE provisiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provisiones_id_seq OWNER TO eureka;

--
-- Name: provisiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE provisiones_id_seq OWNED BY provisiones.id;


--
-- Name: resultados_acumulados; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE resultados_acumulados (
    id integer NOT NULL,
    concepto character varying(255) NOT NULL,
    res_acu_nom numeric(38,6) NOT NULL,
    res_acu_con numeric(38,6) NOT NULL,
    ano date NOT NULL
);


ALTER TABLE public.resultados_acumulados OWNER TO eureka;

--
-- Name: COLUMN resultados_acumulados.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN resultados_acumulados.id IS 'Clave primaria';


--
-- Name: COLUMN resultados_acumulados.concepto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN resultados_acumulados.concepto IS 'Concepto';


--
-- Name: COLUMN resultados_acumulados.res_acu_nom; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN resultados_acumulados.res_acu_nom IS 'Resultado Acumulado Valor Nominal';


--
-- Name: COLUMN resultados_acumulados.res_acu_con; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN resultados_acumulados.res_acu_con IS 'Resultado Acumulado Valor Constante';


--
-- Name: COLUMN resultados_acumulados.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN resultados_acumulados.ano IS 'Año';


--
-- Name: resultados_acumulados_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE resultados_acumulados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resultados_acumulados_id_seq OWNER TO eureka;

--
-- Name: resultados_acumulados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE resultados_acumulados_id_seq OWNED BY resultados_acumulados.id;


--
-- Name: vs_database_diagrams; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE vs_database_diagrams (
    name character varying(80),
    diadata text,
    comment character varying(1022),
    preview text,
    lockinfo character varying(80),
    locktime timestamp with time zone,
    version character varying(80)
);


ALTER TABLE public.vs_database_diagrams OWNER TO eureka;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY accionistas ALTER COLUMN id SET DEFAULT nextval('accionistas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos ALTER COLUMN id SET DEFAULT nextval('"Bancos_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas ALTER COLUMN id SET DEFAULT nextval('bancos_contratistas_id_seq'::regclass);


--
-- Name: contratista_id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas ALTER COLUMN contratista_id SET DEFAULT nextval('bancos_contratistas_contratista_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capital_social ALTER COLUMN id SET DEFAULT nextval('capital_social_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas ALTER COLUMN id SET DEFAULT nextval('contratistas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cts_pagar_comerciales ALTER COLUMN id SET DEFAULT nextval('cts_pagar_comerciales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cuentas_cobrar_contrato ALTER COLUMN id SET DEFAULT nextval('cuentas_cobrar_contrato_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cuentas_cobrar_scontrato ALTER COLUMN id SET DEFAULT nextval('cuentas_cobrar_scontrato_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cuentas_cobro_dudoso ALTER COLUMN id SET DEFAULT nextval('cuentas_cobro_dudoso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY deudor ALTER COLUMN id SET DEFAULT nextval('deudor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores ALTER COLUMN id SET DEFAULT nextval('directores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY efectivo_banco ALTER COLUMN id SET DEFAULT nextval('efectivo_banco_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY efectivo_caja ALTER COLUMN id SET DEFAULT nextval('efectivo_caja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empleados ALTER COLUMN id SET DEFAULT nextval('empleado_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas ALTER COLUMN id SET DEFAULT nextval('empresas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas ALTER COLUMN id SET DEFAULT nextval('empresas_relacionadas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY fondos_reservas ALTER COLUMN id SET DEFAULT nextval('fondos_reservas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY gastos_pag_ant ALTER COLUMN id SET DEFAULT nextval('gastos_pag_ant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY gastos_tributos_pasivos ALTER COLUMN id SET DEFAULT nextval('gastos_tributos_pasivos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY ingresos_iva_islr ALTER COLUMN id SET DEFAULT nextval('ingresos_iva_islr_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY ingresos_operacionales ALTER COLUMN id SET DEFAULT nextval('ingresos_operacionales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY inventarios ALTER COLUMN id SET DEFAULT nextval('inventario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY inversiones ALTER COLUMN id SET DEFAULT nextval('inversiones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY inversiones_act_corr ALTER COLUMN id SET DEFAULT nextval('inversiones1_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY inversiones_subsi ALTER COLUMN id SET DEFAULT nextval('inversiones_subsi_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY islr_diferido ALTER COLUMN id SET DEFAULT nextval('islr_diferido_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY islr_pagos_anticipados ALTER COLUMN id SET DEFAULT nextval('islr_pagos_anticipados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY iva_otros_pag_ant ALTER COLUMN id SET DEFAULT nextval('iva_otros_pag_ant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY obligaciones_bancarias ALTER COLUMN id SET DEFAULT nextval('obligaciones_bancarias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otras_cts_pagar_otros ALTER COLUMN id SET DEFAULT nextval('otras_cts_pagar_otros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otras_cuentas_cobrar ALTER COLUMN id SET DEFAULT nextval('cuentas_por_cobrar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otras_cuentas_pagar ALTER COLUMN id SET DEFAULT nextval('otras_cuentas_pagar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otros_activos_pasivos ALTER COLUMN id SET DEFAULT nextval('activos_pasivos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otros_cmpts_patr ALTER COLUMN id SET DEFAULT nextval('otros_cmpnts_patr_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otros_tributos_pagar ALTER COLUMN id SET DEFAULT nextval('otros_tributos_pagar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY pasivo_laboral ALTER COLUMN id SET DEFAULT nextval('pasivo_laboral_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_naturales ALTER COLUMN id SET DEFAULT nextval('personas_naturales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY propiedades ALTER COLUMN id SET DEFAULT nextval('propiedades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY propiedades_inversion ALTER COLUMN id SET DEFAULT nextval('propiedades_inversion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY proveedor ALTER COLUMN id SET DEFAULT nextval('proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY provisiones ALTER COLUMN id SET DEFAULT nextval('provisiones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY resultados_acumulados ALTER COLUMN id SET DEFAULT nextval('resultados_acumulados_id_seq'::regclass);


--
-- Name: Bancos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('"Bancos_id_seq"', 1, false);


--
-- Data for Name: accionistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY accionistas (id, persona_natural_id, contratista_id, otras_cuentas_pagar_id) FROM stdin;
\.


--
-- Name: accionistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('accionistas_id_seq', 1, false);


--
-- Name: activos_pasivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('activos_pasivos_id_seq', 1, false);


--
-- Data for Name: bancos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY bancos (id, nombre, rif) FROM stdin;
\.


--
-- Data for Name: bancos_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY bancos_contratistas (id, banco_id, contratista_id, num_cuenta, ano) FROM stdin;
\.


--
-- Name: bancos_contratistas_contratista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('bancos_contratistas_contratista_id_seq', 1, false);


--
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('bancos_contratistas_id_seq', 1, false);


--
-- Data for Name: capital_social; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY capital_social (id, concepto, fecha_aporte, fecha_origen, aporte_accionistas, incr_correc_monetaria, ajuste_inflacion, total_cs_azdo, primas_descuentos, acciones_tesoreria, ano) FROM stdin;
\.


--
-- Name: capital_social_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('capital_social_id_seq', 1, false);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY clientes (id, nombre) FROM stdin;
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('clientes_id_seq', 1, false);


--
-- Data for Name: contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY contratistas (id, empresa_id) FROM stdin;
\.


--
-- Name: contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('contratistas_id_seq', 1, false);


--
-- Data for Name: cts_pagar_comerciales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY cts_pagar_comerciales (id, condiciones, saldo_contabilidad, tipo, proveedor_id) FROM stdin;
\.


--
-- Name: cts_pagar_comerciales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cts_pagar_comerciales_id_seq', 1, false);


--
-- Data for Name: cuentas_cobrar_contrato; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY cuentas_cobrar_contrato (id, condiciones, num_contrato, porcentaje_avance, plazo_contrato, saldo_cont_corriente, saldo_cont_ncorriente, contratista_id, ano, cliente_id) FROM stdin;
\.


--
-- Name: cuentas_cobrar_contrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cuentas_cobrar_contrato_id_seq', 1, false);


--
-- Data for Name: cuentas_cobrar_scontrato; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY cuentas_cobrar_scontrato (id, condiciones, saldo_conta_corriente, saldo_conta_ncorriente, contratista_id, ano, cliente_id) FROM stdin;
\.


--
-- Name: cuentas_cobrar_scontrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cuentas_cobrar_scontrato_id_seq', 1, false);


--
-- Data for Name: cuentas_cobro_dudoso; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY cuentas_cobro_dudoso (id, contratista_id, cliente_id, cta_cobrar30, cta_cobrar60, cta_cobrar90, cta_cobrar_m, estimacion, saldo_conta_corriente, saldo_conta_ncorriente, ano) FROM stdin;
\.


--
-- Name: cuentas_cobro_dudoso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cuentas_cobro_dudoso_id_seq', 1, false);


--
-- Name: cuentas_por_cobrar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cuentas_por_cobrar_id_seq', 1, false);


--
-- Data for Name: deudor; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY deudor (id, otras_cuentas_pagar_id) FROM stdin;
\.


--
-- Name: deudor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('deudor_id_seq', 1, false);


--
-- Data for Name: directores; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY directores (id, persona_natural_id, contratista_id, otras_cuentas_pagar_id) FROM stdin;
\.


--
-- Name: directores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('directores_id_seq', 1, false);


--
-- Data for Name: efectivo_banco; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY efectivo_banco (id, contratista_id, banco_id, saldo_banco, depos_transito, saldo_contabilidad, che_transito, nd_contabilizadas, nc_contabilizadas, ano) FROM stdin;
\.


--
-- Name: efectivo_banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('efectivo_banco_id_seq', 1, false);


--
-- Data for Name: efectivo_caja; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY efectivo_caja (id, contratista_id, principal, produccion, venta, administracion, otras, ano, tipo, saldo_contabilidad) FROM stdin;
\.


--
-- Name: efectivo_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('efectivo_caja_id_seq', 2, true);


--
-- Name: empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('empleado_id_seq', 1, false);


--
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY empleados (id, cargo, contratista_id, persona_natural_id, otras_cuentas_pagar_id) FROM stdin;
\.


--
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY empresas (id, nombre, rif) FROM stdin;
\.


--
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('empresas_id_seq', 1, false);


--
-- Data for Name: empresas_relacionadas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY empresas_relacionadas (id, empresa_id, contratista_id, otras_cuentas_pagar_id) FROM stdin;
\.


--
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('empresas_relacionadas_id_seq', 1, false);


--
-- Data for Name: fondos_reservas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY fondos_reservas (id, concepto, fecha_aporte, fecha_origen, val_nominal, val_constante, ano) FROM stdin;
\.


--
-- Name: fondos_reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('fondos_reservas_id_seq', 1, false);


--
-- Data for Name: gastos_pag_ant; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY gastos_pag_ant (id, gastos, ref_proveedor_ppal, saldo_per_ant, importe_contratado_per, reintegro_apli_amorti, saldo_contabilidad, ano) FROM stdin;
\.


--
-- Name: gastos_pag_ant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('gastos_pag_ant_id_seq', 1, false);


--
-- Data for Name: gastos_tributos_pasivos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY gastos_tributos_pasivos (id, saldo_per_anterior, importe_gasto_per, importe_pago_per, saldo_contabilidad) FROM stdin;
\.


--
-- Name: gastos_tributos_pasivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('gastos_tributos_pasivos_id_seq', 1, false);


--
-- Data for Name: ingresos_iva_islr; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY ingresos_iva_islr (id, certificado_electronico, sujetos_iva, no_sujetos_iva, total_libro_venta, ano, mes) FROM stdin;
\.


--
-- Name: ingresos_iva_islr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('ingresos_iva_islr_id_seq', 1, false);


--
-- Data for Name: ingresos_operacionales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY ingresos_operacionales (id, num_contrato, sector, venta, servicio, obra, porcentaje_avance, otras_operaciones) FROM stdin;
\.


--
-- Name: ingresos_operacionales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('ingresos_operacionales_id_seq', 1, false);


--
-- Name: inventario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inventario_id_seq', 1, false);


--
-- Data for Name: inventarios; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY inventarios (id, tec_med_costo, for_cal_costo, costo_adquisicion, ajuste_inflacion, reverso_deterioro, saldo_contabilidad, inventario) FROM stdin;
\.


--
-- Data for Name: inversiones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY inversiones (id, banco_id, condiciones, costo_adquisicion, valor_desvalorizacion, saldo_contabilidad, contratista_id, ano) FROM stdin;
\.


--
-- Name: inversiones1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inversiones1_id_seq', 1, false);


--
-- Data for Name: inversiones_act_corr; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY inversiones_act_corr (id, contratista_id, instrumento, condiciones, costo_adquisicion, ajuste_inflacion, saldo_contabilidad, ano, perdida_valor, tipo, empresa_id) FROM stdin;
\.


--
-- Name: inversiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inversiones_id_seq', 1, false);


--
-- Data for Name: inversiones_subsi; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY inversiones_subsi (instrumento, condiciones, porcentaje_participacion, costo_adquisicion, ajuste_inflacion, saldo_contabilidad, ano, empresa_id, contratista_id, id) FROM stdin;
\.


--
-- Name: inversiones_subsi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inversiones_subsi_id_seq', 1, false);


--
-- Data for Name: islr_diferido; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY islr_diferido (id, act_pas_tributarios, base_financiera, base_fiscal, diferencia_temporaria) FROM stdin;
\.


--
-- Name: islr_diferido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('islr_diferido_id_seq', 1, false);


--
-- Data for Name: islr_pagos_anticipados; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY islr_pagos_anticipados (id, islr, saldo_per_ant, importe_pagado_per, importe_cedido_per, importe_utilizado_per, saldo_contabilidad, ano) FROM stdin;
\.


--
-- Name: islr_pagos_anticipados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('islr_pagos_anticipados_id_seq', 1, false);


--
-- Data for Name: iva_otros_pag_ant; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY iva_otros_pag_ant (id, iva_otros, saldo_per_ant, importe_pagado_per, importe_cedido_per, importe_utilizado_per, saldo_contabilidad, ano) FROM stdin;
\.


--
-- Name: iva_otros_pag_ant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('iva_otros_pag_ant_id_seq', 1, false);


--
-- Data for Name: obligaciones_bancarias; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY obligaciones_bancarias (id, tipo, obligacion, entidad_bancaria, tasa_interes, garantia, vencimiento, intereses_periodo, interes_pagar, importe_deuda) FROM stdin;
\.


--
-- Name: obligaciones_bancarias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('obligaciones_bancarias_id_seq', 1, false);


--
-- Data for Name: otras_cts_pagar_otros; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY otras_cts_pagar_otros (id, deudor_id, otras_cuentas_pagar_id) FROM stdin;
\.


--
-- Name: otras_cts_pagar_otros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('otras_cts_pagar_otros_id_seq', 1, false);


--
-- Data for Name: otras_cuentas_cobrar; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY otras_cuentas_cobrar (id, deudor_id, nombre, origen, fecha, garantia, plazo, saldo_contabilidad_c, saldo_contabilidad_nc, ano) FROM stdin;
\.


--
-- Data for Name: otras_cuentas_pagar; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY otras_cuentas_pagar (id, fecha, garantia, plazo, saldo_contabilidad_c, saldo_contabilidad_nc, tipo_prestamo) FROM stdin;
\.


--
-- Name: otras_cuentas_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('otras_cuentas_pagar_id_seq', 1, false);


--
-- Data for Name: otros_activos_pasivos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY otros_activos_pasivos (id, ref_proveedor_ppal, saldo_per_ant, impt_contratado_per, reintegro_ap_am, saldo_contabilidad, corriente, tipo, soporte_distinto, ano) FROM stdin;
\.


--
-- Name: otros_cmpnts_patr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('otros_cmpnts_patr_id_seq', 1, false);


--
-- Data for Name: otros_cmpts_patr; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY otros_cmpts_patr (id, concepto, fecha_aporte, fecha_origen, val_nominal, ajuste_inflacion, ano) FROM stdin;
\.


--
-- Data for Name: otros_tributos_pagar; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY otros_tributos_pagar (id, tributo, gasto_tributo_pasivo_id) FROM stdin;
\.


--
-- Name: otros_tributos_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('otros_tributos_pagar_id_seq', 1, false);


--
-- Data for Name: pasivo_laboral; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY pasivo_laboral (id, concepto, gasto_tributo_pasivo_id) FROM stdin;
\.


--
-- Name: pasivo_laboral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('pasivo_laboral_id_seq', 1, false);


--
-- Data for Name: personas_naturales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY personas_naturales (id, nombre, cedula) FROM stdin;
\.


--
-- Name: personas_naturales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('personas_naturales_id_seq', 1, false);


--
-- Data for Name: propiedades; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY propiedades (id, tipo, costo_adquisicion, cambios_val_raz, saldo_contablilidad, ano, nombre) FROM stdin;
\.


--
-- Name: propiedades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('propiedades_id_seq', 1, false);


--
-- Data for Name: propiedades_inversion; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY propiedades_inversion (id, saldo_al) FROM stdin;
\.


--
-- Name: propiedades_inversion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('propiedades_inversion_id_seq', 1, false);


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY proveedor (id, empresa_id, contratista_id) FROM stdin;
\.


--
-- Name: proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('proveedor_id_seq', 1, false);


--
-- Data for Name: provisiones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY provisiones (id, concepto, corriente, saldo_per_ant, aplicacion_am_per, importe_provi_per, saldo_contabilidad) FROM stdin;
\.


--
-- Name: provisiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('provisiones_id_seq', 1, false);


--
-- Data for Name: resultados_acumulados; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY resultados_acumulados (id, concepto, res_acu_nom, res_acu_con, ano) FROM stdin;
\.


--
-- Name: resultados_acumulados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('resultados_acumulados_id_seq', 1, false);


--
-- Data for Name: vs_database_diagrams; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY vs_database_diagrams (name, diadata, comment, preview, lockinfo, locktime, version) FROM stdin;
rnc	PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPHByb3BlcnRpZXM+Cgk8Q29udHJvbHM+CgkJPFRhYmxlPgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iOCIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMzg7MzYiLz4KCQkJCTxzaXplIHZhbHVlPSIxOTc7ODYiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlPgoJCTxUYWJsZTE+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSI3Ii8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTEiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMzA7MjI1Ii8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjMxOzEyMiIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGUxPgoJCTxUYWJsZTI+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSI2Ii8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTIiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iODU7MTMzIi8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjA4OzY4Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTI+CgkJPFRhYmxlMz4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjUiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMyIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSI0Mzs0NDIiLz4KCQkJCTxzaXplIHZhbHVlPSIxMjY7NTAiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMz4KCQk8VGFibGU0PgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iNCIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGU0Ii8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjEzMDszNTQiLz4KCQkJCTxzaXplIHZhbHVlPSIyMTY7MTU4Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTQ+CgkJPFRhYmxlNT4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjMiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlNSIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIyNjY7MjA2Ii8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjQ4OzIxMiIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGU1PgoJCTxUYWJsZTY+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIyIi8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTYiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMjYzOzExIi8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjc5OzIxMiIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGU2PgoJCTxUYWJsZTc+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIxIi8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTciLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iODU7MzEwIi8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjE4OzIzMCIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGU3PgoJCTxybmM+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iRkZGRkZGIi8+CgkJCQk8Z2FtbWEgdmFsdWU9IjAiLz4KCQkJCTxuYW1lIHZhbHVlPSJybmMiLz4KCQkJCTxzaXplIHZhbHVlPSIyMDQ4OzIwNDgiLz4KCQkJCTxzdHlsZSB2YWx1ZT0iNCIvPgoJCQkJPHN0eWxlX2xpbmtzIHZhbHVlPSIwIi8+CgkJCQk8dW5pdHMgdmFsdWU9IjUiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iRGlhZ3JhbSIvPgoJCTwvcm5jPgoJPC9Db250cm9scz4KCTxHVUk+CgkJPEZ1bGxUb29sYmFyTGVmdCB2YWx1ZT0iMSIvPgoJCTxGdWxsVG9vbGJhclJpZ2h0IHZhbHVlPSIxIi8+CgkJPFBhZ2VFZGl0b3IgdmFsdWU9Ii0xIi8+CgkJPFBhZ2VFZGl0b3JIIHZhbHVlPSIwIi8+CgkJPFBhZ2VUb29sYmFyTGVmdCB2YWx1ZT0iMCIvPgoJCTxQYWdlVG9vbGJhclJCIHZhbHVlPSIwIi8+CgkJPFBhZ2VUb29sYmFyUmlnaHQgdmFsdWU9IjAiLz4KCQk8UGFuZUNsaXBib2FyZCB2YWx1ZT0iMCIvPgoJCTxQYW5lTGF5b3V0IHZhbHVlPSIwIi8+CgkJPFBhbmVWaWV3IHZhbHVlPSIwIi8+CgkJPFNjcm9sbFggdmFsdWU9IjAiLz4KCQk8U2Nyb2xsWSB2YWx1ZT0iMCIvPgoJCTxTZWxlY3Rpb24gdmFsdWU9IlZHRmliR1UzIi8+CgkJPFNob3dBbGwgdmFsdWU9IjEiLz4KCQk8U2hvd0NoYW5nZXMgdmFsdWU9IjEiLz4KCQk8U2hvd0dMIHZhbHVlPSIxIi8+CgkJPFNob3dHcmlkIHZhbHVlPSIxIi8+CgkJPFVzZUdyaWQgdmFsdWU9IjAiLz4KCTwvR1VJPgoJPE1vZGVsPgoJCTxwdWJsaWM+CgkJCTx0YWJsZT4KCQkJCTxvMD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMyIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSI2MDA3MyIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPExpbmtfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImJhbmNvcyIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJldXJla2EiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJCYW5jb3NfcGtleSIvPgoJCQkJCQk8UmVjb3JkX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZSIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJDbGF2ZSBwcmltYXJpYSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSduZXh0dmFsKCZhcG9zOyJCYW5jb3NfaWRfc2VxIiZhcG9zOzo6cmVnY2xhc3MpJy8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTm9tYnJlIGRlbCBiYW5jbyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJSaWYgZGVsIGJhbmNvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0icmlmIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InJpZiIvPgoJCQkJCQk8L28yPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSI2MDA3MyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJiYW5jb3MiLz4KCQkJCTwvbzA+CgkJCQk8bzE+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjUiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iNjAwNzgiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxMaW5rX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJiYW5jb3NfY29udHJhdGlzdGFzIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9ImV1cmVrYSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImJhbmNvc19jb250cmF0aXN0YXNfcGtleSIvPgoJCQkJCQk8UmVjb3JkX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTEiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQcOxbyBjYXJnYWRvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYW5vIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYW5vIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJDbGF2ZSBmb3JhbmVhIGEgbGEgdGFibGEgQmFuY28iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJiYW5jb19pZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImJhbmNvX2lkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJDbGF2ZSBmb3JhbmVhIGEgbGEgdGFibGEgQ29udHJhdGlzdGEiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnYmFuY29zX2NvbnRyYXRpc3Rhc19jb250cmF0aXN0YV9pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNvbnRyYXRpc3RhX2lkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iY29udHJhdGlzdGFfaWQiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkNsYXZlIHByaW1hcmlhIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2JhbmNvc19jb250cmF0aXN0YXNfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTsO6bWVybyBkZSBjdWVudGEgYmFuY2FyaWEiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjE1MCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJudW1fY3VlbnRhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im51bV9jdWVudGEiLz4KCQkJCQkJPC9vND4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iNjAwNzgiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iYmFuY29zX2NvbnRyYXRpc3RhcyIvPgoJCQkJPC9vMT4KCQkJCTxvMj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMiIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSI1OTg4OCIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPExpbmtfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImNsaWVudGVzIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9ImV1cmVrYSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImNsaWVudGVzX3BrIi8+CgkJCQkJCTxSZWNvcmRfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY2xpZW50ZXNfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28xPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSI1OTg4OCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjbGllbnRlcyIvPgoJCQkJPC9vMj4KCQkJCTxvMz4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMSIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSI2MDA4NSIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPExpbmtfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImNvbnRyYXRpc3RhcyIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJldXJla2EiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjb250cmF0aXN0YXNfcGtleSIvPgoJCQkJCQk8UmVjb3JkX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTMiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2xhdmUgcHJpbWFyaWEiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY29udHJhdGlzdGFzX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28wPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSI2MDA4NSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjb250cmF0aXN0YXMiLz4KCQkJCTwvbzM+CgkJCQk8bzQ+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjciLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iNjAwOTgiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxMaW5rX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdWVudGFzX2NvYnJhcl9zY29udHJhdG8iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0iZXVyZWthIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY3VlbnRhc19jb2JyYXJfc2NvbnRyYXRvX3BrZXkiLz4KCQkJCQkJPFJlY29yZF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGU0Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFubyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFubyIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2xhdmUgZm9yYW5lYSBhIGxhIHRhYmxhIENsaWVudGVzIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY2xpZW50ZV9pZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNsaWVudGVfaWQiLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjb25kaWNpb25lcyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjb25kaWNpb25lcyIvPgoJCQkJCQk8L28yPgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2xhdmUgZm9yYW5lYSBhIGxhIHRhYmxhIENvbnRyYXRpc3RhcyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNvbnRyYXRpc3RhX2lkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iY29udHJhdGlzdGFfaWQiLz4KCQkJCQkJPC9vMz4KCQkJCQkJPG80PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkNsYXZlIHByaW1hcmlhIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2N1ZW50YXNfY29icmFyX3Njb250cmF0b19pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IlNhbGRvIHNlZ8O6biBjb250YWJpbGlkYWQgY29ycmllbnRlIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ic2FsZG9fY29udGFfY29ycmllbnRlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMzgiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjYiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJzYWxkb19jb250YV9jb3JyaWVudGUiLz4KCQkJCQkJPC9vNT4KCQkJCQkJPG82PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IlNhbGRvIHNlZ8O6biBjb250YWJpbGlkYWQgbm8gY29ycmllbnRlIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ic2FsZG9fY29udGFfbmNvcnJpZW50ZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjM4Ii8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSI2Ii8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ic2FsZG9fY29udGFfbmNvcnJpZW50ZSIvPgoJCQkJCQk8L282PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSI2MDA5OCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdWVudGFzX2NvYnJhcl9zY29udHJhdG8iLz4KCQkJCTwvbzQ+CgkJCQk8bzU+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjEwIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjYwMDkwIi8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TGlua19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY3VlbnRhc19jb2JyYXJfY29udHJhdG8iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0iZXVyZWthIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY3VlbnRhc19jb2JyYXJfY29udHJhdG9fcGtleSIvPgoJCQkJCQk8UmVjb3JkX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTUiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQcOxbyBhIGNhcmdhciIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFubyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFubyIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2xhdmUgZm9yYW5lYSBhIGxhIHRhYmxhIENsaWVudGVzIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNsaWVudGVfaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjbGllbnRlX2lkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY29uZGljaW9uZXMiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iY29uZGljaW9uZXMiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkNsYXZlIGZvcmFuZWEgYSBsYSB0YWJsYSBDb250cmF0aXN0YXMiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjgiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjb250cmF0aXN0YV9pZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNvbnRyYXRpc3RhX2lkIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJDbGF2ZSBwcmltYXJpYSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdWVudGFzX2NvYnJhcl9jb250cmF0b19pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJOw7ptZXJvIGRlIGNvbnRyYXRvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibnVtX2NvbnRyYXRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im51bV9jb250cmF0byIvPgoJCQkJCQk8L281PgoJCQkJCQk8bzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InBsYXpvX2NvbnRyYXRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InBsYXpvX2NvbnRyYXRvIi8+CgkJCQkJCTwvbzY+CgkJCQkJCTxvNz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iUG9yY2VudGFqZSBkZSBhdmFuY2UiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InBvcmNlbnRhamVfYXZhbmNlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InBvcmNlbnRhamVfYXZhbmNlIi8+CgkJCQkJCTwvbzc+CgkJCQkJCTxvOD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJTYWxkbyBzZWfDum4gY29udGFiaWxpZGFkIGNvcnJpZW50ZSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InNhbGRvX2NvbnRfY29ycmllbnRlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMzgiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjYiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJzYWxkb19jb250X2NvcnJpZW50ZSIvPgoJCQkJCQk8L284PgoJCQkJCQk8bzk+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iU2FsZG8gc2Vnw7puIGNvbnRhYmlsaWRhZCBubyBjb3JyaWVudGUiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJzYWxkb19jb250X25jb3JyaWVudGUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIzOCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InNhbGRvX2NvbnRfbmNvcnJpZW50ZSIvPgoJCQkJCQk8L285PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSI2MDA5MCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdWVudGFzX2NvYnJhcl9jb250cmF0byIvPgoJCQkJPC9vNT4KCQkJCTxvNj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMTAiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iNjAxMzkiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxMaW5rX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJpbnZlcnNpb25lc19zdWJzaSIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJldXJla2EiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJpbnZlcnNpb25lc19zdWJzaV9wa2V5Ii8+CgkJCQkJCTxSZWNvcmRfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlNiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhanVzdGVfaW5mbGFjaW9uIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMzgiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjYiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhanVzdGVfaW5mbGFjaW9uIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhbm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iRGF0ZSIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhbm8iLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjb25kaWNpb25lcyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjb25kaWNpb25lcyIvPgoJCQkJCQk8L28yPgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2xhdmUgZm9yYW5lYSBhIGxhIHRhYmxhIENvbnRyYXRpc3RhIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI5Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY29udHJhdGlzdGFfaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjb250cmF0aXN0YV9pZCIvPgoJCQkJCQk8L28zPgoJCQkJCQk8bzQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY29zdG9fYWRxdWlzaWNpb24iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIzOCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNvc3RvX2FkcXVpc2ljaW9uIi8+CgkJCQkJCTwvbzQ+CgkJCQkJCTxvNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJDbGF2ZSBmb3JhbmVhIGEgbGEgdGFibGEgRW1wcmVzYXMiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjgiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJlbXByZXNhX2lkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZW1wcmVzYV9pZCIvPgoJCQkJCQk8L281PgoJCQkJCQk8bzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2xhdmUgcHJpbWFyaWEiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnaW52ZXJzaW9uZXNfc3Vic2lfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L282PgoJCQkJCQk8bzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Imluc3RydW1lbnRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Imluc3RydW1lbnRvIi8+CgkJCQkJCTwvbzc+CgkJCQkJCTxvOD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0icG9yY2VudGFqZV9wYXJ0aWNpcGFjaW9uIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InBvcmNlbnRhamVfcGFydGljaXBhY2lvbiIvPgoJCQkJCQk8L284PgoJCQkJCQk8bzk+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iU2FsZG8gc2Vnw7puIGNvbnRhYmlsaWRhZCIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InNhbGRvX2NvbnRhYmlsaWRhZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjM4Ii8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSI2Ii8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ic2FsZG9fY29udGFiaWxpZGFkIi8+CgkJCQkJCTwvbzk+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjYwMTM5Ii8+CgkJCQkJPG5hbWUgdmFsdWU9ImludmVyc2lvbmVzX3N1YnNpIi8+CgkJCQk8L282PgoJCQkJPG83PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIxMSIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSI2MDEyOSIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPExpbmtfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImludmVyc2lvbmVzX2FjdF9jb3JyIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9ImV1cmVrYSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImludmVyc2lvbmVzX2FjdF9jb3JyX3BrZXkiLz4KCQkJCQkJPFJlY29yZF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGU3Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkFqdXN0ZSBwb3IgaW5mbGFjacOzbiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFqdXN0ZV9pbmZsYWNpb24iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIzOCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFqdXN0ZV9pbmZsYWNpb24iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFubyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFubyIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzEwPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJDbGFzaWZpY2FkYXMgY29tbyBhY3Rpdm8gY29ycmllbnRlCkNsYXNpZmljYWRhcyBjb21vIGFjdGl2byBubyBjb3JyaWVudGUgRGlzcG9uaWJsZXMgcGFyYSBsYSB2ZW50YSB5IG1hbnRlbmlkYXMgaGFzdGEgZWwgdmVuY2ltaWVudG8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idGlwbyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ0aXBvIi8+CgkJCQkJCTwvbzEwPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNvbmRpY2lvbmVzIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNvbmRpY2lvbmVzIi8+CgkJCQkJCTwvbzI+CgkJCQkJCTxvMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjb250cmF0aXN0YV9pZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNvbnRyYXRpc3RhX2lkIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjb3N0b19hZHF1aXNpY2lvbiIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjM4Ii8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSI2Ii8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iY29zdG9fYWRxdWlzaWNpb24iLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkNsYXZlIGZvcmFuZWEgYSBsYSB0YWJsYSBFbXByZXNhcyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJlbXByZXNhX2lkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZW1wcmVzYV9pZCIvPgoJCQkJCQk8L281PgoJCQkJCQk8bzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2ludmVyc2lvbmVzMV9pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vNj4KCQkJCQkJPG83PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpbnN0cnVtZW50byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpbnN0cnVtZW50byIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iUMOpcmRpZGEgcG9yIGRldGVyaW9ybyBkZWwgdmFsb3IiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjkiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJwZXJkaWRhX3ZhbG9yIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMzgiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjYiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJwZXJkaWRhX3ZhbG9yIi8+CgkJCQkJCTwvbzg+CgkJCQkJCTxvOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJTYWxkbyBzZWfDum4gY29udGFiaWxpZGFkIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ic2FsZG9fY29udGFiaWxpZGFkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMzgiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjYiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJzYWxkb19jb250YWJpbGlkYWQiLz4KCQkJCQkJPC9vOT4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iNjAxMjkiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iaW52ZXJzaW9uZXNfYWN0X2NvcnIiLz4KCQkJCTwvbzc+CgkJCTwvdGFibGU+CgkJPC9wdWJsaWM+Cgk8L01vZGVsPgo8L3Byb3BlcnRpZXM+Cgo=	\N	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	\N	\N	2
\.


--
-- Name: Bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos
    ADD CONSTRAINT "Bancos_pkey" PRIMARY KEY (id);


--
-- Name: accionistas_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_id_key UNIQUE (id);


--
-- Name: accionistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_pkey PRIMARY KEY (persona_natural_id, contratista_id);


--
-- Name: activos_pasivos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY otros_activos_pasivos
    ADD CONSTRAINT activos_pasivos_pkey PRIMARY KEY (id);


--
-- Name: bancos_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_pkey PRIMARY KEY (id);


--
-- Name: capital_social_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY capital_social
    ADD CONSTRAINT capital_social_pkey PRIMARY KEY (id);


--
-- Name: clientes_pk; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pk PRIMARY KEY (id);


--
-- Name: contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_pkey PRIMARY KEY (id);


--
-- Name: cts_pagar_comerciales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY cts_pagar_comerciales
    ADD CONSTRAINT cts_pagar_comerciales_pkey PRIMARY KEY (id);


--
-- Name: cuentas_cobrar_contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY cuentas_cobrar_contrato
    ADD CONSTRAINT cuentas_cobrar_contrato_pkey PRIMARY KEY (id);


--
-- Name: cuentas_cobrar_scontrato_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY cuentas_cobrar_scontrato
    ADD CONSTRAINT cuentas_cobrar_scontrato_pkey PRIMARY KEY (id);


--
-- Name: cuentas_cobro_dudoso_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY cuentas_cobro_dudoso
    ADD CONSTRAINT cuentas_cobro_dudoso_pkey PRIMARY KEY (id);


--
-- Name: deudor_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY deudor
    ADD CONSTRAINT deudor_pkey PRIMARY KEY (id);


--
-- Name: deudores_pk; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY otras_cuentas_cobrar
    ADD CONSTRAINT deudores_pk PRIMARY KEY (id);


--
-- Name: directores_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT directores_id_key UNIQUE (id);


--
-- Name: directores_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT directores_pkey PRIMARY KEY (persona_natural_id, contratista_id);


--
-- Name: efectivo_banco_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY efectivo_banco
    ADD CONSTRAINT efectivo_banco_pkey PRIMARY KEY (id);


--
-- Name: efectivo_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY efectivo_caja
    ADD CONSTRAINT efectivo_caja_pkey PRIMARY KEY (id);


--
-- Name: empleados_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleados_id_key UNIQUE (id);


--
-- Name: empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (contratista_id, persona_natural_id);


--
-- Name: empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- Name: empresas_relacionadas_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_id_key UNIQUE (id);


--
-- Name: empresas_relacionadas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_pkey PRIMARY KEY (empresa_id, contratista_id);


--
-- Name: fondos_reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fondos_reservas
    ADD CONSTRAINT fondos_reservas_pkey PRIMARY KEY (id);


--
-- Name: gastos_pag_ant_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY gastos_pag_ant
    ADD CONSTRAINT gastos_pag_ant_pkey PRIMARY KEY (id);


--
-- Name: gastos_tributos_pasivos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY gastos_tributos_pasivos
    ADD CONSTRAINT gastos_tributos_pasivos_pkey PRIMARY KEY (id);


--
-- Name: ingresos_iva_islr_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY ingresos_iva_islr
    ADD CONSTRAINT ingresos_iva_islr_pkey PRIMARY KEY (id);


--
-- Name: ingresos_operacionales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY ingresos_operacionales
    ADD CONSTRAINT ingresos_operacionales_pkey PRIMARY KEY (id);


--
-- Name: inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inventarios
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id);


--
-- Name: inversiones_act_corr_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inversiones_act_corr
    ADD CONSTRAINT inversiones_act_corr_pkey PRIMARY KEY (id);


--
-- Name: inversiones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inversiones
    ADD CONSTRAINT inversiones_pkey PRIMARY KEY (id);


--
-- Name: inversiones_subsi_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inversiones_subsi
    ADD CONSTRAINT inversiones_subsi_pkey PRIMARY KEY (id);


--
-- Name: islr_diferido_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY islr_diferido
    ADD CONSTRAINT islr_diferido_pkey PRIMARY KEY (id);


--
-- Name: islr_pago_anticipado_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY islr_pagos_anticipados
    ADD CONSTRAINT islr_pago_anticipado_pkey PRIMARY KEY (id);


--
-- Name: iva_otros_pag_ant_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY iva_otros_pag_ant
    ADD CONSTRAINT iva_otros_pag_ant_pkey PRIMARY KEY (id);


--
-- Name: obligaciones_bancarias_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY obligaciones_bancarias
    ADD CONSTRAINT obligaciones_bancarias_pkey PRIMARY KEY (id);


--
-- Name: otras_cts_pagar_otros_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY otras_cts_pagar_otros
    ADD CONSTRAINT otras_cts_pagar_otros_id_key UNIQUE (id);


--
-- Name: otras_cts_pagar_otros_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY otras_cts_pagar_otros
    ADD CONSTRAINT otras_cts_pagar_otros_pkey PRIMARY KEY (deudor_id, otras_cuentas_pagar_id);


--
-- Name: otras_cuentas_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY otras_cuentas_pagar
    ADD CONSTRAINT otras_cuentas_pagar_pkey PRIMARY KEY (id);


--
-- Name: otros_cmpnts_patr_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY otros_cmpts_patr
    ADD CONSTRAINT otros_cmpnts_patr_pkey PRIMARY KEY (id);


--
-- Name: otros_tributos_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY otros_tributos_pagar
    ADD CONSTRAINT otros_tributos_pagar_pkey PRIMARY KEY (id);


--
-- Name: pasivo_laboral_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY pasivo_laboral
    ADD CONSTRAINT pasivo_laboral_pkey PRIMARY KEY (id);


--
-- Name: personas_naturales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_pkey PRIMARY KEY (id);


--
-- Name: propiedades_inversion_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY propiedades_inversion
    ADD CONSTRAINT propiedades_inversion_pkey PRIMARY KEY (id);


--
-- Name: propiedades_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY propiedades
    ADD CONSTRAINT propiedades_pkey PRIMARY KEY (id);


--
-- Name: proveedor_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_id_key UNIQUE (id);


--
-- Name: proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (empresa_id, contratista_id);


--
-- Name: provisiones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY provisiones
    ADD CONSTRAINT provisiones_pkey PRIMARY KEY (id);


--
-- Name: resultados_acumulados_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY resultados_acumulados
    ADD CONSTRAINT resultados_acumulados_pkey PRIMARY KEY (id);


--
-- Name: accionistas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- Name: accionistas_persona_natural_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_persona_natural_id_fkey FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id);


--
-- Name: contratistas_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES empresas(id);


--
-- Name: deudor_otras_cuentas_pagar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY deudor
    ADD CONSTRAINT deudor_otras_cuentas_pagar_id_fkey FOREIGN KEY (otras_cuentas_pagar_id) REFERENCES otras_cuentas_pagar(id);


--
-- Name: directores_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT directores_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- Name: directores_otras_cuentas_pagar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT directores_otras_cuentas_pagar_id_fkey FOREIGN KEY (otras_cuentas_pagar_id) REFERENCES otras_cuentas_pagar(id);


--
-- Name: directores_persona_natural_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT directores_persona_natural_id_fkey FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id);


--
-- Name: empleados_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleados_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- Name: empleados_otras_cuentas_pagar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleados_otras_cuentas_pagar_id_fkey FOREIGN KEY (otras_cuentas_pagar_id) REFERENCES otras_cuentas_pagar(id);


--
-- Name: empleados_persona_natural_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleados_persona_natural_id_fkey FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id);


--
-- Name: empresas_relacionadas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- Name: empresas_relacionadas_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES empresas(id);


--
-- Name: empresas_relacionadas_otras_cuentas_pagar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_otras_cuentas_pagar_id_fkey FOREIGN KEY (otras_cuentas_pagar_id) REFERENCES otras_cuentas_pagar(id);


--
-- Name: otras_cts_pagar_otros_deudor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otras_cts_pagar_otros
    ADD CONSTRAINT otras_cts_pagar_otros_deudor_id_fkey FOREIGN KEY (deudor_id) REFERENCES deudor(id);


--
-- Name: otras_cts_pagar_otros_otras_cuentas_pagar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otras_cts_pagar_otros
    ADD CONSTRAINT otras_cts_pagar_otros_otras_cuentas_pagar_id_fkey FOREIGN KEY (otras_cuentas_pagar_id) REFERENCES otras_cuentas_pagar(id);


--
-- Name: otras_cuentas_cobrar_deudor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otras_cuentas_cobrar
    ADD CONSTRAINT otras_cuentas_cobrar_deudor_id_fkey FOREIGN KEY (deudor_id) REFERENCES deudor(id);


--
-- Name: otros_tributos_pagar_gasto_tributo_pasivo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY otros_tributos_pagar
    ADD CONSTRAINT otros_tributos_pagar_gasto_tributo_pasivo_id_fkey FOREIGN KEY (gasto_tributo_pasivo_id) REFERENCES gastos_tributos_pasivos(id);


--
-- Name: pasivo_laboral_gasto_tributo_pasivo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY pasivo_laboral
    ADD CONSTRAINT pasivo_laboral_gasto_tributo_pasivo_id_fkey FOREIGN KEY (gasto_tributo_pasivo_id) REFERENCES gastos_tributos_pasivos(id);


--
-- Name: proveedor_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- Name: proveedor_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES empresas(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

