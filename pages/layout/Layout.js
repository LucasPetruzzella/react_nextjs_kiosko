import Head from "next/head";
import SlideBar from "../../components/SlideBar";
import Modal from "react-modal";
import useQuiosco from "../../hooks/useQuiosco";
import ModalProducto from "../../components/ModalProducto";
import { ToastContainer } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';
import Pasos from "../../components/Pasos";

const customStyles = {
  content: {
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)',
  },
};

// Make sure to bind modal to your appElement (https://reactcommunity.org/react-modal/accessibility/)
Modal.setAppElement('#__next');

function Layout({ children, pagina }) {
  const { modal } = useQuiosco()

  return (
    <>
      <Head>
        <title>CafeApp - {pagina} </title>
        <meta name="description" content="Quiosco Cafeteria" />
      </Head>

      <div className="md:flex" >
        <aside className="md:w-4/12 xl:w-1/4 2xl:w-1/5">
          <SlideBar />
        </aside>

        <main className="md:w-8/12 xl:w-3/4 2xl:w-4/5 h-screen overflow-y-scroll mt-5 ml-5">
          <Pasos />
          {children}
        </main>
      </div>

      {modal && (
        <Modal
          isOpen={modal}
          style={customStyles}>
          <h1>
            <ModalProducto />
          </h1>
        </Modal>
      )}

      <ToastContainer />
    </>
  );
}

export default Layout;
