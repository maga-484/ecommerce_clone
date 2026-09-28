export const errorHandler = (err, req, res, next) => {
  const status = err.statusCode || 500;
  const message = err.message || "Error interno del servidor";

  console.error(`[ERROR] ${status} - ${message}`);

  res.status(status).json({
    success: false,
    error: message,
  });
};
