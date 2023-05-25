<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="java.sql.*,clasesita.conectadita" %>
<!DOCTYPE html>
<html>
<head>
    <title>Alta de Maestro</title>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        
        main {
            margin: 20px;
            text-align: center;
        }
        
        h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Alta de Maestro</h1>
    </header>
    <main>
        <% 
            String RFC = request.getParameter("RFC");
            String nombre = request.getParameter("nombre");
            String materiaImpartida = request.getParameter("materia_impartida");
            String correoElectronico = request.getParameter("correo_electronico");
        
            String query = "INSERT INTO maestro (RFC, nombre, materia_impartida, correo_electronico) VALUES (?, ?, ?, ?)";
        
            try {
                ResultSet resultadito = null;
                Connection con = null;
                PreparedStatement pstmt = null;
                conectadita conecta = new conectadita();
                con = conecta.conectar();
            
                // Crear el PreparedStatement
                pstmt = con.prepareStatement(query);
            
                // Establecer los parámetros del PreparedStatement
                pstmt.setString(1, RFC);
                pstmt.setString(2, nombre);
                pstmt.setString(3, materiaImpartida);
                pstmt.setString(4, correoElectronico);
            
                // Ejecutar la consulta
                pstmt.executeUpdate();
            
                out.println("<h1>Maestro registrado exitosamente</h1>");
            } catch (Exception e) {
                out.println("<h1>Error al registrar maestro</h1>");
                e.printStackTrace();
            } 
        %>
        <a href="index.html">Regreso inicio </a>
    </main>
</body>
</html>