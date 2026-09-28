import { Link } from "react-router-dom";
import { useCarrito } from "../context/CarritoContext.jsx";

export default function Navbar() {
  const { cantidadTotal } = useCarrito();

  return (
    <nav className="navbar">
      <div className="container navbar-content">
        <Link to="/" className="logo">
          E-Shop
        </Link>
        <div className="nav-links">
          <Link to="/productos">Productos</Link>
          <Link to="/mis-pedidos">Mis Pedidos</Link>
          <Link to="/carrito" className="carrito-btn">
            🛒 Carrito{" "}
            {cantidadTotal > 0 && (
              <span className="badge">{cantidadTotal}</span>
            )}
          </Link>
        </div>
      </div>
    </nav>
  );
}
