import useSWR from "swr";
import AdminLayout from "./layout/AdminLayout";
import axios from "axios";
import Orden from "../components/Orden";

function Admin() {
  const fetcher = () => axios("/api/ordenes").then((datos) => datos.data);
  const { data, error, isLoading } = useSWR("/api/ordenes", fetcher,{
    refreshInterval: 1000
  });

  return (
    <AdminLayout>
      <h1 className="text-4xl font-black">Panel de Administraci&oacute;n</h1>

      <p className="text-2xl my-10">Administra las órdenes</p>

      {
        data && data.length ? (
          data.map(orden => (
            <Orden key={orden.id} orden={orden}/>
          ))
        ) : <p>"Sin Ordenes"</p>
      }
    </AdminLayout>
  );
}

export default Admin;
