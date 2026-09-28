import prisma from "../config/db.js";
import { ApiError } from "../utils/ApiError.js";

export const listar = async (req, res, next) => {
  try {
    const clientes = await prisma.cliente.findMany({
      include: { _count: { select: { pedidos: true } } },
      orderBy: { id_cliente: "asc" },
    });
    res.json({ success: true, data: clientes });
  } catch (error) {
    next(error);
  }
};

export const obtenerPorId = async (req, res, next) => {
  try {
    const cliente = await prisma.cliente.findUnique({
      where: { id_cliente: Number(req.params.id) },
      include: { _count: { select: { pedidos: true, resenas: true } } },
    });
    if (!cliente) throw new ApiError(404, "Cliente no encontrado");
    res.json({ success: true, data: cliente });
  } catch (error) {
    next(error);
  }
};

export const obtenerPedidos = async (req, res, next) => {
  try {
    const pedidos = await prisma.pedido.findMany({
      where: { id_cliente: Number(req.params.id) },
      include: {
        lineas: { include: { producto: { include: { marca: true } } } },
        pagos: true,
        envio: true,
      },
      orderBy: { fecha: "desc" },
    });
    res.json({ success: true, data: pedidos });
  } catch (error) {
    next(error);
  }
};
