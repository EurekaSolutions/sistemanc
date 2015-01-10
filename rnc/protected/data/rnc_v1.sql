--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2015-01-09 20:56:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 195 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2074 (class 0 OID 0)
-- Dependencies: 195
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 562 (class 1247 OID 309897)
-- Name: enum_caja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE enum_caja AS ENUM (
    'caja',
    'caja chica'
);


ALTER TYPE public.enum_caja OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 309855)
-- Name: bancos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE bancos (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    rif character varying(100) NOT NULL
);


ALTER TABLE public.bancos OWNER TO eureka;

--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN bancos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos.id IS 'Clave primaria';


--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN bancos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos.nombre IS 'Nombre del banco';


--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN bancos.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos.rif IS 'Rif del banco';


--
-- TOC entry 170 (class 1259 OID 309853)
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
-- TOC entry 2078 (class 0 OID 0)
-- Dependencies: 170
-- Name: Bancos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE "Bancos_id_seq" OWNED BY bancos.id;


--
-- TOC entry 176 (class 1259 OID 309873)
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
-- TOC entry 2079 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN bancos_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.id IS 'Clave primaria';


--
-- TOC entry 2080 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN bancos_contratistas.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.banco_id IS 'Clave foranea a la tabla Banco';


--
-- TOC entry 2081 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN bancos_contratistas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.contratista_id IS 'Clave foranea a la tabla Contratista';


--
-- TOC entry 2082 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN bancos_contratistas.num_cuenta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.num_cuenta IS 'Número de cuenta bancaria';


--
-- TOC entry 2083 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN bancos_contratistas.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.ano IS 'Año cargado';


--
-- TOC entry 175 (class 1259 OID 309871)
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
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 175
-- Name: bancos_contratistas_contratista_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE bancos_contratistas_contratista_id_seq OWNED BY bancos_contratistas.contratista_id;


--
-- TOC entry 174 (class 1259 OID 309869)
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
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 174
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE bancos_contratistas_id_seq OWNED BY bancos_contratistas.id;


--
-- TOC entry 173 (class 1259 OID 309863)
-- Name: contratistas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas (
    id integer NOT NULL
);


ALTER TABLE public.contratistas OWNER TO postgres;

--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN contratistas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas.id IS 'Clave primaria';


--
-- TOC entry 172 (class 1259 OID 309861)
-- Name: contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratistas_id_seq OWNER TO postgres;

--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 172
-- Name: contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_id_seq OWNED BY contratistas.id;


--
-- TOC entry 184 (class 1259 OID 309944)
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
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.id IS 'Clave primaria';


--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.num_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.num_contrato IS 'Número de contrato';


--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.porcentaje_avance; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.porcentaje_avance IS 'Porcentaje de avance';


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.saldo_cont_corriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.saldo_cont_corriente IS 'Saldo según contabilidad corriente';


--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.saldo_cont_ncorriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.saldo_cont_ncorriente IS 'Saldo según contabilidad no corriente';


--
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.ano; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.ano IS 'Año a cargar';


--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN cuentas_cobrar_contrato.cliente_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobrar_contrato.cliente_id IS 'Clave foranea a la tabla Clientes';


--
-- TOC entry 183 (class 1259 OID 309942)
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
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 183
-- Name: cuentas_cobrar_contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cuentas_cobrar_contrato_id_seq OWNED BY cuentas_cobrar_contrato.id;


--
-- TOC entry 186 (class 1259 OID 309955)
-- Name: cuentas_cobrar_scontrato; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.cuentas_cobrar_scontrato OWNER TO postgres;

--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cuentas_cobrar_scontrato.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.id IS 'Clave primaria';


--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cuentas_cobrar_scontrato.saldo_conta_corriente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.saldo_conta_corriente IS 'Saldo según contabilidad corriente';


--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cuentas_cobrar_scontrato.saldo_conta_ncorriente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.saldo_conta_ncorriente IS 'Saldo según contabilidad no corriente';


--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cuentas_cobrar_scontrato.contratista_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cuentas_cobrar_scontrato.cliente_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cuentas_cobrar_scontrato.cliente_id IS 'Clave foranea a la tabla Clientes';


--
-- TOC entry 185 (class 1259 OID 309953)
-- Name: cuentas_cobrar_scontrato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cuentas_cobrar_scontrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuentas_cobrar_scontrato_id_seq OWNER TO postgres;

--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 185
-- Name: cuentas_cobrar_scontrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cuentas_cobrar_scontrato_id_seq OWNED BY cuentas_cobrar_scontrato.id;


--
-- TOC entry 188 (class 1259 OID 309963)
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
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.id IS 'Clave primaria';


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.cliente_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cliente_id IS 'Clave foranea a la tabla Cliente';


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar30; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar30 IS 'Saldos cuentas por cobrar de 0 a 30 dias';


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar60; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar60 IS 'Saldos cuentas por cobrar de 31  a 60 dias';


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar90; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar90 IS 'Saldos cuentas por cobrar de 61  a 90 dias';


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.cta_cobrar_m; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.cta_cobrar_m IS 'Saldos cuentas por cobrar mas de 90 dias';


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.saldo_conta_corriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.saldo_conta_corriente IS 'Saldo según contabilidad corriente';


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN cuentas_cobro_dudoso.saldo_conta_ncorriente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cuentas_cobro_dudoso.saldo_conta_ncorriente IS 'Saldo según contabilidad no corriente';


--
-- TOC entry 187 (class 1259 OID 309961)
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
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 187
-- Name: cuentas_cobro_dudoso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cuentas_cobro_dudoso_id_seq OWNED BY cuentas_cobro_dudoso.id;


--
-- TOC entry 182 (class 1259 OID 309936)
-- Name: efectivo_banco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.efectivo_banco OWNER TO postgres;

--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.id IS 'Clave primaria';


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.contratista_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.banco_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.banco_id IS 'Clave primaria a la tabla Banco';


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.saldo_banco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.saldo_banco IS 'Saldo según bancos';


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.depos_transito; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.depos_transito IS 'Depositos en transito';


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.che_transito; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.che_transito IS 'Cheques en tránsito';


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.nd_contabilizadas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.nd_contabilizadas IS 'ND no contabilizadas errores/DB';


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN efectivo_banco.nc_contabilizadas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN efectivo_banco.nc_contabilizadas IS 'NC no contabilizadas errores/Cr';


--
-- TOC entry 181 (class 1259 OID 309934)
-- Name: efectivo_banco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE efectivo_banco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.efectivo_banco_id_seq OWNER TO postgres;

--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 181
-- Name: efectivo_banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE efectivo_banco_id_seq OWNED BY efectivo_banco.id;


--
-- TOC entry 180 (class 1259 OID 309890)
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
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN efectivo_caja.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.id IS 'Clave primaria';


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN efectivo_caja.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN efectivo_caja.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.tipo IS 'Caja/Caja chica';


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN efectivo_caja.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN efectivo_caja.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- TOC entry 179 (class 1259 OID 309888)
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
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 179
-- Name: efectivo_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE efectivo_caja_id_seq OWNED BY efectivo_caja.id;


--
-- TOC entry 192 (class 1259 OID 309984)
-- Name: empresas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE empresas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    rif character varying(255) NOT NULL
);


ALTER TABLE public.empresas OWNER TO eureka;

--
-- TOC entry 191 (class 1259 OID 309982)
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
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 191
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE empresas_id_seq OWNED BY empresas.id;


--
-- TOC entry 178 (class 1259 OID 309882)
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
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN inversiones.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.banco_id IS 'Clave foranea a la tabla Bancos';


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN inversiones.valor_desvalorizacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.valor_desvalorizacion IS 'Valorización desvalorización';


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN inversiones.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN inversiones.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 190 (class 1259 OID 309973)
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
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN inversiones_act_corr.ajuste_inflacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.ajuste_inflacion IS 'Ajuste por inflación';


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN inversiones_act_corr.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN inversiones_act_corr.perdida_valor; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.perdida_valor IS 'Pérdida por deterioro del valor';


--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN inversiones_act_corr.tipo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.tipo IS 'Clasificadas como activo corriente
Clasificadas como activo no corriente Disponibles para la venta y mantenidas hasta el vencimiento';


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN inversiones_act_corr.empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_act_corr.empresa_id IS 'Clave foranea a la tabla Empresas';


--
-- TOC entry 189 (class 1259 OID 309971)
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
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 189
-- Name: inversiones1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inversiones1_id_seq OWNED BY inversiones_act_corr.id;


--
-- TOC entry 177 (class 1259 OID 309880)
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
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 177
-- Name: inversiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inversiones_id_seq OWNED BY inversiones.id;


--
-- TOC entry 193 (class 1259 OID 309996)
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
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN inversiones_subsi.saldo_contabilidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.saldo_contabilidad IS 'Saldo según contabilidad';


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN inversiones_subsi.empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.empresa_id IS 'Clave foranea a la tabla Empresas';


--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN inversiones_subsi.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.contratista_id IS 'Clave foranea a la tabla Contratista';


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN inversiones_subsi.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN inversiones_subsi.id IS 'Clave primaria';


--
-- TOC entry 194 (class 1259 OID 310002)
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
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 194
-- Name: inversiones_subsi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inversiones_subsi_id_seq OWNED BY inversiones_subsi.id;


--
-- TOC entry 1898 (class 2604 OID 309858)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos ALTER COLUMN id SET DEFAULT nextval('"Bancos_id_seq"'::regclass);


--
-- TOC entry 1900 (class 2604 OID 309876)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas ALTER COLUMN id SET DEFAULT nextval('bancos_contratistas_id_seq'::regclass);


--
-- TOC entry 1901 (class 2604 OID 309877)
-- Name: contratista_id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas ALTER COLUMN contratista_id SET DEFAULT nextval('bancos_contratistas_contratista_id_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 309866)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas ALTER COLUMN id SET DEFAULT nextval('contratistas_id_seq'::regclass);


--
-- TOC entry 1905 (class 2604 OID 309947)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cuentas_cobrar_contrato ALTER COLUMN id SET DEFAULT nextval('cuentas_cobrar_contrato_id_seq'::regclass);


--
-- TOC entry 1906 (class 2604 OID 309958)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cuentas_cobrar_scontrato ALTER COLUMN id SET DEFAULT nextval('cuentas_cobrar_scontrato_id_seq'::regclass);


--
-- TOC entry 1907 (class 2604 OID 309966)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cuentas_cobro_dudoso ALTER COLUMN id SET DEFAULT nextval('cuentas_cobro_dudoso_id_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 309939)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY efectivo_banco ALTER COLUMN id SET DEFAULT nextval('efectivo_banco_id_seq'::regclass);


--
-- TOC entry 1903 (class 2604 OID 309893)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY efectivo_caja ALTER COLUMN id SET DEFAULT nextval('efectivo_caja_id_seq'::regclass);


--
-- TOC entry 1909 (class 2604 OID 309987)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas ALTER COLUMN id SET DEFAULT nextval('empresas_id_seq'::regclass);


--
-- TOC entry 1902 (class 2604 OID 309885)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY inversiones ALTER COLUMN id SET DEFAULT nextval('inversiones_id_seq'::regclass);


--
-- TOC entry 1908 (class 2604 OID 309976)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY inversiones_act_corr ALTER COLUMN id SET DEFAULT nextval('inversiones1_id_seq'::regclass);


--
-- TOC entry 1910 (class 2604 OID 310004)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY inversiones_subsi ALTER COLUMN id SET DEFAULT nextval('inversiones_subsi_id_seq'::regclass);


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 170
-- Name: Bancos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('"Bancos_id_seq"', 1, false);


--
-- TOC entry 2043 (class 0 OID 309855)
-- Dependencies: 171
-- Data for Name: bancos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY bancos (id, nombre, rif) FROM stdin;
\.


--
-- TOC entry 2048 (class 0 OID 309873)
-- Dependencies: 176
-- Data for Name: bancos_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY bancos_contratistas (id, banco_id, contratista_id, num_cuenta, ano) FROM stdin;
\.


--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 175
-- Name: bancos_contratistas_contratista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('bancos_contratistas_contratista_id_seq', 1, false);


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 174
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('bancos_contratistas_id_seq', 1, false);


--
-- TOC entry 2045 (class 0 OID 309863)
-- Dependencies: 173
-- Data for Name: contratistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas (id) FROM stdin;
\.


--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 172
-- Name: contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_id_seq', 1, false);


--
-- TOC entry 2056 (class 0 OID 309944)
-- Dependencies: 184
-- Data for Name: cuentas_cobrar_contrato; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY cuentas_cobrar_contrato (id, condiciones, num_contrato, porcentaje_avance, plazo_contrato, saldo_cont_corriente, saldo_cont_ncorriente, contratista_id, ano, cliente_id) FROM stdin;
\.


--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 183
-- Name: cuentas_cobrar_contrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cuentas_cobrar_contrato_id_seq', 1, false);


--
-- TOC entry 2058 (class 0 OID 309955)
-- Dependencies: 186
-- Data for Name: cuentas_cobrar_scontrato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cuentas_cobrar_scontrato (id, condiciones, saldo_conta_corriente, saldo_conta_ncorriente, contratista_id, ano, cliente_id) FROM stdin;
\.


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 185
-- Name: cuentas_cobrar_scontrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cuentas_cobrar_scontrato_id_seq', 1, false);


--
-- TOC entry 2060 (class 0 OID 309963)
-- Dependencies: 188
-- Data for Name: cuentas_cobro_dudoso; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY cuentas_cobro_dudoso (id, contratista_id, cliente_id, cta_cobrar30, cta_cobrar60, cta_cobrar90, cta_cobrar_m, estimacion, saldo_conta_corriente, saldo_conta_ncorriente, ano) FROM stdin;
\.


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 187
-- Name: cuentas_cobro_dudoso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cuentas_cobro_dudoso_id_seq', 1, false);


--
-- TOC entry 2054 (class 0 OID 309936)
-- Dependencies: 182
-- Data for Name: efectivo_banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY efectivo_banco (id, contratista_id, banco_id, saldo_banco, depos_transito, saldo_contabilidad, che_transito, nd_contabilizadas, nc_contabilizadas, ano) FROM stdin;
\.


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 181
-- Name: efectivo_banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('efectivo_banco_id_seq', 1, false);


--
-- TOC entry 2052 (class 0 OID 309890)
-- Dependencies: 180
-- Data for Name: efectivo_caja; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY efectivo_caja (id, contratista_id, principal, produccion, venta, administracion, otras, ano, tipo, saldo_contabilidad) FROM stdin;
\.


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 179
-- Name: efectivo_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('efectivo_caja_id_seq', 2, true);


--
-- TOC entry 2064 (class 0 OID 309984)
-- Dependencies: 192
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY empresas (id, nombre, rif) FROM stdin;
\.


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 191
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('empresas_id_seq', 1, false);


--
-- TOC entry 2050 (class 0 OID 309882)
-- Dependencies: 178
-- Data for Name: inversiones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY inversiones (id, banco_id, condiciones, costo_adquisicion, valor_desvalorizacion, saldo_contabilidad, contratista_id, ano) FROM stdin;
\.


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 189
-- Name: inversiones1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inversiones1_id_seq', 1, false);


--
-- TOC entry 2062 (class 0 OID 309973)
-- Dependencies: 190
-- Data for Name: inversiones_act_corr; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY inversiones_act_corr (id, contratista_id, instrumento, condiciones, costo_adquisicion, ajuste_inflacion, saldo_contabilidad, ano, perdida_valor, tipo, empresa_id) FROM stdin;
\.


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 177
-- Name: inversiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inversiones_id_seq', 1, false);


--
-- TOC entry 2065 (class 0 OID 309996)
-- Dependencies: 193
-- Data for Name: inversiones_subsi; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY inversiones_subsi (instrumento, condiciones, porcentaje_participacion, costo_adquisicion, ajuste_inflacion, saldo_contabilidad, ano, empresa_id, contratista_id, id) FROM stdin;
\.


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 194
-- Name: inversiones_subsi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inversiones_subsi_id_seq', 1, false);


--
-- TOC entry 1912 (class 2606 OID 309860)
-- Name: Bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos
    ADD CONSTRAINT "Bancos_pkey" PRIMARY KEY (id);


--
-- TOC entry 1916 (class 2606 OID 309879)
-- Name: bancos_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 1914 (class 2606 OID 309868)
-- Name: contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 1924 (class 2606 OID 309952)
-- Name: cuentas_cobrar_contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY cuentas_cobrar_contrato
    ADD CONSTRAINT cuentas_cobrar_contrato_pkey PRIMARY KEY (id);


--
-- TOC entry 1926 (class 2606 OID 309960)
-- Name: cuentas_cobrar_scontrato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cuentas_cobrar_scontrato
    ADD CONSTRAINT cuentas_cobrar_scontrato_pkey PRIMARY KEY (id);


--
-- TOC entry 1928 (class 2606 OID 309968)
-- Name: cuentas_cobro_dudoso_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY cuentas_cobro_dudoso
    ADD CONSTRAINT cuentas_cobro_dudoso_pkey PRIMARY KEY (id);


--
-- TOC entry 1922 (class 2606 OID 309941)
-- Name: efectivo_banco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY efectivo_banco
    ADD CONSTRAINT efectivo_banco_pkey PRIMARY KEY (id);


--
-- TOC entry 1920 (class 2606 OID 309895)
-- Name: efectivo_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY efectivo_caja
    ADD CONSTRAINT efectivo_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 1932 (class 2606 OID 309992)
-- Name: empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 309995)
-- Name: inversiones_act_corr_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inversiones_act_corr
    ADD CONSTRAINT inversiones_act_corr_pkey PRIMARY KEY (id);


--
-- TOC entry 1918 (class 2606 OID 309887)
-- Name: inversiones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inversiones
    ADD CONSTRAINT inversiones_pkey PRIMARY KEY (id);


--
-- TOC entry 1934 (class 2606 OID 310012)
-- Name: inversiones_subsi_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inversiones_subsi
    ADD CONSTRAINT inversiones_subsi_pkey PRIMARY KEY (id);


--
-- TOC entry 2073 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-01-09 20:56:09

--
-- PostgreSQL database dump complete
--

