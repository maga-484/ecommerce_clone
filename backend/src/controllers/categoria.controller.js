import prisma from "../config/db.js";

export const listar = async (req, res, next) => {
  try {
    const categorias = await prisma.categoria.findMany({
      include: { _count: { select: { subcategorias: true } } },
      orderBy: { nombre: "asc" },
    });
    res.json({ success: true, data: categorias });
  } catch (error) {
    next(error);
  }
};

export const obtenerSubcategorias = async (req, res, next) => {
  try {
    const subcategorias = await prisma.subcategoria.findMany({
      where: { id_categoria: Number(req.params.id) },
      include: { _count: { select: { productos: true } } },
      orderBy: { nombre: "asc" },
    });
    res.json({ success: true, data: subcategorias });
  } catch (error) {
    next(error);
  }
};
