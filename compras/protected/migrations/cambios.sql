tablas seleccionadas para la replicación
presupuesto_partidas
presupuesto_importacion
presupuesto_productos
presupuesto_partida_acciones
presupuesto_partida_proyecto
procedimientos
proveedores
proyectos
facturas
facturas_productos
fuente_presupuesto


pg_dump -d sistemanc -U eureka -f trimestre.sql -n public -t presupuesto_partidas -t facturas -t facturas_productos -t fuente_presupuesto -t presupuesto_importacion -t presupuesto_partida_acciones -t presupuesto_partida_proyecto -t presupuesto_partidas -t presupuesto_productos -t procedimientos -t proveedores -t proyectos


Agregado Anho por default a 2015 a la tabla proyectos y presupuesto_partida_acciones
Seteado el anho a 2015 en la tabla presupuesto_partidas para los registros que aún tenían 2014
UPDATE presupuesto_partidas SET anho = 2015


-- Table: iva

-- DROP TABLE iva;

CREATE TABLE iva
(
  id serial NOT NULL,
  tipo character varying(255) NOT NULL, -- Tipo de IVA (Bien, Servicio u Obra)
  porcentaje numeric(38,6) NOT NULL, -- Porcentaje del tipo de IVA
  fecha timestamp without time zone NOT NULL DEFAULT now(), -- Fecha de creación del iva
  CONSTRAINT iva_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE iva
  OWNER TO eureka;
COMMENT ON TABLE iva
  IS 'Almacena los IVA disponible según bien/servicio/obra a cancelar';
COMMENT ON COLUMN iva.tipo IS 'Tipo de IVA (Bien, Servicio u Obra)';
COMMENT ON COLUMN iva.porcentaje IS 'Porcentaje del tipo de IVA';
COMMENT ON COLUMN iva.fecha IS 'Fecha de creación del iva';



-- Column: anho

-- ALTER TABLE proyecto DROP COLUMN anho;

ALTER TABLE proyectos ADD COLUMN anho integer;
update proyectos set anho=extract(YEAR FROM now());
ALTER TABLE proyectos ALTER COLUMN anho SET NOT NULL;
COMMENT ON COLUMN proyectos.anho IS 'Año de carga del proyecto';

-- Column: anho

-- ALTER TABLE presupuesto_partida_acciones DROP COLUMN anho;

ALTER TABLE presupuesto_partida_acciones ADD COLUMN anho integer;
update presupuesto_partida_acciones set anho=extract(YEAR FROM now());
ALTER TABLE presupuesto_partida_acciones ALTER COLUMN anho SET NOT NULL;
COMMENT ON COLUMN presupuesto_partida_acciones.anho IS 'Año de carga de la acción';




ALTER TABLE activerecordlog ALTER COLUMN userid TYPE integer USING userid::numeric;



-- Table: proveedores

-- DROP TABLE proveedores;

CREATE TABLE proveedores
(
  id serial NOT NULL,
  rif character varying(10) NOT NULL, -- RIF del proveedor (Formato: X123456789) Mismo formato que el Sistema de RNC
  razon_social character varying(255) NOT NULL, -- Razon social del proveedor
  fecha timestamp with time zone NOT NULL DEFAULT now(), -- Fecha de creación del registro
  ente_organo_id integer NOT NULL, -- Clave foranea a la tabla entes_organos
  CONSTRAINT proveedores_pkey PRIMARY KEY (id),
  CONSTRAINT fk_ente_organo_proveedor FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT proveedores_rif_ente_organo_id_key UNIQUE (rif, ente_organo_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE proveedores
  OWNER TO eureka;
COMMENT ON TABLE proveedores
  IS 'Proveedores del modulo de rendición de cuentas';
COMMENT ON COLUMN proveedores.rif IS 'RIF del proveedor (Formato: X123456789) Mismo formato que el Sistema de RNC';
COMMENT ON COLUMN proveedores.razon_social IS 'Razon social del proveedor';
COMMENT ON COLUMN proveedores.fecha IS 'Fecha de creación del registro';
COMMENT ON COLUMN proveedores.ente_organo_id IS 'Clave foranea a la tabla entes_organos';





-- Table: procedimientos

-- DROP TABLE procedimientos;

CREATE TABLE procedimientos
(
  id serial NOT NULL,
  num_contrato character varying(255) NOT NULL, -- Es el modulo donde se carga el Nº de contrato, orden de servicio u orden de compra que le da inicio al proceso de adquisición o contratación.
  anho integer NOT NULL, -- Año de carga del procedimiento
  fecha timestamp with time zone NOT NULL DEFAULT now(), -- Fecha de creación del registro
  tipo character varying(255) NOT NULL, -- Tipo de procedimientos, si es una obra, un servicio o compra
  ente_organo_id integer NOT NULL, -- Clave foranea a la tabla entes_organos
  CONSTRAINT procedimientos_pkey PRIMARY KEY (id),
  CONSTRAINT fk_ente_organo_procedimientos FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE procedimientos
  OWNER TO eureka;
COMMENT ON TABLE procedimientos
  IS 'Procedimiento: orden o servicio que le da pie a la carga de una factura en el módulo de rendición de cuentas.';
COMMENT ON COLUMN procedimientos.num_contrato IS 'Es el modulo donde se carga el Nº de contrato, orden de servicio u orden de compra que le da inicio al proceso de adquisición o contratación.';
COMMENT ON COLUMN procedimientos.anho IS 'Año de carga del procedimiento';
COMMENT ON COLUMN procedimientos.fecha IS 'Fecha de creación del registro';
COMMENT ON COLUMN procedimientos.tipo IS 'Tipo de procedimientos, si es una obra, un servicio o compra';
COMMENT ON COLUMN procedimientos.ente_organo_id IS 'Clave foranea a la tabla entes_organos';


-- Table: facturas

-- DROP TABLE facturas;

CREATE TABLE facturas
(
  id serial NOT NULL,
  num_factura character varying(255) NOT NULL, -- Número de factura.
  anho integer, -- Año en que se cargo la factura
  proveedor_id integer NOT NULL, -- Clave foránea a la tabla Proveedores
  procedimiento_id integer NOT NULL, -- Clave foránea a la tabla Procedimientos
  fecha timestamp with time zone NOT NULL DEFAULT now(), -- Fecha de creación del registro
  fecha_factura date, -- Fecha de emisióin de la factura
  ente_organo_id integer NOT NULL, -- Clave foranea a la tabla entes_organos
  cierre_carga boolean, -- Indica si se finalizó la carga de la  Factura.
  CONSTRAINT facturas_pkey PRIMARY KEY (id),
  CONSTRAINT facturas_procedimiento_id_fkey FOREIGN KEY (procedimiento_id)
      REFERENCES procedimientos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ente_organo_id_factura FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT facturas_num_factura_key UNIQUE (num_factura)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE facturas
  OWNER TO eureka;
COMMENT ON TABLE facturas
  IS 'Factura del modulo de rendición de cuentas';
COMMENT ON COLUMN facturas.num_factura IS 'Número de factura.';
COMMENT ON COLUMN facturas.anho IS 'Año en que se cargo la factura';
COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foránea a la tabla Proveedores';
COMMENT ON COLUMN facturas.procedimiento_id IS 'Clave foránea a la tabla Procedimientos';
COMMENT ON COLUMN facturas.fecha IS 'Fecha de creación del registro';
COMMENT ON COLUMN facturas.fecha_factura IS 'Fecha de emisióin de la factura';
COMMENT ON COLUMN facturas.ente_organo_id IS 'Clave foranea a la tabla entes_organos';
COMMENT ON COLUMN facturas.cierre_carga IS 'Indica si se finalizó la carga de la  Factura.';



-- Table: facturas_productos

-- DROP TABLE facturas_productos;

CREATE TABLE facturas_productos
(
  id serial NOT NULL,
  factura_id integer NOT NULL, -- Factura a la cual esta asociado el producto.
  producto_id integer NOT NULL, -- Clave foranea a la tabla productos
  costo_unitario numeric(38,6) NOT NULL, -- Costo unitario del producto
  cantidad_adquirida integer, -- Cantidad del producto adquirido en la factura
  iva_id integer, -- Clave foránea a la tabla IVA
  fecha timestamp with time zone NOT NULL DEFAULT now(), -- Fecha de creación del registro
  presupuesto_partida_id integer NOT NULL, -- Clave foranea a la tabla Presupuesto_partida
  CONSTRAINT facturas_productos_pkey PRIMARY KEY (id),
  CONSTRAINT facturas_productos_factura_id_fkey FOREIGN KEY (factura_id)
      REFERENCES facturas (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT facturas_productos_iva_id_fkey FOREIGN KEY (iva_id)
      REFERENCES iva (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT facturas_productos_producto_id_fkey FOREIGN KEY (producto_id)
      REFERENCES productos (producto_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_presupuesto_partida_id FOREIGN KEY (presupuesto_partida_id)
      REFERENCES presupuesto_partidas (presupuesto_partida_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE facturas_productos
  OWNER TO eureka;
COMMENT ON COLUMN facturas_productos.factura_id IS 'Factura a la cual esta asociado el producto.';
COMMENT ON COLUMN facturas_productos.producto_id IS 'Clave foranea a la tabla productos';
COMMENT ON COLUMN facturas_productos.costo_unitario IS 'Costo unitario del producto';
COMMENT ON COLUMN facturas_productos.cantidad_adquirida IS 'Cantidad del producto adquirido en la factura';
COMMENT ON COLUMN facturas_productos.iva_id IS 'Clave foránea a la tabla IVA';
COMMENT ON COLUMN facturas_productos.fecha IS 'Fecha de creación del registro';
COMMENT ON COLUMN facturas_productos.presupuesto_partida_id IS 'Clave foranea a la tabla Presupuesto_partida';



--Reemplazo de los guiones de los rif de entes_organos
update entes_organos set rif = replace(rif, '-', '');




ALTER TABLE fuente_presupuesto ADD COLUMN monto numeric(38,6);
COMMENT ON COLUMN fuente_presupuesto.monto IS 'Monto asignado de la fuente de financiamiento';
ALTER TABLE fuente_presupuesto ADD COLUMN fecha_registro date;
ALTER TABLE fuente_presupuesto ALTER COLUMN fecha_registro SET DEFAULT now();
COMMENT ON COLUMN fuente_presupuesto.fecha_registro IS 'Fecha del momento que se asigna el monto y la fuente de financiamiento al proyecto o accion.';
UPDATE fuente_presupuesto SET fecha_registro=now();
ALTER TABLE fuente_presupuesto ALTER COLUMN fecha_registro SET NOT NULL;


--Reemplazando los roles normales de los usurios por sus correspondiente en la tabla usuarios
UPDATE usuarios SET rol='ente' FROM 
(select * from usuarios as us, entes_organos as eo where us.rol='normal' and eo.ente_organo_id=us.ente_organo_id) as resultado
WHERE resultado.usuario_id=usuarios.usuario_id and resultado.tipo='E';

UPDATE usuarios SET rol='organo' FROM 
(select * from usuarios as us, entes_organos as eo where us.rol='normal' and eo.ente_organo_id=us.ente_organo_id) as resultado
WHERE resultado.usuario_id=usuarios.usuario_id and resultado.tipo='O';


(select COUNT(*) from usuarios as us, entes_organos as eo where us.rol='normal' and eo.ente_organo_id=us.ente_organo_id and eo.tipo= 'E');

(select COUNT(*) from usuarios as us, entes_organos as eo where us.rol='normal' and eo.ente_organo_id=us.ente_organo_id and eo.tipo= 'O');


-- Column: fecha_estimada

-- ALTER TABLE presupuesto_productos DROP COLUMN fecha_estimada;

ALTER TABLE presupuesto_productos ADD COLUMN fecha_estimada date;
COMMENT ON COLUMN presupuesto_productos.fecha_estimada IS 'Fecha estimada de adquisición o contratación';


ALTER TABLE presupuesto_partidas DROP COLUMN fuente_fianciamiento_id CASCADE;


Take a dump of your public schema using pg_dump
run "ALTER SCHEMA public RENAME TO public_copy"
Restore your dump of your public schema from step 1 using pg_restore

Actualizar constraints







--*** MODULO DE RENDICIÓN DE CUENTAS ***--

 DROP TABLE trimestre1.proveedores CASCADE;
 DROP TABLE trimestre2.proveedores CASCADE;
 DROP TABLE trimestre3.proveedores CASCADE;
 DROP TABLE trimestre4.proveedores CASCADE;

 ALTER TABLE trimestre1.facturas
  ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

 ALTER TABLE trimestre2.facturas
  ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

 ALTER TABLE trimestre3.facturas
  ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

 ALTER TABLE trimestre4.facturas
  ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id)
      REFERENCES proveedores (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

CREATE TABLE proveedores_entes_organos
(
 id serial NOT NULL, -- Clave primera
 proveedor_id integer NOT NULL, -- Clave foranea a la tabla proveedores
 ente_organo_id integer NOT NULL, -- Clave foranea a la tabla ente_organo
 anho integer NOT NULL, -- Año en que se creo la relacion
 CONSTRAINT proveedores_entes_organos_pkey PRIMARY KEY (id),
 CONSTRAINT proveedores_entes_organos_proveedor_id_ente_organo_id_key UNIQUE (proveedor_id, ente_organo_id)
)
WITH (
 OIDS=FALSE
);
ALTER TABLE proveedores_entes_organos
 OWNER TO eureka;
COMMENT ON TABLE proveedores_entes_organos
 IS 'Tabla que determina cuales son los proveedores relacionados con un ente u organo';
COMMENT ON COLUMN proveedores_entes_organos.id IS 'Clave primera ';
COMMENT ON COLUMN proveedores_entes_organos.proveedor_id IS 'Clave foranea a la tabla proveedores';
COMMENT ON COLUMN proveedores_entes_organos.ente_organo_id IS 'Clave foranea a la tabla ente_organo';
COMMENT ON COLUMN proveedores_entes_organos.anho IS 'Año en que se creo la relacion';


ALTER TABLE proveedores_entes_organos
 ADD CONSTRAINT proveedores_entes_organos_proveedor_id_fkey FOREIGN KEY (proveedor_id)
     REFERENCES proveedores (id) MATCH SIMPLE
     ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE proveedores_entes_organos
  ADD CONSTRAINT proveedores_entes_organos_ente_organo_id_fkey FOREIGN KEY (ente_organo_id)
      REFERENCES entes_organos (ente_organo_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;





ALTER TABLE proveedores ADD COLUMN ahno integer;
COMMENT ON COLUMN proveedores.ahno IS 'Año del registro';


ALTER TABLE trimestre1.facturas DROP CONSTRAINT facturas_num_factura_key;
ALTER TABLE trimestre2.facturas DROP CONSTRAINT facturas_num_factura_key;
ALTER TABLE trimestre3.facturas DROP CONSTRAINT facturas_num_factura_key;
ALTER TABLE trimestre4.facturas DROP CONSTRAINT facturas_num_factura_key;

DROP TABLE facturas CASCADE;
DROP TABLE facturas_productos CASCADE;
DROP TABLE procedimientos CASCADE;

ALTER TABLE trimestre1.facturas
  ADD CONSTRAINT facturas_proveedor_id_num_factura_key UNIQUE(proveedor_id, num_factura);
ALTER TABLE trimestre2.facturas
  ADD CONSTRAINT facturas_proveedor_id_num_factura_key UNIQUE(proveedor_id, num_factura);
ALTER TABLE trimestre3.facturas
  ADD CONSTRAINT facturas_proveedor_id_num_factura_key UNIQUE(proveedor_id, num_factura);
ALTER TABLE trimestre4.facturas
  ADD CONSTRAINT facturas_proveedor_id_num_factura_key UNIQUE(proveedor_id, num_factura);

ALTER TABLE trimestre1.facturas ALTER COLUMN cierre_carga SET DEFAULT false;
ALTER TABLE trimestre2.facturas ALTER COLUMN cierre_carga SET DEFAULT false;
ALTER TABLE trimestre3.facturas ALTER COLUMN cierre_carga SET DEFAULT false;
ALTER TABLE trimestre4.facturas ALTER COLUMN cierre_carga SET DEFAULT false;


ALTER TABLE iva ADD COLUMN sys_status boolean;
ALTER TABLE iva ALTER COLUMN sys_status SET DEFAULT true;
COMMENT ON COLUMN iva.sys_status IS 'Si el iva esta o no activo';


ALTER TABLE facturas_productos ADD COLUMN unidad_id bigint;
COMMENT ON COLUMN facturas_productos.unidad_id IS 'Clave foranea a la tabla Unidades';
ALTER TABLE trimestre1.facturas_productos ADD COLUMN unidad_id bigint;
COMMENT ON COLUMN trimestre1.facturas_productos.unidad_id IS 'Clave foranea a la tabla Unidades';
ALTER TABLE trimestre2.facturas_productos ADD COLUMN unidad_id bigint;
COMMENT ON COLUMN trimestre2.facturas_productos.unidad_id IS 'Clave foranea a la tabla Unidades';
ALTER TABLE trimestre3.facturas_productos ADD COLUMN unidad_id bigint;
COMMENT ON COLUMN trimestre3.facturas_productos.unidad_id IS 'Clave foranea a la tabla Unidades';
ALTER TABLE trimestre4.facturas_productos ADD COLUMN unidad_id bigint;
COMMENT ON COLUMN trimestre4.facturas_productos.unidad_id IS 'Clave foranea a la tabla Unidades';
ALTER TABLE facturas_productos
  ADD CONSTRAINT fk_unidades_productos FOREIGN KEY (unidad_id)
      REFERENCES unidades (unidad_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE trimestre1.facturas_productos
  ADD CONSTRAINT fk_unidades_productos FOREIGN KEY (unidad_id)
      REFERENCES unidades (unidad_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE trimestre2.facturas_productos
  ADD CONSTRAINT fk_unidades_productos FOREIGN KEY (unidad_id)
      REFERENCES unidades (unidad_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE trimestre3.facturas_productos
  ADD CONSTRAINT fk_unidades_productos FOREIGN KEY (unidad_id)
      REFERENCES unidades (unidad_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;      

ALTER TABLE trimestre4.facturas_productos
  ADD CONSTRAINT fk_unidades_productos FOREIGN KEY (unidad_id)
      REFERENCES unidades (unidad_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

update trimestre1.facturas_productos set unidad_id = 631;