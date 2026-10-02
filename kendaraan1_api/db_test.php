<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = mysqli_connect(
    "sql108.infinityfree.com",
    "if0_42905835",
    "kendaraan5",
    "if0_42905835_db_kendaraan1"
);

if (!$conn) {
    die("GAGAL: " . mysqli_connect_error());
}

echo "DATABASE BERHASIL TERHUBUNG";
?>