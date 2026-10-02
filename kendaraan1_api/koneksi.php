<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

$conn = mysqli_connect(

   "localhost",
   "root",
   "",
   "db_kendaraan1"

);

if (!$conn) {
    echo json_encode([
        "success" => false,
        "message" => "Koneksi database gagal"
    ]);
    exit;
}
?>