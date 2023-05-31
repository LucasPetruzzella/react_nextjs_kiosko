import Image from "next/image";
import { formatearDinero } from "../helpers";
import useQuiosco from "../hooks/useQuiosco";

const ResumenProducto = ({ producto }) => {
    const { imagen, nombre, cantidad, precio } = producto
    const { handleSetProducto, toggleModal, setEditMode, handleEliminarProducto} = useQuiosco()

    
  return (
    <div className="shadow p-5 mb-3 flex gap-10 items-center">
      <div className="md:w-1/6">
        <Image
          src={`/assets/img/${imagen}.jpg`}
          alt={`Imagen platillo ${nombre}`}
          width={300}
          height={400}
        />
      </div>
      <div className="md:w-4/6">
        <p className="text-3xl font-bold">{nombre}</p>
        <p className="text-xl text-amber-500 mt-2 font-bold">Cantidad: {cantidad}</p>
        <p className="text-xl mt-2 text-amber-500 font-bold">Precio: {formatearDinero(precio)}</p>
        <p className="text-sm text-gray-700 mt-2 font-bold">Subtotal: {formatearDinero(precio * cantidad)}</p>
        </div>

        <div className="md:w-1/6">
            <button
                type="button"
                className="bg-sky-700 flex gap-2 px-5 py-2 text-white rounded-md font-bold uppercase shadow-md w-full text-center"
                onClick={() => {
                    handleSetProducto(producto)
                    setEditMode(true)
                    toggleModal()
                }}>
                    Editar
                </button>

                <button
                type="button"
                className="bg-red-700 flex gap-2 px-5  py-2 text-white rounded-md font-bold uppercase shadow-md w-full text-center mt-3"
                onClick={() => {
                    handleEliminarProducto(producto.id)
                }}>
                    Eliminar
                </button>
        </div>

    </div>
     
  );
};

export default ResumenProducto;
