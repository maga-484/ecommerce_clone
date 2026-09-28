import prisma from "../config/db.js";
import { ApiError } from "../utils/ApiError.js";

export const listar = async (req, res, next) => {
  try {
    const pagos = await prisma.pago.findMany({
      include: {
        pedido: {
          include: { cliente: { select: { nombre: true, apellido: true } } },
        },
      },
      orderBy: { fecha: "desc" },
      take: 50,
    });
    res.json({ success: true, data: pagos });
  } catch (error) {
    next(error);
  }
};

export const obtenerPorId = async (req, res, next) => {
  try {
    const pago = await prisma.pago.findUnique({
      where: { id_pago: Number(req.params.id) },
      include: { pedido: true },
    });
    if (!pago) throw new ApiError(404, "Pago no encontrado");
    res.json({ success: true, data: pago });
  } catch (error) {
    next(error);
  }
};
