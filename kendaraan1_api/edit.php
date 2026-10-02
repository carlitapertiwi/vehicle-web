<?php

include 'koneksi.php';

$id = $_POST['id'] ?? '';
$nama_kendaraan = $_POST['nama_kendaraan'] ?? '';
$jenis = $_POST['jenis'] ?? '';
$merk = $_POST['merk'] ?? '';
$tahun = $_POST['tahun'] ?? '';
$warna = $_POST['warna'] ?? '';
$harga = $_POST['harga'] ?? '';
$gambar_lama = $_POST['gambar_lama'] ?? '';

if (
    empty($id) ||
    empty($nama_kendaraan) ||
    empty($jenis) ||
    empty($merk) ||
    empty($tahun) ||
    empty($warna) ||
    empty($harga)
) {
    echo json_encode([
        "success" => false,
        "message" => "Data tidak lengkap"
    ]);
    exit;
}

$gambar = $gambar_lama;

// kalau pilih gambar baru
if (isset($_FILES['gambar']) && $_FILES['gambar']['error'] === 0) {

    $namaFile = time() . '_' . basename($_FILES['gambar']['name']);
    $target = 'uploads/' . $namaFile;

    if (move_uploaded_file($_FILES['gambar']['tmp_name'], $target)) {

        // hapus gambar lama kalau ada
        if (!empty($gambar_lama)) {
            $fileLama = 'uploads/' . $gambar_lama;

            if (file_exists($fileLama)) {
                unlink($fileLama);
            }
        }

        $gambar = $namaFile;

    } else {
        echo json_encode([
            "success" => false,
            "message" => "Gagal upload gambar baru"
        ]);
        exit;
    }
}

$stmt = mysqli_prepare(
    $conn,
    "UPDATE kendaraan
     SET nama_kendaraan = ?,
         jenis = ?,
         merk = ?,
         tahun = ?,
         warna = ?,
         harga = ?,
         gambar = ?
     WHERE id = ?"
);

mysqli_stmt_bind_param(
    $stmt,
    "sssssssi",
    $nama_kendaraan,
    $jenis,
    $merk,
    $tahun,
    $warna,
    $harga,
    $gambar,
    $id
);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode([
        "success" => true,
        "message" => "Data kendaraan berhasil diubah"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Gagal mengubah data"
    ]);
}
?>