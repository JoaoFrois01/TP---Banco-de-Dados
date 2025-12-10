<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");

include("conexao.php");
header("Content-Type: application/json");

// Permitir OPTIONS (pré-flight)
if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") {
    exit;
}

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(["erro" => "Use POST"]);
    exit;
}

// Ler JSON enviado
$input = json_decode(file_get_contents("php://input"), true);

$nome  = $input["nome"]  ?? "";
$email = $input["email"] ?? "";
$senha = $input["senha"] ?? "";

if (!$nome || !$email || !$senha) {
    echo json_encode(["erro" => "Campos obrigatórios faltando"]);
    exit;
}
