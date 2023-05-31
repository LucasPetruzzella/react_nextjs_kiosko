import Image from "next/image"
import { formatearDinero } from "../helpers"
import useQuiosco from "../hooks/useQuiosco"

function Producto({producto}) {
    const {nombre,imagen,precio} = producto
    const {handleSetProducto, toggleModal, setEditMode} = useQuiosco()


    const handleClick = (producto) => {
        handleSetProducto(producto)
        setEditMode(false)
        toggleModal()
    }
  return (
    <div className="boder p-3">
        <Image src={`/assets/img/${imagen}.jpg`}
        alt={`Imagen platillo ${nombre}`}
        width={400}
        height={200} />

        <div className="p-5">
            <h3 className="text-2xl font-bold">{nombre}</h3>
            <p className="mt-5 font-black text-4xl text-amber-500">
                {formatearDinero(precio)}
            </p>

            <button
            type="button"
            onClick={() => handleClick(producto)}
            className="bg-indigo-600 hover_bg-indigo-800 text-white w-full mt-5 p-3 uppercase font-bold">
                Agregar
            </button>
        </div>
    </div>
  )
}

export default Producto