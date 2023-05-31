import Image from "next/image"
import useQuiosco from "../hooks/useQuiosco"
import { useRouter } from "next/router"

function Categoria({categoria}) {
    const { categoriaActual, handleClickCategoria} = useQuiosco()
    const {nombre,icono,id} = categoria
  const router = useRouter()

  return (
    <div className={`flex items-center gap-4 border w-full p-5 hover:bg-amber-400 ${ categoriaActual?.id === categoria.id ? 'bg-amber-400' : ''}`}>
        <Image
        width={100}
        height={100}
        src={`/assets/img/icono_${icono}.svg`}        
        alt="Imagen categoria" 
        />

        <button
            type="button"
            className="text-2xl font-bold hover:cursor-pointer"
            onClick={() => {
              router.push("/")
              handleClickCategoria(categoria)
            }}>
                {nombre}
            </button>
    </div>
  )
}

export default Categoria
