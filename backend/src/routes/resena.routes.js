import { Router } from "express";
import * as ctrl from "../controllers/resena.controller.js";

const router = Router();

router.get("/", ctrl.listar);
router.post("/", ctrl.crear);

export default router;
