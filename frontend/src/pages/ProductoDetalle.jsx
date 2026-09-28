import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import api from "../api/axios.js";
import { useCarrito } from "../context/CarritoContext.jsx";
import Loader from "../components/Loader.jsx";

export default function ProductoDetalle() {
  const { id } = useParams();
  const [producto, setProducto] = useState(null);
  const [loading, setLoading] = useState(true);
  const { agregar } = useCarrito();

  useEffect(() => {
    api
      .get(`/productos/${id}`)
      .then((res) => setProducto(res.data.data))
      .finally(() => setLoading(false));
  }, [id]);

  if (loading) return <Loader />;
  if (!producto) return <p>Producto no encontrado</p>;

  return (
    <div className="producto-detalle">
      <div className="detalle-img">📦</div>
      <div className="detalle-info">
        <span className="marca">{producto.marca?.nombre}</span>
        <h1>{producto.nombre}</h1>
        <p className="descripcion">{producto.descripcion}</p>
        <p className="precio-grande">
          ${Number(producto.precio).toLocaleString("es-AR")}
        </p>
        <button className="btn-primary" onClick={() => agregar(producto)}>
          Agregar al carrito
        </button>

        {producto.resenas?.length > 0 && (
          <section className="resenas">
            <h3>Reseñas</h3>
            {producto.resenas.map((r) => (
              <div key={r.id_resena} className="resena">
                <strong>
                  {r.cliente.nombre} {r.cliente.apellido}
                </strong>
                <span>{"⭐".repeat(r.puntuacion)}</span>
                <p>{r.comentario}</p>
              </div>
            ))}
          </section>
        )}
      </div>
    </div>
  );
}
