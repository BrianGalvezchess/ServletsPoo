<%--
  Created by IntelliJ IDEA.
  User: BrianGalvez
  Date: 06/07/2026
  Time: 08:43 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ficha de registro para competencia internacional</title>
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Courier New', Courier, monospace;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .card {
            background-color: #1e1e1e;
            border: 3px double #d4af37;
            border-radius: 12px;
            width: 360px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.8);
            text-align: center;
            position: relative;
        }
        .card-header {
            border-bottom: 2px dashed #444;
            padding-bottom: 12px;
            margin-bottom: 20px;
        }
        .card-header h1 {
            font-size: 22px;
            color: #d4af37;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .card-header small {
            color: #888;
            letter-spacing: 2px;
        }
        .avatar-box {
            width: 110px;
            height: 110px;
            margin: 0 auto 20px auto;
            border: 2px dashed #d4af37;
            background-color: #2a2a2a;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            color: #aaa;
            padding: 8px;
            box-sizing: border-box;
            overflow: hidden;
        }
        .avatar-box span {
            font-weight: bold;
            color: #fff;
            margin-top: 4px;
            font-size: 10px;
        }
        .info-row {
            text-align: left;
            margin-bottom: 12px;
            font-size: 14px;
            line-height: 1.4;
        }
        .label {
            color: #d4af37;
            font-weight: bold;
        }
        .badge-category {
            background-color: #d4af37;
            color: #121212;
            padding: 6px 12px;
            font-weight: bold;
            display: inline-block;
            margin-top: 20px;
            border-radius: 4px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <h1>Registro al Internacional de Ajedrez</h1>
        <small>REGISTRO OFICIAL</small>
    </div>

    <div class="avatar-box">
        Archivo :
        <br>
        <span>${jugador.fotoPerfil}</span>
    </div>

    <div class="info-row">
        <span class="label">> Jugador:</span> ${jugador.nombre}
    </div>
    <div class="info-row">
        <span class="label">> Edad:</span> ${jugador.edad} años
    </div>
    <div class="info-row">
        <span class="label">> Rango FIDE:</span> ${jugador.rangoFide}
    </div>
    <div class="info-row">
        <span class="label">> Contacto:</span> ${jugador.email}
    </div>

    <div class="badge-category">
        ${jugador.categoria}
    </div>
</div>
</body>
</html>
