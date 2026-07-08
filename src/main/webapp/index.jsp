    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <c:set var="contextPath"
           value="${pageContext.request.contextPath}"/>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Torneo De Ajedrez</title>
        <style>
            body {
                background-color: #1a1a1a;
                color: #ffffff;
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                background-image: radial-gradient(rgba(255,255,255,0.03) 1px, transparent 0);
                background-size: 20px 20px;
            }
            .form-container {
                background-color: #262626;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 8px 24px rgba(0,0,0,0.6);
                border-top: 5px solid #d4af37;
                width: 100%;
                max-width: 450px;
                box-sizing: border-box;
            }

            h2 {
                text-align: center;
                color: #d4af37;
                margin-bottom: 25px;
                text-transform: uppercase;
                letter-spacing: 1px;
                font-size: 20px;
            }
            .form-group {
                margin-bottom: 18px;
            }
            label {
                display: block;
                margin-bottom: 6px;
                color: #b3b3b3;
                font-size: 15px;
            }
            input[type="text"], input[type="number"], input[type="email"] {
                display: block; /* Obliga al input a comportarse como un bloque */
                width: 100%;    /* Ocupa todo el ancho disponible del contenedor */
                padding: 12px;
                box-sizing: border-box;
                background-color: #333;
                border: 1px solid #444;
                color: #fff;
                border-radius: 4px;
                transition: border-color 0.3s;
                font-size: 15px;
            }
            input:focus {
                border-color: #d4af37;
                outline: none;;
            }
            input[type="file"] {
                color: #b3b3b3;
                margin-top: 5px;
                font-size: 13px;
            }
            .btn-submit {
                width: 100%;
                padding: 12px;
                background-color: #d4af37;
                color: #1a1a1a;
                border: none;
                font-weight: bold;
                font-size: 16px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin-top: 10px;
                text-transform: uppercase;
            }
            .btn-submit:hover {
                background-color: #f3cd44;
            }
            .error-msg {
                color: #ff6b6b;
                font-size: 12px;
                margin-top: 5px;
                display: none;
            }
        </style>
    </head>
    <body>
    <div class="form-container">
        <h2>Registro de Jugador al Evento Internacional (Gens A Sumus)</h2>
        <form id="chessForm" action="${contextPath}/MiPrimerServlet" method="post" enctype="multipart/form-data">

            <div class="form-group">
            <label for="nombre">Nombre Completo:</label>
            <input type="text" id="nombre" name="nombre" placeholder="Ingresa tu nombre completo">
                <div class="error-msg" id="error-nombre">Por favor, debes ingresar tu nombre completo, plis</div>
            </div>

            <div class="form-group">
            <label for="Edad">Edad:</label>
            <input type="number" id="edad" name="edad" placeholder="Ingresa tu edad">
                <div class="error-msg" id="error-edad">Por favor, debes ingresar una edad válida, plis</div>
            </div>

            <div class="form-group">
            <label for="rangoFide">rango / ELO FIDE (Poner 0 sea el caso de no tener elo)</label>
            <input type="text" id="rangoFide" name="rangoFide" value="0">
            </div>

            <div class="form-group">
            <label for="email">Correo Electrónico :</label>
            <input type="email" id="email" name="email" placeholder="Ingresa tu correo electrónico">
                <div class="error-msg" id="error-email">Escribe una direccion de correo válida</div>
            </div>

            <div class="form-group">
                <label for="fotoPerfil">Foto de Perfil:</label>
                <input type="file" id="fotoPerfil" name="fotoPerfil" accept="image/*">
                <div class="error-msg" id="error-foto">Es obligatorio subir una foto.</div>
            </div>
            <button type="submit" value="Enviar">Registrarse</button>
        </form>
    </div>

    <script>
        document.getElementById("chessForm").addEventListener("submit", function (e) {
            let isCorrect = true;

            document.querySelectorAll(".error-msg").forEach(msg => msg.style.display = "none");

            const nombreVal = document.getElementById("nombre").value.trim();
            if (nombreVal === "") {
                document.getElementById("error-nombre").style.display = "block";
                isCorrect = false;
            }

            const edadVal = parseInt(document.getElementById("edad").value);
            if (isNaN(edadVal) || edadVal < 5 || edadVal > 99) {
                document.getElementById("error-edad").style.display = "block";
                isCorrect = false;
            }
            const emailVal = document.getElementById("email").value.trim();
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(emailVal)) {
                document.getElementById("error-email").style.display = "block";
                isCorrect = false;
            }

            const fotoInput = document.getElementById("fotoPerfil");
            if (fotoInput.files.length === 0) {
                document.getElementById("error-foto").style.display = "block";
                isCorrect = false;
            }

            if(!isCorrect) {
                e.preventDefault();
            }
        });
    </script>
    </body>
    </html>