package com.rafael.registrar;
import com.rafael.conexao.FabricaConexao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;

@WebServlet("/login")
public class LogarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("lemail");
        String senha = req.getParameter("lsenha");
        HttpSession session = req.getSession();
        RequestDispatcher dispatcher;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = FabricaConexao.getConnection();
            if(conexao == null){
                System.out.println("nula nula");
            }
            PreparedStatement stmt = conexao.prepareStatement("select * from usuarios where senha = ? and email = ?");
            stmt.setString(1, senha);
            stmt.setString(2, email);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                session.setAttribute("status", "logado");
                dispatcher = req.getRequestDispatcher("welcome.jsp");
            }
            else{
                req.setAttribute("status", "emailSenha");
                dispatcher = req.getRequestDispatcher("index.jsp");
            }
            dispatcher.forward(req, resp);
            conexao.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
