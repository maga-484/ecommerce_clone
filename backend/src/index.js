import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import routes from "./routes/index.js";
import { errorHandler } from "./middlewares/errorHandler.js";
import { notFound } from "./middlewares/notFound.js";

dotenv.config();

console.log(
  "DATABASE_URL:",
  process.env.DATABASE_URL ? "✅ definida" : "❌ undefined",
);
console.log("PORT:", process.env.PORT);
console.log("FRONTEND_URL:", process.env.FRONTEND_URL);

const app = express();
const PORT = process.env.PORT || 3002;

// Middlewares globales
app.use(cors({ origin: process.env.FRONTEND_URL || "*" }));
app.use(express.json());

// Health check
app.get("/api/health", (req, res) => {
  res.json({
    status: "ok",
    service: "ecommerce-backend",
    timestamp: new Date(),
  });
});

// Rutas de la API
app.use("/api", routes);

// Manejo de errores (SIEMPRE al final)
app.use(notFound);
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`🚀 Backend corriendo en http://localhost:${PORT}`);
});
