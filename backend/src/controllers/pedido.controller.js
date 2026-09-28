import prisma from "../config/db.js";
import { ApiError } from "../utils/ApiError.js";

export const listar = async (req, res, next) => {
  try {
    const pedidos = await prisma.pedido.findMany({
      include: {
        cliente: { select: { nombre: true, apellido: true } },
        _count: { select: { lineas: true } },
      },
      orderBy: { fecha: "desc" },
      take: 50,
    });
    res.json({ success: true, data: pedidos });
  } catch (error) {
    next(error);
  }
};

export const obtenerPorId = async (req, res, next) => {
  try {
    const pedido = await prisma.pedido.findUnique({
      where: { id_pedido: Number(req.params.id) },
      include: {
        cliente: true,
        envio: true,
        pagos: true,
        lineas: { include: { producto: { include: { marca: true } } } },
      },
    });
    if (!pedido) throw new ApiError(404, "Pedido no encontrado");
    res.json({ success: true, data: pedido });
  } catch (error) {
    next(error);
  }
};

/**
 * Crear pedido completo: pedido + líneas + pago
 * Body esperado:
 * {
 *   id_cliente: 1,
 *   metodo_pago: "Tarjeta de Crédito",
 *   items: [{ id_producto: 1, cantidad: 2 }, ...]
 * }
 */
export const crear = async (req, res, next) => {
  try {
    const { id_cliente, metodo_pago, items } = req.body;

    if (!id_cliente || !items?.length) {
      throw new ApiError(
        400,
        "Datos incompletos: id_cliente e items son obligatorios",
      );
    }

    // 1. Traer productos y validar stock
    const idsProductos = items.map((i) => i.id_producto);
    const productos = await prisma.producto.findMany({
      where: { id_producto: { in: idsProductos } },
    });

    if (productos.length !== idsProductos.length) {
      throw new ApiError(400, "Uno o más productos no existen");
    }

    // 2. Calcular total
    const lineasData = items.map((item) => {
      const prod = productos.find((p) => p.id_producto === item.id_producto);
      return {
        id_producto: item.id_producto,
        cantidad: item.cantidad,
        precio_unitario: prod.precio,
      };
    });

    const total = lineasData.reduce(
      (acc, l) => acc + Number(l.precio_unitario) * l.cantidad,
      0,
    );

    // 3. Transacción: crear pedido + líneas + pago
    const resultado = await prisma.$transaction(async (tx) => {
      const pedido = await tx.pedido.create({
        data: {
          fecha: new Date(),
          total,
          estado: "Pendiente",
          id_cliente,
          lineas: { create: lineasData },
        },
        include: { lineas: true },
      });

      const pago = await tx.pago.create({
        data: {
          metodo: metodo_pago || "Tarjeta de Crédito",
          monto: total,
          fecha: new Date(),
          id_pedido: pedido.id_pedido,
        },
      });

      return { pedido, pago };
    });

    res.status(201).json({ success: true, data: resultado });
  } catch (error) {
    next(error);
  }
};

export const actualizarEstado = async (req, res, next) => {
  try {
    const { estado } = req.body;
    const pedido = await prisma.pedido.update({
      where: { id_pedido: Number(req.params.id) },
      data: { estado },
    });
    res.json({ success: true, data: pedido });
  } catch (error) {
    next(error);
  }
};
