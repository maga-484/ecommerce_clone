import prisma from "../config/db.js";
import { ApiError } from "../utils/ApiError.js";

export const listar = async (req, res, next) => {
  try {
    const { id_producto } = req.query;
    const where = id_producto ? { id_producto: Number(id_producto) } : {};
    const resenas = await prisma.resena.findMany({
      where,
      include: {
        cliente: { select: { nombre: true, apellido: true } },
        producto: { select: { nombre: true } },
      },
      orderBy: { fecha: "desc" },
      take: 100,
    });
    res.json({ success: true, data: resenas });
  } catch (error) {
    next(error);
  }
};

export const crear = async (req, res, next) => {
  try {
    const { id_cliente, id_producto, puntuacion, comentario } = req.body;
    if (!id_cliente || !id_producto || !puntuacion) {
      throw new ApiError(400, "Faltan datos obligatorios");
    }
    if (puntuacion < 1 || puntuacion > 5) {
      throw new ApiError(400, "La puntuación debe estar entre 1 y 5");
    }
    const resena = await prisma.resena.create({
      data: {
        id_cliente,
        id_producto,
        puntuacion,
        comentario,
        fecha: new Date(),
      },
    });
    res.status(201).json({ success: true, data: resena });
  } catch (error) {
    next(error);
  }
};
