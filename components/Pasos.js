import { useRouter } from "next/router";
import useQuiosco from "../hooks/useQuiosco";

const pasos = [
  { paso: 1, nombre: "Menu", url: "/", avance: 10 },
  { paso: 2, nombre: "Resumen", url: "/resumen", avance: 50 },
  { paso: 3, nombre: "Total", url: "/total", avance: 100 },
];

const Pasos = () => {
  const router = useRouter();
  const { paso, handleChangePaso } = useQuiosco();

    const calcularProgreso = () => {
        const path = router.pathname
        const pasoActual = pasos.find(p => p.url == path)
        
        return pasoActual.avance
    }

  return (
    <>
      <div className="flex justify-between mb-5">
        {pasos.map((paso) => (
          <button
          type="button"
            className="text-2xl font-bold"
            onClick={() => {
              handleChangePaso(paso.paso);
              router.push(paso.url);
            }}
            key={paso.paso}
          >
            {paso.nombre}
          </button>
        ))}
      </div>
      <div className="bg-gray-100 mb-10">
        <div className="rounded-full bg-amber-500 text-xs leading-none h-2 text-center text-white"
        style={{ width: `${calcularProgreso()}%`}}
        >

        </div>
      </div>
    </>
  );
};

export default Pasos;
