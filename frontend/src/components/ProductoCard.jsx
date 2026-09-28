import { Link } from "react-router-dom";
import { useCarrito } from "../context/CarritoContext.jsx";

export default function ProductoCard({ producto }) {
  const { agregar } = useCarrito();

  const handleAgregar = (e) => {
    e.preventDefault();
    agregar(producto);
  };

  return (
    <Link to={`/productos/${producto.id_producto}`} className="producto-card">
      <div className="producto-img">📦</div>
      <div className="producto-info">
        <span className="marca">{producto.marca?.nombre}</span>
        <h3>{producto.nombre}</h3>
        <p className="precio">
          ${Number(producto.precio).toLocaleString("es-AR")}
        </p>
        <button onClick={handleAgregar} className="btn-agregar">
          Agregar al carrito
        </button>
      </div>
    </Link>
  );
}
