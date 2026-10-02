<?php

include 'koneksi.php';

$data = json_decode(file_get_contents("php://input"), true);

$id = $data['id'] ?? '';

if (empty($id)) {
    echo json_encode([
        "success" => false,
        "message" => "ID kendaraan tidak ditemukan"
    ]);
    exit;
}

$stmt = mysqli_prepare(
    $conn,
    "DELETE FROM kendaraan WHERE id = ?"
);

mysqli_stmt_bind_param(
    $stmt,
    "i",
    $id
);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode([
        "success" => true,
        "message" => "Data kendaraan berhasil dihapus"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Gagal menghapus data"
    ]);
}
?>