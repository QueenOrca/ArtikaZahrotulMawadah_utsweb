<?php
require_once __DIR__ . '/connection.php';
mysqli_select_db($conn, "db5e");

$nim = mysqli_real_escape_string($conn, $_POST['nim']);
$namalengkap = mysqli_real_escape_string($conn, $_POST['namalengkap']);
$nilai_akhir = floatval($_POST['nilaiakhir']);

function getNilaiHuruf($nilai) {
    if ($nilai >= 0 && $nilai <= 34.50) {
        return ["E", "Tidak Lulus"];
    } elseif ($nilai > 34.50 && $nilai <= 50.50) {
        return ["D", "Kurang Memuaskan"];
    } elseif ($nilai > 50.50 && $nilai <= 65.50) {
        return ["C", "Cukup Memuaskan"];
    } elseif ($nilai > 65.50 && $nilai <= 80.50) {
        return ["B", "Memuaskan"];
    } elseif ($nilai > 80.50 && $nilai <= 100.00) {
        return ["A", "Sangat Memuaskan"];
    } else {
        return ["Invalid", "Nilai tidak valid"];
    }
}

$hasil = getNilaiHuruf($nilaiakhir);
$nilai_huruf = $hasil[0];
$predikat = $hasil[1];

// Upload Foto
$foto_nama = "";
if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
    $fileTmpPath = $_FILES['foto']['tmp_name'];
    $fileName = $_FILES['foto']['name'];
    $fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
    
    $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    if (in_array($fileExtension, $allowedExtensions)) {
        $newFileName = time() . '_' . $nim . '.' . $fileExtension;
        $uploadFileDir = './uploads/';
        
        if (!is_dir($uploadFileDir)) {
            mkdir($uploadFileDir, 0755, true);
        }
        
        $dest_path = $uploadFileDir . $newFileName;
        if(move_uploaded_file($fileTmpPath, $dest_path)) {
            $foto_nama = $newFileName;
        }
    }
}

$sql = "INSERT INTO nilaimhsw (nim, namalengkap, foto, nilaiakhir, nilaihuruf, predikat, created_date, modified_date)
        VALUES ('$nim', '$namalengkap', '$foto_nama', '$nilaiakhir', '$nilaihuruf', '$predikat', NOW(), NOW())";

if (mysqli_query($conn, $sql)) {
    header('Location: viewdata.php');
    exit();
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?>