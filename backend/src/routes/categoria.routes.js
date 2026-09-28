import { Router } from "express";
import * as ctrl from "../controllers/categoria.controller.js";

const router = Router();

router.get("/", ctrl.listar);
router.get("/:id/subcategorias", ctrl.obtenerSubcategorias);

export default router;
