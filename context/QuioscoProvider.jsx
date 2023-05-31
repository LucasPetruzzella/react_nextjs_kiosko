import { useState, useEffect, createContext } from "react";
import axios from "axios";
import Toast, { toast } from "react-toastify";
import { useRouter } from "next/router";

const QuioscoContext = createContext();

const QuioscoProvider = ({ children }) => {
  const [categorias, setCategorias] = useState([]);
  const [categoriaActual, setCategoriaActual] = useState();
  const [producto, setProducto] = useState();
  const [modal, setModal] = useState(false);
  const [pedido, setPedido] = useState(getInitialState());
  const [paso, setPaso] = useState(1);
  const [loadReady, setLoadReady] = useState(false);
  const [editMode, setEditMode] = useState(false);
  const [nombre, setNombre] = useState();
  const [total, setTotal] = useState();

  const router = useRouter()

  const obtenerCategorias = async () => {
    const { data } = await axios("/api/categorias");
    setCategorias(data);
  };

  function getInitialState() {
    if (typeof window !== "undefined") {
      const pedidosLS = localStorage.getItem("pedido");
      return pedidosLS ? JSON.parse(pedidosLS) : [];
    } else {
      return null;
    }
  }

  useEffect(() => {
    setLoadReady(true);
  }, []);

  useEffect(() => {
    obtenerCategorias();
  }, []);

  useEffect(() => {
    setCategoriaActual(categorias[0]);
  }, [categorias]);

  useEffect(() => {
    localStorage.setItem("pedido", JSON.stringify(pedido));
  }, [pedido]);

  useEffect(() => {
    const nuevoTotal = pedido.reduce((total, pedido) => {
      return total + pedido.cantidad * pedido.precio;
    }, 0);

    setTotal(nuevoTotal);
  }, [pedido]);

  const handleClickCategoria = (categoria) => {
    setCategoriaActual(categoria);
  };

  const handleSetProducto = (producto) => {
    setProducto(producto);
  };

  const toggleModal = () => {
    setModal(!modal);
  };

  const agregarPedido = ({ categoriaId, ...newProducto }) => {
    const existe = pedido.some((p) => p.id === newProducto.id);

    if (existe) {
      const pedidoUpdate = pedido.map((p) =>
        p.id === newProducto.id ? newProducto : p
      );
      setPedido(pedidoUpdate);
      toast.success("Cantidad Actualizada");
    } else {
      setPedido([...pedido, newProducto]);
      toast.success("Agregado al pedido");
    }
  };

  const handleChangePaso = (newPaso) => {
    setPaso(newPaso);
  };

  const handleEliminarProducto = (id) => {
    const filtrados = pedido.filter((p) => p.id !== id);

    setPedido(filtrados);
  };

  const colocarOrden = async (e) => {
    e.preventDefault();

    try {
      const { data } = await axios.post("/api/ordenes", {
        pedido,
        nombre,
        total,
        fecha: Date.now().toString(),
      });

      if(data.id > 0){
        setPedido([])
        setPaso(1)
        setProducto({})
        setCategoriaActual(categorias[0])
        setNombre('')
        setTotal(0)
      }

      toast.success("Pedido realizado correctamente")
      setTimeout(() => {
        router.push("/")
      },1500)
      
    } catch (error) {
      console.log(error);
    }
  };

  return loadReady ? (
    <QuioscoContext.Provider
      value={{
        categorias,
        categoriaActual,
        handleClickCategoria,
        producto,
        handleSetProducto,
        modal,
        toggleModal,
        agregarPedido,
        pedido,
        paso,
        handleChangePaso,
        setEditMode,
        editMode,
        handleEliminarProducto,
        nombre,
        setNombre,
        colocarOrden,
        total,
      }}
    >
      {children}
    </QuioscoContext.Provider>
  ) : null;
};

export { QuioscoProvider };

export default QuioscoContext;
