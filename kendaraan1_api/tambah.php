<?php

include 'koneksi.php';

$nama_kendaraan = $_POST['nama_kendaraan'] ?? '';
$jenis = $_POST['jenis'] ?? '';
$merk = $_POST['merk'] ?? '';
$tahun = $_POST['tahun'] ?? '';
$warna = $_POST['warna'] ?? '';
$harga = $_POST['harga'] ?? '';

if (
    empty($nama_kendaraan) ||
    empty($jenis) ||
    empty($merk) ||
    empty($tahun) ||
    empty($warna) ||
    empty($harga)
) {
    echo json_encode([
        "success" => false,
        "message" => "Semua data wajib diisi"
    ]);
    exit;
}

$gambar = null;

if (isset($_FILES['gambar']) && $_FILES['gambar']['error'] === 0) {
    $namaFile = time() . '_' . basename($_FILES['gambar']['name']);
    $target = 'uploads/' . $namaFile;

    if (move_uploaded_file($_FILES['gambar']['tmp_name'], $target)) {
        $gambar = $namaFile;
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Gagal upload gambar"
        ]);
        exit;
    }
}

$stmt = mysqli_prepare(
    $conn,
    "INSERT INTO kendaraan
    (nama_kendaraan, jenis, merk, tahun, warna, harga, gambar)
    VALUES (?, ?, ?, ?, ?, ?, ?)"
);

mysqli_stmt_bind_param(
    $stmt,
    "sssssss",
    $nama_kendaraan,
    $jenis,
    $merk,
    $tahun,
    $warna,
    $harga,
    $gambar
);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode([
        "success" => true,
        "message" => "Data kendaraan berhasil ditambahkan"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Gagal menambahkan data"
    ]);
}
?>