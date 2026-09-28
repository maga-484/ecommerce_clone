import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import api from "../api/axios.js";
import Loader from "../components/Loader.jsx";

export default function MisPedidos() {
  const [pedidos, setPedidos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [params] = useSearchParams();
  const nuevo = params.get("nuevo");

  const ESTADOS = {
    Pendiente: "Pendiente",
    "En tránsito": "En tránsito",
    "En tr??nsito": "En tránsito", // por si viene mal de la BD
    Entregado: "Entregado",
  };

  useEffect(() => {
    // Demo: hardcodeamos cliente 1
    api
      .get("/clientes/1/pedidos")
      .then((res) => setPedidos(res.data.data))
      .finally(() => setLoading(false));
  }, []);

  if (loading) return <Loader />;

  return (
    <div className="mis-pedidos">
      <h2>Mis Pedidos</h2>
      {nuevo && <p className="success">✅ Pedido #{nuevo} creado con éxito</p>}
      {pedidos.length === 0 ? (
        <p>No tenés pedidos aún.</p>
      ) : (
        pedidos.map((p) => (
          <div key={p.id_pedido} className="pedido-card">
            <header>
              <strong>Pedido #{p.id_pedido}</strong>
              <span>{new Date(p.fecha).toLocaleDateString("es-AR")}</span>
              <span className={`estado ${p.estado.toLowerCase()}`}>
                {ESTADOS[p.estado] || p.estado}
              </span>
            </header>
            <ul>
              {p.lineas.map((l) => (
                <li key={l.id_linea}>
                  {l.cantidad} x {l.producto.nombre} — $
                  {Number(l.precio_unitario).toLocaleString("es-AR")}
                </li>
              ))}
            </ul>
            <footer>
              <strong>Total: ${Number(p.total).toLocaleString("es-AR")}</strong>
            </footer>
          </div>
        ))
      )}
    </div>
  );
}
