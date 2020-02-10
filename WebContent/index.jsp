<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<h1>Hello World!</h1>
	<%
		try {
			Context initCtx = new InitialContext();
			//DataSource dataSource = (DataSource) initCtx.lookup("java:/cine"); --> Para WildFly
			//DataSource dataSource = (DataSource) initCtx.lookup("java:comp/env/jdbc/cine"); --> Para Tomcat
			DataSource dataSource = (DataSource) initCtx.lookup("java:comp/env/jdbc/cine");
			//;
			Connection conexion = dataSource.getConnection();
			Statement stmt = conexion.createStatement(); //Objeto Statement para consultas.
			ResultSet rs = stmt.executeQuery("select * from ENTRADAS");
			out.println("<br>Conexion correcta");
			while (rs.next()) {
				out.println("<br>-o Comprador: " + rs.getString("comprador"));
				;
			}
			rs.close();
			stmt.close();
			conexion.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>