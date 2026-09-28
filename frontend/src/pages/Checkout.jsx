import { useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api/axios.js";
import { useCarrito } from "../context/CarritoContext.jsx";

export default function Checkout() {
  const { items, total, limpiar } = useCarrito();
  const navigate = useNavigate();
  const [idCliente, setIdCliente] = useState("1");
  const [metodoPago, setMetodoPago] = useState("Tarjeta de Crédito");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    try {
      const payload = {
        id_cliente: Number(idCliente),
        metodo_pago: metodoPago,
        items: items.map((i) => ({
          id_producto: i.id_producto,
          cantidad: i.cantidad,
        })),
      };
      const res = await api.post("/pedidos", payload);
      limpiar();
      navigate(`/mis-pedidos?nuevo=${res.data.data.pedido.id_pedido}`);
    } catch (err) {
      setError(err.response?.data?.error || "Error al procesar el pedido");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="checkout">
      <h2>Finalizar compra</h2>
      <form onSubmit={handleSubmit}>
        <label>
          ID Cliente (demo):
          <input
            type="number"
            value={idCliente}
            onChange={(e) => setIdCliente(e.target.value)}
          />
        </label>
        <label>
          Método de pago:
          <select
            value={metodoPago}
            onChange={(e) => setMetodoPago(e.target.value)}
          >
            <option>Tarjeta de Crédito</option>
            <option>Tarjeta de Débito</option>
            <option>Transferencia</option>
            <option>Efectivo</option>
          </select>
        </label>
        <h3>Total: ${total.toLocaleString("es-AR")}</h3>
        {error && <p className="error">{error}</p>}
        <button type="submit" disabled={loading} className="btn-primary">
          {loading ? "Procesando..." : "Confirmar pedido"}
        </button>
      </form>
    </div>
  );
}
