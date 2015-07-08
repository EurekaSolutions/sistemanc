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

