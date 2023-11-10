<%-- 
    Document   : CollectionOfPlayers
    Created on : 5 nov. 2023, 21:12:13
    Author     : adral
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.pk.ConnectionToBD"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des joueurs</title>
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
            String selectAll="select * from joueur";
            PreparedStatement ps=connexion.prepareStatement(selectAll);
            ResultSet rs= ps.executeQuery();
        %>
        <table>
            <thead>
                <tr>
                    <th>IDJoueur</th>
                    <th>NomJoueur</th>
                    <th>PrenomJoueur</th>
                    <th>Age</th>
                    <th>Suppression</th>
                    <th>Modification</th>
                </tr>
            </thead>
            <tbody>
                <% while(rs.next()){
                
                %>
                <tr>
                    <td><%= rs.getInt(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getInt(4) %></td>
                    <td><a href="/JEEFirstAPP/SupprimerJoueur?id=<%=rs.getInt(1)%>">Supprimer</a></td>
                    <td><a href="/JEEFirstAPP/jsp/modification.jsp?id=<%=rs.getInt(1)%>">modifier</a></td>
                </tr>
                <% 
                 }
                 rs.close();
                 connexion.close();
                %>
            </tbody>
        </table>
            <a href="/JEEFirstAPP/HTML/nouveauJoueur.html">créer un nouveau joueur</a>
    </body>
</html>
