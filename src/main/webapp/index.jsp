<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>GamersOn</title>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="wrapper">
    <div class="title-text">
        <div class="title login">
            Entrar no Site
        </div>
        <div class="title signup">
            Criar conta
        </div>
    </div>
    <div class="form-container">
        <div class="slide-controls">
            <input type="radio" name="slide" id="login" checked>
            <input type="radio" name="slide" id="signup">
            <label for="login" class="slide login">Entrar</label>
            <label for="signup" class="slide signup">Registrar</label>
            <div class="slider-tab"></div>
        </div>
        <div class="form-inner">
            <form action="login" class="login" method="post">
                <div class="field">
                    <input type="email" name="lemail" placeholder="Endereço de Email" id="emailLogin" oninvalid="this.setCustomValidity('Por favor, insira um email válido')" required>
                </div>
                <div class="field">
                    <input type="password" name="lsenha" placeholder="Senha" required id="senhaLogin" minlength="2">
                </div>
                <div class="pass-link">
                    <a href="#"></a>
                </div>
                <div class="field btn">
                    <div class="btn-layer"></div>
                    <input type="submit" value="Login" onclick="entrarSite()">
                </div>
                <div class="signup-link">
                    Não é um membro? <a href="">Registrar</a>
                </div>
            </form>
            <form action="registrar" class="signup" method="post">
                <div class="field">
                    <input type="email" name="email" placeholder="Endereço de Email" id="email" oninvalid="this.setCustomValidity('Por favor, insira um email válido')"  required>
                </div>
                <div class="field">
                    <input type="password" name="senha" placeholder="Senha" id="senha" minlength="2" required>
                </div>
                <div class="field">
                    <input type="password" name="csenha" placeholder="Confirmar Senha" id="confirmarSenha" minlength="2" required>
                </div>
                <div class="field btn">
                    <div class="btn-layer"></div>
                    <input type="submit" value="Registrar" onclick="salvarDados()">
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    const loginText = document.querySelector(".title-text .login");
    const loginForm = document.querySelector("form.login");
    const loginBtn = document.querySelector("label.login");
    const signupBtn = document.querySelector("label.signup");
    const signupLink = document.querySelector("form .signup-link a");
    signupBtn.onclick = (() => {
        loginForm.style.marginLeft = "-50%";
        loginText.style.marginLeft = "-50%";
    });
    loginBtn.onclick = (() => {
        loginForm.style.marginLeft = "0%";
        loginText.style.marginLeft = "0%";
    });
    signupLink.onclick = (() => {
        signupBtn.click();
        return false;
    });

    var status = document.getElementById("status").value;
    if(status === "Sucesso"){
        Swal.fire({
            icon: 'success',
            title: 'Sucesso!',
            text: 'Registro efetuado com sucesso!',
            confirmButtonText: 'OK',
        });
    }
    else if(status === "senhaDiferente") {
        Swal.fire({
            icon: 'error',
            title: 'Erro',
            text: 'Senhas Diferentes!',
            confirmButtonText: 'Tentar novamente',

        });
    }else if (status === "Erro"){
        Swal.fire({
            icon: 'error',
            title: 'Erro',
            text: 'Erro!',
            confirmButtonText: 'Tentar novamente',

        });
    }else if (status === "emailSenha"){
        Swal.fire({
            icon: 'error',
            title: 'Erro',
            text: 'Email ou Senha Incorretos',
            confirmButtonText: 'Tentar novamente',

        });
    }
    else if (status === "jaExiste"){
        Swal.fire({
            icon: 'error',
            title: 'Erro',
            text: 'Email já possui conta',
            confirmButtonText: 'Tentar novamente',

        });
    }
</script>

</body>

</html>