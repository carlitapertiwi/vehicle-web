<?php

include 'koneksi.php';

$data = json_decode(file_get_contents("php://input"), true);

$nama = $data['nama'] ?? '';
$username = $data['username'] ?? '';
$email = $data['email'] ?? '';
$password = $data['password'] ?? '';

if (
    empty($nama) ||
    empty($username) ||
    empty($email) ||
    empty($password)
) {
    echo json_encode([
        "success" => false,
        "message" => "Semua data wajib diisi"
    ]);
    exit;
}

$cek = mysqli_prepare(
    $conn,
    "SELECT id FROM users WHERE username = ? OR email = ?"
);

mysqli_stmt_bind_param(
    $cek,
    "ss",
    $username,
    $email
);

mysqli_stmt_execute($cek);
mysqli_stmt_store_result($cek);

if (mysqli_stmt_num_rows($cek) > 0) {
    echo json_encode([
        "success" => false,
        "message" => "Username atau email sudah digunakan"
    ]);
    exit;
}

$passwordHash = password_hash($password, PASSWORD_DEFAULT);

$stmt = mysqli_prepare(
    $conn,
    "INSERT INTO users (nama, username, email, password)
     VALUES (?, ?, ?, ?)"
);

mysqli_stmt_bind_param(
    $stmt,
    "ssss",
    $nama,
    $username,
    $email,
    $passwordHash
);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode([
        "success" => true,
        "message" => "Registrasi berhasil"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Registrasi gagal"
    ]);
}
?>