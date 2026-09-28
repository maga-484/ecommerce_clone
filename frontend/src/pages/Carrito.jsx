import { Link } from "react-router-dom";
import { useCarrito } from "../context/CarritoContext.jsx";

export default function Carrito() {
  const { items, quitar, total, limpiar } = useCarrito();

  if (items.length === 0) {
    return (
      <div className="carrito-vacio">
        <h2>Tu carrito está vacío</h2>
        <Link to="/productos" className="btn-primary">
          Ver productos
        </Link>
      </div>
    );
  }

  return (
    <div className="carrito-page">
      <h2>Carrito</h2>
      <div className="carrito-lista">
        {items.map((item) => (
          <div key={item.id_producto} className="carrito-item">
            <div>
              <h4>{item.nombre}</h4>
              <span>{item.marca}</span>
            </div>
            <div>
              <span>
                {item.cantidad} x ${item.precio.toLocaleString("es-AR")}
              </span>
            </div>
            <button onClick={() => quitar(item.id_producto)}>Eliminar</button>
          </div>
        ))}
      </div>
      <div className="carrito-total">
        <h3>Total: ${total.toLocaleString("es-AR")}</h3>
        <div className="acciones">
          <button onClick={limpiar} className="btn-secondary">
            Vaciar
          </button>
          <Link to="/checkout" className="btn-primary">
            Finalizar compra
          </Link>
        </div>
      </div>
    </div>
  );
}
