-- CreateTable
CREATE TABLE "IBO" (
    "id" SERIAL NOT NULL,
    "numero" TEXT,
    "nombre" TEXT,
    "telefono_diurno" TEXT,
    "correo_electronico" TEXT,

    CONSTRAINT "IBO_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Direccion" (
    "id" SERIAL NOT NULL,
    "id_ibo" INTEGER NOT NULL,
    "direccion" TEXT,
    "ciudad" TEXT,
    "estado" TEXT,
    "codigo_postal" TEXT,

    CONSTRAINT "Direccion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pago" (
    "id" SERIAL NOT NULL,
    "id_ibo" INTEGER NOT NULL,
    "metodo" TEXT,
    "nombre_tarjetahabiente" TEXT,
    "tipo_tarjeta" TEXT,
    "numero_tarjeta" TEXT,
    "fecha_vencimiento" TIMESTAMP(3),
    "numero_cheque" TEXT,

    CONSTRAINT "Pago_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Producto" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT,
    "descripcion" TEXT,
    "precio" DOUBLE PRECISION,

    CONSTRAINT "Producto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pedido" (
    "id" SERIAL NOT NULL,
    "id_ibo" INTEGER NOT NULL,
    "numero" TEXT,
    "cantidad" INTEGER,
    "color" TEXT,
    "talla" TEXT,
    "id_producto" INTEGER NOT NULL,
    "total" DOUBLE PRECISION,
    "garantia" TEXT,
    "numero_factura" TEXT,
    "numero_cheque" TEXT,

    CONSTRAINT "Pedido_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GarantiaSatisfaccion" (
    "id" SERIAL NOT NULL,
    "id_pedido" INTEGER NOT NULL,
    "texto" TEXT,
    "tarifa" DOUBLE PRECISION,

    CONSTRAINT "GarantiaSatisfaccion_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Direccion" ADD CONSTRAINT "Direccion_id_ibo_fkey" FOREIGN KEY ("id_ibo") REFERENCES "IBO"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pago" ADD CONSTRAINT "Pago_id_ibo_fkey" FOREIGN KEY ("id_ibo") REFERENCES "IBO"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedido" ADD CONSTRAINT "Pedido_id_ibo_fkey" FOREIGN KEY ("id_ibo") REFERENCES "IBO"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedido" ADD CONSTRAINT "Pedido_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GarantiaSatisfaccion" ADD CONSTRAINT "GarantiaSatisfaccion_id_pedido_fkey" FOREIGN KEY ("id_pedido") REFERENCES "Pedido"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
