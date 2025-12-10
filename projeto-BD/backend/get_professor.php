<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

include("conexao.php");

// Consulta
$sql = "SELECT * FROM professor"; // coloque o nome da sua tabela aqui
$result = $conn->query($sql);

// Array para armazenar os resultados
$dados = array();

// Preenche o array com os registros
while ($row = $result->fetch_assoc()) {
    $dados[] = $row;
}

// Define que a resposta será JSON
header('Content-Type: application/json');

// Converte o array em JSON
echo json_encode($dados, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
?>
