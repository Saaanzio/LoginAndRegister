Como executar o código:
1 - Criar o banco de dados se não existir (MySQL Workbench):
CREATE DATABASE usuarios;
CREATE TABLE usuarios(id INT PRIMARY KEY AUTO_INCREMENT, senha VARCHAR(50), email VARCHAR(50))
2 - Colocar o usuario e senha do seu MySQL em um arquivo conexao.properties na pasta src/main/resources (seguir conexao_exemplo.properties presente na mesma pasta)
3 - Executar!
