<%-- 
    Document   : modification.jsp
    Created on : 9 nov. 2023, 13:23:24
    Author     : adral
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="app.pk.ConnectionToBD"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          if(request.getAttribute("message")!=null){
        %>
        <h2><%= request.getAttribute("message") %></h2>
        
        <% } %>
        <h1>Voici la liste des joueurs: </h1>
        <% 
            Connection connexion= ConnectionToBD.seConnecter();
            String selectAll="select * from joueur where idj=?";
            int id= Integer.parseInt(request.getParameter("id"));
            PreparedStatement ps=connexion.prepareStatement(selectAll);
            ps.setInt(1,id);
            ResultSet rs= ps.executeQuery();
        %>
                <% if(rs.next()){
                %> 
                    <form action="/JEEFirstAPP/ModifJoueur" method="post">
                        id: <input type="text" placeholder="entrez l'ID du joueur!" name="idJoueur" value="<%= rs.getInt(1) %>" readonly><br>
                        nom: <input type="text" name="nomJoueur" value="<%= rs.getString(2) %>" placeholder=""><br>
                        prenom: <input type="text" name="prenomJoueur"value="<%= rs.getString(3) %>" placeholder=""> <br>
                        age: <input type="number" name="ageJoueur" placeholder=""value="<%= rs.getInt(4) %>"><br>
                        <input type="submit" value="Modifier">
                    </form>
                <% 
                 }else{
                    %>
                    <<b>Joueur Introuvable.</b>
                    <%
                }
                 rs.close();
                 connexion.close();
                %>
        
    </body>
</html>
