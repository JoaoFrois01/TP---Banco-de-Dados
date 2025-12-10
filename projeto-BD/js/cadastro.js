async function CadastrarProfessor() {

    const nome = document.getElementById("nome").value;
    const email = document.getElementById("email").value;
    const senha = document.getElementById("senha").value;
    const confirmaSenha = document.getElementById("confirmaSenha").value;

    if (!nome || !email || !senha || !confirmaSenha) {
        alert("Campos não preenchidos corretamente");
        return;
    }

    if (senha !== confirmaSenha) {
        alert("Senhas não coincidem");
        return;
    }

    const resposta = await fetch(
        "http://localhost/TP-BD/projeto-BD/backend/post_professor.php",
        {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                nome: nome,
                email: email,
                departamento: departamento,
                senha: senha
            })
        }
    );

    const dados = await resposta.json();
    document.getElementById(nome) = " "
    document.getElementById(email) = " "
    document.getElementById(senha) = " "
}

async function BuscarProfessores() {

    const resposta = await fetch("http://localhost/TP-BD/projeto-BD/backend/get_professor.php");

    if (!resposta.ok) {
        console.error("Erro HTTP:", resposta.status);
        alert("Erro ao buscar professores");
        return;
    }

    const dados = await resposta.json();

    // Verifica se veio lista
    if (!Array.isArray(dados) || dados.length === 0) {
        document.getElementById('cadastroSistemas').innerHTML = "Nenhum professor encontrado.";
        return;
    }

    let str = "";

    for (let i = 0; i < dados.length; i++) {
        str += `
            <div>
                <b>Nome:</b> ${dados[i].nome}<br>
                <b>Email:</b> ${dados[i].email}<br><br>
            </div>
        `;
    }

    document.getElementById('cadastroSistemas').innerHTML = str;
}

BuscarProfessores();