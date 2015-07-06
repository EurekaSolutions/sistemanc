
-- Column: anho

-- ALTER TABLE proveedores DROP COLUMN anho;

ALTER TABLE proveedores ADD COLUMN anho integer;
COMMENT ON COLUMN proveedores.anho IS 'Año del registro';


-- Column: nacional

-- ALTER TABLE proveedores DROP COLUMN nacional;

ALTER TABLE proveedores ADD COLUMN nacional boolean;
ALTER TABLE proveedores ALTER COLUMN nacional SET NOT NULL;
ALTER TABLE proveedores ALTER COLUMN nacional SET DEFAULT true;
COMMENT ON COLUMN proveedores.nacional IS 'Indica si es nacional o extranjera.';


-- Table: objetos_principales

-- DROP TABLE objetos_principales;

CREATE TABLE objetos_principales
(
  id integer NOT NULL DEFAULT nextval('objeto_principal_id_seq'::regclass), -- Clave primaria.
  nombre character varying(255) NOT NULL, -- Nombre del objeto princiapal.
  descripcion character varying(255), -- Descripción del tipo de obejto principal.
  CONSTRAINT objeto_principal_pkey PRIMARY KEY (id),
  CONSTRAINT objeto_principal_nombre_key UNIQUE (nombre)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE objetos_principales
  OWNER TO eureka;
COMMENT ON TABLE objetos_principales
  IS 'Lista de objeto principal.';
COMMENT ON COLUMN objetos_principales.id IS 'Clave primaria.';
COMMENT ON COLUMN objetos_principales.nombre IS 'Nombre del objeto princiapal.';
COMMENT ON COLUMN objetos_principales.descripcion IS 'Descripción del tipo de obejto principal.';



-- Table: paises

-- DROP TABLE paises;

CREATE TABLE paises
(
  id serial NOT NULL, -- Clave primaria.
  codigo_iso character varying(20) NOT NULL, -- Código ISO del país.
  pais character varying(255) NOT NULL, -- Nombre del país.
  codigo_tlf character varying(20) NOT NULL, -- Código telefónico del país.
  CONSTRAINT paises_pkey PRIMARY KEY (id),
  CONSTRAINT paises_codigo_iso_key UNIQUE (codigo_iso),
  CONSTRAINT paises_codigo_tlf_key UNIQUE (codigo_tlf),
  CONSTRAINT paises_pais_key UNIQUE (pais)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE paises
  OWNER TO eureka;
COMMENT ON TABLE paises
  IS 'Lista de países con codigo ISO y codigo telefónico.';
COMMENT ON COLUMN paises.id IS 'Clave primaria.';
COMMENT ON COLUMN paises.codigo_iso IS 'Código ISO del país.';
COMMENT ON COLUMN paises.pais IS 'Nombre del país.';
COMMENT ON COLUMN paises.codigo_tlf IS 'Código telefónico del país.';


-- Table: personas_contacto

-- DROP TABLE personas_contacto;

CREATE TABLE personas_contacto
(
  id serial NOT NULL, -- Clave primaria.
  nombre character varying(255) NOT NULL, -- Nombre de la persona.
  documento_identidad character varying(255), -- Documento de identidad.
  tlf_fijo character varying(255) NOT NULL, -- Telefono fijo.
  tlf_movil character varying(255), -- Telefono Móvil (Indicar códgios de acceso internacional)
  fax_telefax character varying(255), -- Fax o Telefax  (Indicar códgios de acceso internacional).
  correo_electronico character varying(255) NOT NULL, -- Correo electrónico.
  proveedor_id integer NOT NULL, -- Clave foránea a la tabla proveedores.
  CONSTRAINT personas_contacto_pkey PRIMARY KEY (id),
  CONSTRAINT personas_contacto_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE personas_contacto
  OWNER TO eureka;
COMMENT ON TABLE personas_contacto
  IS 'Personas de Contacto proveedores.';
COMMENT ON COLUMN personas_contacto.id IS 'Clave primaria.';
COMMENT ON COLUMN personas_contacto.nombre IS 'Nombre de la persona.';
COMMENT ON COLUMN personas_contacto.documento_identidad IS 'Documento de identidad.';
COMMENT ON COLUMN personas_contacto.tlf_fijo IS 'Telefono fijo.';
COMMENT ON COLUMN personas_contacto.tlf_movil IS 'Telefono Móvil (Indicar códgios de acceso internacional)';
COMMENT ON COLUMN personas_contacto.fax_telefax IS 'Fax o Telefax  (Indicar códgios de acceso internacional).';
COMMENT ON COLUMN personas_contacto.correo_electronico IS 'Correo electrónico.';
COMMENT ON COLUMN personas_contacto.proveedor_id IS 'Clave foránea a la tabla proveedores.';




-- Table: proveedores_cuentas

-- DROP TABLE proveedores_cuentas;

CREATE TABLE proveedores_cuentas
(
  id serial NOT NULL, -- Clave primaria.
  codigo_swift character varying(255) NOT NULL, -- Código Swift.
  num_cuenta_bancaria character varying(255) NOT NULL, -- Número de cuenta bancaria.
  proveedor_id integer NOT NULL, -- Clave foránea a la tabla proveedores.
  CONSTRAINT proveedores_cuentas_pkey PRIMARY KEY (id),
  CONSTRAINT proveedores_cuentas_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT proveedores_cuentas_codigo_swift_num_cuenta_bancaria_key UNIQUE (codigo_swift, num_cuenta_bancaria)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE proveedores_cuentas
  OWNER TO eureka;
COMMENT ON COLUMN proveedores_cuentas.id IS 'Clave primaria.';
COMMENT ON COLUMN proveedores_cuentas.codigo_swift IS 'Código Swift.';
COMMENT ON COLUMN proveedores_cuentas.num_cuenta_bancaria IS 'Número de cuenta bancaria.';
COMMENT ON COLUMN proveedores_cuentas.proveedor_id IS 'Clave foránea a la tabla proveedores.';



-- Table: proveedores_extranjeros

-- DROP TABLE proveedores_extranjeros;

CREATE TABLE proveedores_extranjeros
(
  id serial NOT NULL, -- Clave primaria.
  proveedor_id integer, -- Clave foránea a la tabla proveedor.
  num_identificacion character varying(255), -- Código Fiscal, Tributario o Equivalente en el País de Origen`.
  pais_id integer NOT NULL, -- País de origente.
  codigo_postal serial NOT NULL, -- Código postal.
  calle character varying(255) NOT NULL, -- Calle
  distrito character varying(255), -- Distrti
  poblacion character varying(255) NOT NULL, -- Población.
  tlf_fijo character varying(255) NOT NULL, -- Teléfono fijo.
  pagina_web character varying(255) NOT NULL, -- Página Web.
  CONSTRAINT proveedores_extranjeros_pkey PRIMARY KEY (id),
  CONSTRAINT proveedores_extranjeros_pais_id_fkey FOREIGN KEY (pais_id)
      REFERENCES paises (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT proveedores_extranjeros_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE proveedores_extranjeros
  OWNER TO eureka;
COMMENT ON TABLE proveedores_extranjeros
  IS 'Información adicional para los proveedores extranjeros.';
COMMENT ON COLUMN proveedores_extranjeros.id IS 'Clave primaria.';
COMMENT ON COLUMN proveedores_extranjeros.proveedor_id IS 'Clave foránea a la tabla proveedor.';
COMMENT ON COLUMN proveedores_extranjeros.num_identificacion IS 'Código Fiscal, Tributario o Equivalente en el País de Origen`.';
COMMENT ON COLUMN proveedores_extranjeros.pais_id IS 'País de origente.';
COMMENT ON COLUMN proveedores_extranjeros.codigo_postal IS 'Código postal.';
COMMENT ON COLUMN proveedores_extranjeros.calle IS 'Calle';
COMMENT ON COLUMN proveedores_extranjeros.distrito IS 'Distrti';
COMMENT ON COLUMN proveedores_extranjeros.poblacion IS 'Población.';
COMMENT ON COLUMN proveedores_extranjeros.tlf_fijo IS 'Teléfono fijo.';
COMMENT ON COLUMN proveedores_extranjeros.pagina_web IS 'Página Web.';


-- Table: proveedores_objetos

-- DROP TABLE proveedores_objetos;

CREATE TABLE proveedores_objetos
(
  id integer NOT NULL DEFAULT nextval('extranjeros_objeto_id_seq'::regclass), -- Clave primaria.
  proveedor_id integer NOT NULL, -- Clave foránea a la tabla proveedores.
  objeto_principal_id integer NOT NULL, -- Clave foránea a la tabla Obejto Principal.
  CONSTRAINT extranjeros_objeto_pkey PRIMARY KEY (id),
  CONSTRAINT extranjeros_objeto_objeto_principal_id_fkey FOREIGN KEY (objeto_principal_id)
      REFERENCES objeto_principal (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT extranjeros_objeto_proveedor_extranjero_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE proveedores_objetos
  OWNER TO eureka;
COMMENT ON TABLE proveedores_objetos
  IS 'Relación entre el proveedor extranjero y el objeto principal';
COMMENT ON COLUMN proveedores_objetos.id IS 'Clave primaria.';
COMMENT ON COLUMN proveedores_objetos.proveedor_id IS 'Clave foránea a la tabla proveedores.';
COMMENT ON COLUMN proveedores_objetos.objeto_principal_id IS 'Clave foránea a la tabla Obejto Principal.';

