import { Router } from "express";
import * as ctrl from "../controllers/pedido.controller.js";

const router = Router();

router.get("/", ctrl.listar);
router.get("/:id", ctrl.obtenerPorId);
router.post("/", ctrl.crear); // crea pedido + líneas + pago
router.patch("/:id/estado", ctrl.actualizarEstado);

export default router;
