CREATE TABLE "IBO" (
  "id" SERIAL PRIMARY KEY,
  "numero" VARCHAR,
  "nombre" VARCHAR,
  "telefono_diurno" VARCHAR,
  "correo_electronico" VARCHAR
);

CREATE TABLE "Direccion" (
  "id" SERIAL PRIMARY KEY,
  "id_ibo" INTEGER,
  "direccion" VARCHAR,
  "ciudad" VARCHAR,
  "estado" VARCHAR,
  "codigo_postal" VARCHAR,
  FOREIGN KEY ("id_ibo") REFERENCES "IBO" ("id")
);

CREATE TABLE "Pago" (
  "id" SERIAL PRIMARY KEY,
  "id_ibo" INTEGER,
  "metodo" VARCHAR,
  "nombre_tarjetahabiente" VARCHAR,
  "tipo_tarjeta" VARCHAR,
  "numero_tarjeta" VARCHAR,
  "fecha_vencimiento" DATE,
  "numero_cheque" VARCHAR,
  FOREIGN KEY ("id_ibo") REFERENCES "IBO" ("id")
);

CREATE TABLE "Producto" (
  "id" SERIAL PRIMARY KEY,
  "nombre" VARCHAR,
  "descripcion" VARCHAR,
  "precio" NUMERIC
);

CREATE TABLE "Pedido" (
  "id" SERIAL PRIMARY KEY,
  "id_ibo" INTEGER,
  "numero" VARCHAR,
  "cantidad" INTEGER,
  "color" VARCHAR,
  "talla" VARCHAR,
  "id_producto" INTEGER,
  "total" NUMERIC,
  "garantia" TEXT,
  "numero_factura" VARCHAR,
  "numero_cheque" VARCHAR,
  FOREIGN KEY ("id_ibo") REFERENCES "IBO" ("id"),
  FOREIGN KEY ("id_producto") REFERENCES "Producto" ("id")
);

CREATE TABLE "GarantiaSatisfaccion" (
  "id" SERIAL PRIMARY KEY,
  "id_pedido" INTEGER,
  "texto" VARCHAR,
  "tarifa" NUMERIC,
  FOREIGN KEY ("id_pedido") REFERENCES "Pedido" ("id")
);
