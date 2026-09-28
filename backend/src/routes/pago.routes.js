import { Router } from "express";
import * as ctrl from "../controllers/pago.controller.js";

const router = Router();

router.get("/", ctrl.listar);
router.get("/:id", ctrl.obtenerPorId);

export default router;
