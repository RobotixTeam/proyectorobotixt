<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@page import="java.sql.*,clasesita.conectadita" %>
<!DOCTYPE html>
<html>
<head>
    <title>Alta de Administrador</title>
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
        <h1>Alta de Administrador</h1>
    </header>
    <main>
        <%
            String clave = request.getParameter("clave");
            String contraseña = request.getParameter("contraseña");
            String nombre = request.getParameter("nombre");
            String puestoEscuela = request.getParameter("puesto_escuela");
        
            String query = "INSERT INTO administrador (clave, contraseña, nombre, puesto_escuela) VALUES (?, ?, ?, ?)";
        
            try {
                ResultSet resultadito = null;
                Connection con = null;
                PreparedStatement pstmt = null;
                conectadita conecta = new conectadita();
                con = conecta.conectar();
            
                pstmt = con.prepareStatement(query);
            
                pstmt.setString(1, clave);
                pstmt.setString(2, contraseña);
                pstmt.setString(3, nombre);
                pstmt.setString(4, puestoEscuela);
            
                pstmt.executeUpdate();
            
                out.println("<h1>Administrador registrado exitosamente</h1>");
            } catch (Exception e) {
                out.println("<h1>Error al registrar administrador</h1>");
                 out.print(e.toString());
            }
        %>
        <a href="index.html">Regreso inicio </a>
    </main>
</body>
</html>