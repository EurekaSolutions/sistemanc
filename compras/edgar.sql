CREATE TABLE ramas
(
  id serial NOT NULL, -- Clave primaria.
  nombre character varying(255) NOT NULL, -- Nombre de la rama
  descripcion text, -- Informacion complementaria
  CONSTRAINT rama_pkey PRIMARY KEY (id),
  CONSTRAINT rama_nombre_key UNIQUE (nombre)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ramas
  OWNER TO eureka;
COMMENT ON TABLE ramas
  IS 'Rama de negociacion';
COMMENT ON COLUMN ramas.id IS 'Clave primaria';
COMMENT ON COLUMN ramas.nombre IS 'Nombre de la rama';
COMMENT ON COLUMN ramas.descripcion IS 'Informacion complementaria';


CREATE TABLE rama_productos
(
  id serial NOT NULL, -- Clave primaria
  nombre character varying(255) NOT NULL, -- Nombre del producto
  rama_id integer NOT NULL, -- Clave foranea a la tabla Rama
  CONSTRAINT rama_productos_pkey PRIMARY KEY (id),
  CONSTRAINT rama_productos_rama_id_fkey FOREIGN KEY (rama_id)
      REFERENCES ramas (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT rama_productos_nombre_rama_id_key UNIQUE (nombre, rama_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE rama_productos
  OWNER TO eureka;
COMMENT ON TABLE rama_productos
  IS 'Productos asociados a las ramas de negociacion';
COMMENT ON COLUMN rama_productos.id IS 'Clave primaria';
COMMENT ON COLUMN rama_productos.nombre IS 'Nombre del producto';
COMMENT ON COLUMN rama_productos.rama_id IS 'Clave foranea a la tabla Rama';

/***08/07/2015***/


CREATE TABLE proveedores_objetos
(
  id serial NOT NULL, -- Clave primaria.
  proveedor_id integer NOT NULL, -- Clave foránea a la tabla proveedores.
  ente_organo_id integer NOT NULL, -- Clave foranea a la tabla entes_organos
  rama_producto_id integer NOT NULL, -- Clave foranea a la tabla rama_productos
  CONSTRAINT extranjeros_objeto_pkey PRIMARY KEY (id),
  CONSTRAINT extranjeros_objeto_proveedor_extranjero_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_fk_ente_organos_proveedo_objeto FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_rama_productos_proveedores FOREIGN KEY (rama_producto_id)
      REFERENCES rama_productos (id) MATCH SIMPLE
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
COMMENT ON COLUMN proveedores_objetos.ente_organo_id IS 'Clave foranea a la tabla entes_organos';
COMMENT ON COLUMN proveedores_objetos.rama_producto_id IS 'Clave foranea a la tabla rama_productos';


-- Index: fki_fk_ente_organos_proveedo_objeto

-- DROP INDEX fki_fk_ente_organos_proveedo_objeto;

CREATE INDEX fki_fk_ente_organos_proveedo_objeto
  ON proveedores_objetos
  USING btree
  (ente_organo_id);

-- Index: fki_rama_productos_proveedores

-- DROP INDEX fki_rama_productos_proveedores;

CREATE INDEX fki_rama_productos_proveedores
  ON proveedores_objetos
  USING btree
  (rama_producto_id);



  -- Table: proveedores_cuentas

-- DROP TABLE proveedores_cuentas;

CREATE TABLE proveedores_cuentas
(
  id serial NOT NULL, -- Clave primaria.
  codigo_swift character varying(255) NOT NULL, -- Código Swift.
  num_cuenta_bancaria character varying(255) NOT NULL, -- Número de cuenta bancaria.
  proveedor_id integer NOT NULL, -- Clave foránea a la tabla proveedores.
  ente_organo_id integer NOT NULL, -- Clave foranea a la tabla entes_organos
  CONSTRAINT proveedores_cuentas_pkey PRIMARY KEY (id),
  CONSTRAINT fk_ente_organo_cuentas_proveedores FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
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
COMMENT ON COLUMN proveedores_cuentas.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


-- Index: fki_ente_organo_cuentas_proveedores

-- DROP INDEX fki_ente_organo_cuentas_proveedores;

CREATE INDEX fki_ente_organo_cuentas_proveedores
  ON proveedores_cuentas
  USING btree
  (ente_organo_id);
  
  
 ALTER TABLE proveedores_objetos
   ADD COLUMN descripcion text NOT NULL;
COMMENT ON COLUMN proveedores_objetos.descripcion
  IS 'Informacion de complemento para el producto';
  
  
  /*09/07/2015*/
  
 
CREATE TABLE proveedor_motivo
(
  id serial NOT NULL, -- Clave primaria
  proveedor_id integer NOT NULL, -- Clave foranea a la tabla proveedores
  ente_organo_id integer NOT NULL, -- Clave foranea a la tabla ente_organos
  motivo text NOT NULL, -- Motivo de contratacion
  CONSTRAINT proveedor_motivo_pkey PRIMARY KEY (id),
  CONSTRAINT proveedor_motivo_ente_organo_id_fkey FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT proveedor_motivo_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE proveedor_motivo
  OWNER TO eureka;
COMMENT ON TABLE proveedor_motivo
  IS 'Tabla que almacena el motivo de contratacion de los provveedores extranjeros';
COMMENT ON COLUMN proveedor_motivo.id IS 'Clave primaria';
COMMENT ON COLUMN proveedor_motivo.proveedor_id IS 'Clave foranea a la tabla proveedores';
COMMENT ON COLUMN proveedor_motivo.ente_organo_id IS 'Clave foranea a la tabla ente_organos';
COMMENT ON COLUMN proveedor_motivo.motivo IS 'Motivo de contratacion';




-- Table: proveedor_dominio

-- DROP TABLE proveedor_dominio;

CREATE TABLE proveedor_dominio
(
  id serial NOT NULL, -- Clave foranea
  proveedor_id integer NOT NULL, -- Clave foranea a la tabla proveedor
  ente_organo_id integer NOT NULL, -- Clave foranea a la tabla ente_organos
  objeto text, -- Objeto principal
  CONSTRAINT proveedor_dominio_pkey PRIMARY KEY (id),
  CONSTRAINT proveedor_dominio_ente_organo_id_fkey FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT proveedor_dominio_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE proveedor_dominio
  OWNER TO eureka;
COMMENT ON TABLE proveedor_dominio
  IS 'Tabla que almacena los dominios principales de los proveedores extranejeros';
COMMENT ON COLUMN proveedor_dominio.id IS 'Clave foranea';
COMMENT ON COLUMN proveedor_dominio.proveedor_id IS 'Clave foranea a la tabla proveedor';
COMMENT ON COLUMN proveedor_dominio.ente_organo_id IS 'Clave foranea a la tabla ente_organos';
COMMENT ON COLUMN proveedor_dominio.objeto IS 'Objeto principal';

