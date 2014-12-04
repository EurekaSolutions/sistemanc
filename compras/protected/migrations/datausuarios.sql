--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: compras
--

COPY usuarios (usuario_id, usuario, contrasena, correo, creado_el, actualizado_el, esta_activo, esta_deshabilitado, correo_verificado, llave_activacion, ultima_visita_el, nombre, cedula, cargo, rol, ente_organo_id) FROM stdin;
1	vpr	f4e77362a1deedd2c99588823165e826	vpr@vpr.vpr	2014-12-04 00:00:00	2014-12-04 00:00:00	t	f	t	\N	\N	Juan	Mendez	Presidente	\r	3049
\.


--
-- PostgreSQL database dump complete
--

