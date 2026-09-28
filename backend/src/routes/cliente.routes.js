import { Router } from "express";
import * as ctrl from "../controllers/cliente.controller.js";

const router = Router();

router.get("/", ctrl.listar);
router.get("/:id", ctrl.obtenerPorId);
router.get("/:id/pedidos", ctrl.obtenerPedidos);

export default router;
