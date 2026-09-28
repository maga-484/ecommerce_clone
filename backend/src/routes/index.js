import { Router } from "express";
import productoRoutes from "./producto.routes.js";
import categoriaRoutes from "./categoria.routes.js";
import clienteRoutes from "./cliente.routes.js";
import pedidoRoutes from "./pedido.routes.js";
import pagoRoutes from "./pago.routes.js";
import resenaRoutes from "./resena.routes.js";

const router = Router();

router.use("/productos", productoRoutes);
router.use("/categorias", categoriaRoutes);
router.use("/clientes", clienteRoutes);
router.use("/pedidos", pedidoRoutes);
router.use("/pagos", pagoRoutes);
router.use("/resenas", resenaRoutes);

export default router;
