const prisma = require('../utils/db');

async function createOrder(orderData) {
  try {
    return await prisma.pedido.create({
      data: {
        numero: orderData.pedido.numero,
        cantidad: orderData.pedido.cantidad,
        color: orderData.pedido.color,
        talla: orderData.pedido.talla,
        total: orderData.pedido.total,
        garantia: orderData.pedido.garantia,
        numero_factura: orderData.pedido.numero_factura,
        numero_cheque: orderData.pedido.numero_cheque,
        IBO: {
          create: {
            numero: orderData.ibo.numero,
            nombre: orderData.ibo.nombre,
            telefono_diurno: orderData.ibo.telefono_diurno,
            correo_electronico: orderData.ibo.correo_electronico
          }
        },
        Producto: {
          connectOrCreate: {
            where: { id: orderData.producto.id }, // Aquí especifica el id si lo tienes disponible
            create: {
              nombre: orderData.producto.nombre,
              descripcion: orderData.producto.descripcion,
              precio: orderData.producto.precio
            }
          }
        },
        GarantiaSatisfacciones: {
          create: {
            texto: orderData.garantiaSatisfaccion.texto,
            tarifa: orderData.garantiaSatisfaccion.tarifa
          }
        }
      }
    });
  } catch (error) {
    console.error("Error al crear el pedido:", error);
    throw error;
  }
}

async function getOrders() {
  return await prisma.pedido.findMany({
    include: {
      IBO: true,
      Producto: true,
      GarantiaSatisfacciones: true
    }
  });
}

module.exports = {
  createOrder,
  getOrders
};
