import prisma from "../config/db.js";
import { ApiError } from "../utils/ApiError.js";

export const listar = async (req, res, next) => {
  try {
    const { categoria, marca, search, page = 1, limit = 12 } = req.query;
    const skip = (Number(page) - 1) * Number(limit);

    const where = {};
    if (categoria)
      where.id_subcategoria = {
        in: (
          await prisma.subcategoria.findMany({
            where: { id_categoria: Number(categoria) },
            select: { id_subcategoria: true },
          })
        ).map((s) => s.id_subcategoria),
      };
    if (marca) where.id_marca = Number(marca);
    if (search) where.nombre = { contains: search };

    const [productos, total] = await Promise.all([
      prisma.producto.findMany({
        where,
        skip,
        take: Number(limit),
        include: {
          marca: true,
          subcategoria: { include: { categoria: true } },
        },
        orderBy: { id_producto: "asc" },
      }),
      prisma.producto.count({ where }),
    ]);

    res.json({
      success: true,
      data: productos,
      pagination: {
        page: Number(page),
        limit: Number(limit),
        total,
        pages: Math.ceil(total / limit),
      },
    });
  } catch (error) {
    next(error);
  }
};

export const obtenerPorId = async (req, res, next) => {
  try {
    const producto = await prisma.producto.findUnique({
      where: { id_producto: Number(req.params.id) },
      include: {
        marca: true,
        proveedor: true,
        subcategoria: { include: { categoria: true } },
        resenas: {
          include: { cliente: true },
          orderBy: { fecha: "desc" },
          take: 10,
        },
        stocks: { include: { sucursal: true } },
      },
    });

    if (!producto) throw new ApiError(404, "Producto no encontrado");

    res.json({ success: true, data: producto });
  } catch (error) {
    next(error);
  }
};

export const obtenerResenas = async (req, res, next) => {
  try {
    const resenas = await prisma.resena.findMany({
      where: { id_producto: Number(req.params.id) },
      include: { cliente: { select: { nombre: true, apellido: true } } },
      orderBy: { fecha: "desc" },
    });
    res.json({ success: true, data: resenas });
  } catch (error) {
    next(error);
  }
};

export const obtenerStock = async (req, res, next) => {
  try {
    const stock = await prisma.stock.findMany({
      where: { id_producto: Number(req.params.id) },
      include: { sucursal: true },
    });
    res.json({ success: true, data: stock });
  } catch (error) {
    next(error);
  }
};
