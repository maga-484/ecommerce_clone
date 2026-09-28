import { Link } from "react-router-dom";

export default function Home() {
  return (
    <div className="home">
      <section className="hero">
        <h1>Bienvenido a Ecommerce</h1>
        <p>Los mejores productos de tecnología y electrodomésticos</p>
        <Link to="/productos" className="btn-primary">
          Ver productos
        </Link>
      </section>
    </div>
  );
}
