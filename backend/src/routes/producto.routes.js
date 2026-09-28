import { Router } from "express";
import * as ctrl from "../controllers/producto.controller.js";

const router = Router();

router.get("/", ctrl.listar);
router.get("/:id", ctrl.obtenerPorId);
router.get("/:id/resenas", ctrl.obtenerResenas);
router.get("/:id/stock", ctrl.obtenerStock);

export default router;
