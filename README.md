# Página de Registro e Login com Banco de Dados

Técnologias utilizadas neste projeto: MySQL, Java, JSP, JDBC, Tomcat, Servlet, HTML, CSS, Javascript e SweetAlert2.

## Instruções para Configuração e Execução

 1 - Criar o banco de dados se não existir (MySQL Workbench):

```sql
CREATE DATABASE IF NOT EXISTS usuarios;
USE usuarios;
CREATE TABLE usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
senha VARCHAR(50),
email VARCHAR(50))
```

2 - Colocar o usuario e senha do seu MySQL em um arquivo conexao.properties na pasta src/main/resources (seguir conexao_exemplo.properties presente na mesma pasta)

3 - Instalar o plugin Tomcat (Aparecerá uma notificação porcausa do maven)

4 - Executar!

![image](https://github.com/user-attachments/assets/2381e81b-a2a5-4d83-986e-6449aa33b4d5)
![image](https://github.com/user-attachments/assets/878b5393-4a2c-4573-87ce-0b150f3eac81)
![image](https://github.com/user-attachments/assets/6d9bcade-8ba5-4acc-acef-ab4d43d59a61)

