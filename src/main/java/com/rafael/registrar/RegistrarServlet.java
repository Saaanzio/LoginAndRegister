package com.rafael.registrar;

import com.rafael.conexao.FabricaConexao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/registrar")
public class RegistrarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        String csenha = req.getParameter("csenha");
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = FabricaConexao.getConnection();
            PreparedStatement ver = conexao.prepareStatement("select * from usuarios where email = ?");
            ver.setString(1, email);
            ResultSet rs = ver.executeQuery();
            if(rs.next()) {
                req.setAttribute("status", "jaExiste");
                dispatcher.forward(req, resp);
            }
            else if(!senha.equals(csenha)){
                req.setAttribute("status", "senhaDiferente");
                dispatcher.forward(req, resp);
            }
            else{
                PreparedStatement stmt = conexao.prepareStatement("INSERT INTO usuarios(senha, email) VALUES (?,?)");
                stmt.setString(1, senha);
                stmt.setString(2, email);
                int qntAfetadas = stmt.executeUpdate();
                if(qntAfetadas > 0) {
                    req.setAttribute("status", "Sucesso");

                }
                else{
                    req.setAttribute("status", "Erro");
                }
                dispatcher.forward(req, resp);
            }
            conexao.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
