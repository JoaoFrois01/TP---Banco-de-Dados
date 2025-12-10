<?php
$host = "localhost";       // endereço do servidor MySQL
$usuario = "root";         // usuário padrão do XAMPP
$senha = "";               // senha do root (vazia no XAMPP)
$banco = "TP_BD";    // nome do seu database
$porta = 3306;             // porta padrão do MySQL

$conn = new mysqli($host, $usuario, $senha, $banco, $porta);

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}
?>
