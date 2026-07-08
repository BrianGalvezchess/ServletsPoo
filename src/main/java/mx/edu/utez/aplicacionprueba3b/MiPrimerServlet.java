package mx.edu.utez.aplicacionprueba3b;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet(name = "MiPrimerServlet", value = "/MiPrimerServlet")
@MultipartConfig
//permite al servlet procesar el tipo input type ="file"
//vincular un url, cuando se entre, esta clase se ejecutara (tipo Http)
public class MiPrimerServlet extends HttpServlet { //EXTENDIENDO TIPO HTTPSERVLET

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //si el usuario entra por url, lo mandamos al formulario principal
        resp.sendRedirect(req.getContextPath()+"/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        Integer edad = Integer.valueOf(req.getParameter("edad"));
        String rangoFide = req.getParameter("rangoFide");
        String email = req.getParameter("email");

        //capturamos el dato del archivo (foto del perfil)
        Part filePart = req.getPart("fotoPerfil");
        String nombreArchivo = filePart.getSubmittedFileName();
        //se obtiene nada mas el nombre del archivo

        //instancia del objeto jugador asignandole los datos obtenidos
        Jugador jugador = new Jugador();
        jugador.setNombre(nombre);
        jugador.setEdad(edad);
        jugador.setRangoFide(rangoFide);
        jugador.setEmail(email);
        jugador.setFotoPerfil(nombreArchivo);

        //logica del 6 dato, calcularemos la categoria que estara jugando el jugador, segun su edad de forma interna
        if (edad < 15) {
            jugador.setCategoria("Sub-15 (Juvenil)");
        } else if(edad >= 15 && edad < 18) {
            jugador.setCategoria("Pre-Master (Cadetes)");
        } else {
            jugador.setCategoria("Master (Libre)");
        }
        //al concatenar con un espacio intermedio " ", saldra de corrido
        System.out.println("Jugador registrado: " + jugador.getNombre() + " | Categoria: " + jugador.getCategoria());

        //guardar toda la informacion a enviar y darle una clave
        //le mandamos primero la clave que le daremos a la informacion
        //y el segundo argumento son los datos, en este caso el de jugador
        req.setAttribute("jugador", jugador);

        //redireccionar a la nueva vista, volviendo a invocar  con la palabra req.getrequestspatcher
        req.getRequestDispatcher("/WEB-INF/views/mostrarInfo.jsp").forward(req, resp);


    }
}
