<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@page import="java.sql.*,clasesita.conectadita" %>
<!DOCTYPE html>
<html>
<head>
    <title>Alta de Alumno</title>
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
        <h1>Alta de Alumno</h1>
    </header>
    <main>
        <%
            String numeroBoleta = request.getParameter("numero_boleta");
            String nombre = request.getParameter("nombre");
            String grupo = request.getParameter("grupo");
            String especialidad = request.getParameter("especialidad");
        
            String query = "INSERT INTO alumno (numero_boleta, nombre, grupo, especialidad) VALUES (?, ?, ?, ?)";
        
            try {
                ResultSet resultadito = null;
                Connection con = null;
                PreparedStatement pstmt = null;
                conectadita conecta = new conectadita();
                con = conecta.conectar();
            
                pstmt = con.prepareStatement(query);
            
                pstmt.setString(1, numeroBoleta);
                pstmt.setString(2, nombre);
                pstmt.setString(3, grupo);
                pstmt.setString(4, especialidad);
            
                pstmt.executeUpdate();
            
                out.println("<h1>Alumno registrado exitosamente</h1>");
            } catch (Exception e) {
                out.println("<h1>Error al registrar alumno</h1>");
                e.printStackTrace();
            }
        %>
        <a href="index.html">Regreso inicio </a>
    </main>
</body>
</html>