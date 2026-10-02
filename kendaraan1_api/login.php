<?php

include 'koneksi.php';

$data = json_decode(file_get_contents("php://input"), true);

$username = $data['username'] ?? '';
$password = $data['password'] ?? '';

if (empty($username) || empty($password)) {
    echo json_encode([
        "success" => false,
        "message" => "Username dan password wajib diisi"
    ]);
    exit;
}

$stmt = mysqli_prepare(
    $conn,
    "SELECT id, nama, username, email, password
     FROM users
     WHERE username = ?"
);

mysqli_stmt_bind_param(
    $stmt,
    "s",
    $username
);

mysqli_stmt_execute($stmt);

$result = mysqli_stmt_get_result($stmt);

$user = mysqli_fetch_assoc($result);

if ($user && password_verify($password, $user['password'])) {
    unset($user['password']);

    echo json_encode([
        "success" => true,
        "message" => "Login berhasil",
        "data" => $user
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Username atau password salah"
    ]);
}
?>