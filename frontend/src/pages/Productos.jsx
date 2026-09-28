import { useEffect, useState } from "react";
import api from "../api/axios.js";
import ProductoCard from "../components/ProductoCard.jsx";
import Loader from "../components/Loader.jsx";

export default function Productos() {
  const [productos, setProductos] = useState([]);
  const [categorias, setCategorias] = useState([]);
  const [categoriaActiva, setCategoriaActiva] = useState("");
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    api.get("/categorias").then((res) => setCategorias(res.data.data));
  }, []);

  useEffect(() => {
    setLoading(true);
    const params = categoriaActiva
      ? { categoria: categoriaActiva, limit: 50 }
      : { limit: 50 };
    api
      .get("/productos", { params })
      .then((res) => setProductos(res.data.data))
      .finally(() => setLoading(false));
  }, [categoriaActiva]);

  return (
    <div className="productos-page">
      <h2>Productos</h2>
      <div className="filtros">
        <button
          className={!categoriaActiva ? "activo" : ""}
          onClick={() => setCategoriaActiva("")}
        >
          Todas
        </button>
        {categorias.map((c) => (
          <button
            key={c.id_categoria}
            className={
              categoriaActiva === String(c.id_categoria) ? "activo" : ""
            }
            onClick={() => setCategoriaActiva(String(c.id_categoria))}
          >
            {c.nombre}
          </button>
        ))}
      </div>
      {loading ? (
        <Loader />
      ) : (
        <div className="productos-grid">
          {productos.map((p) => (
            <ProductoCard key={p.id_producto} producto={p} />
          ))}
        </div>
      )}
    </div>
  );
}
