import Layout from "./layout/Layout";
import { useEffect, useCallback } from "react";
import useQuiosco from "../hooks/useQuiosco";
import { formatearDinero } from "../helpers";
const Total = () => {
  const { pedido, nombre, setNombre, colocarOrden, total } = useQuiosco();
  

  const comprobarPedido = useCallback(() => {
    return pedido.length !== 0 && nombre != "" && nombre?.length > 3;
  }, [pedido, nombre]);

  useEffect(() => {
    comprobarPedido();
  }, [pedido, comprobarPedido]);
  return (
    <Layout pagina="Resumen">
      <h1 className="text-4xl font-black">Total y confirmar pedido</h1>

      <p className="text-2xl my-10">Confirma tu pedido a continuaciòn</p>

      <form onSubmit={(e) => colocarOrden(e)}>
        <div>
          <label
            htmlFor="nombre"
            className="block uppercase text-slate-800 font-bol text-xl"
          >
            Nombre
          </label>
          <input
            id="nombre"
            type="text"
            className="bg-gray-200 w-full lg:w-1/3 p-2 rounded"
            
            onChange={(e) => setNombre(e.target.value)}
          ></input>
        </div>
        <div className="mt-10">
          <p className="text-2xl">
            Total a pagar: {""}
            <span className="font-bold">{formatearDinero(total)}</span>
          </p>
        </div>
        <div className="mt-5">
          <input
            type="submit"
            className={`${
              comprobarPedido()
                ? "bg-indigo-600 hover:cursor-pointer"
                : "bg-indigo-100"
            } w-full lg:w-auto px-5 py-2 rounded uppercase font-bold text-white  text-center `}
            value="Confirmar Pedido"
            disabled={!comprobarPedido()}
          ></input>
        </div>
      </form>
    </Layout>
  );
};

export default Total;
