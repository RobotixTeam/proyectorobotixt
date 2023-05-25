<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@page import="java.sql.*,clasesita.conectadita" %>
<!DOCTYPE html>
<html>
<head>
    <title>Alta de Computadora</title>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

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
        <h1>Alta de Computadora</h1>
    </header>
    <main>
        <%
            String idComputadora = request.getParameter("id_computadora");
            String tipoReporte = request.getParameter("tipo_reporte");
            String descripcion = request.getParameter("descripcion");
            String salon = request.getParameter("salon");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String modelo = request.getParameter("modelo");
            String claveAdministrador = request.getParameter("clave_administrador");
            String RFCMaestro = request.getParameter("RFC_maestro");
            String numeroBoletaAlumno = request.getParameter("numero_boleta_alumno");

            String query = "INSERT INTO computadora (id_computadora, tipo_reporte, descripcion, salon, fecha, hora, modelo, clave_administrador, RFC_maestro, numero_boleta_alumno) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
            try {
                ResultSet resultadito = null;
                Connection con = null;
                PreparedStatement pstmt = null;
                conectadita conecta = new conectadita();
                con = conecta.conectar();
            
                pstmt = con.prepareStatement(query);
            
                pstmt.setString(1, idComputadora);
                pstmt.setString(2, tipoReporte);
                pstmt.setString(3, descripcion);
                pstmt.setString(4, salon);
                pstmt.setString(5, fecha);
                pstmt.setString(6, hora);
                pstmt.setString(7, modelo);
                pstmt.setString(8, claveAdministrador);
                pstmt.setString(9, RFCMaestro);
                pstmt.setString(10, numeroBoletaAlumno);
            
                pstmt.executeUpdate();
            
                out.println("<h1>Computadora registrada exitosamente</h1>");
            } catch (Exception e) {
                out.println("<h1>Error al registrar computadora</h1>");
                e.printStackTrace();
            } 
        %>
        <a href="index.html">Regreso inicio </a>
    </main>
</body>
</html>