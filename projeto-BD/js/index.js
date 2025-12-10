async function LoginProfessor() {
    const email = document.getElementById("usuario").value;
    const senha = document.getElementById("senha").value;
    if (email === "" || senha === "" || email == null || senha == null) {
        alert("Existem campos vazios, favor preencher !!!");
        return;
    }
    const resposta = await fetch(`http://localhost/TP-BD/projeto-BD/backend/get_professor_email.php?email=${email}`);
    const dados = await resposta.json();

    if (!dados || dados.length === 0) {
        alert("Email não encontrado !!!");
        return;
    }

    if (dados[0].senha !== senha) {
        alert("Senhas não coincidem !!!");
        return;
    }

    alert("Login realizado com sucesso.");
    setTimeout(() => {
        window.location.href = "../projeto-BD/dashboard.html";
    }, 3000);
    console.log(email,senha)
}

 
