<?php
include "koneksi.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include "assets/bootstrap.php" ?>
    <title>Sistem Pakar Penyakit Umum Certainty Factor</title>
</head>

<body>
    <h1>Selamat datang di website pakar penyakit umum</h1>
    <a class="btn btn-success" href="inputNama.php">Tambah Data Baru</a>
    <br>
    <div>
        <?php
        $sql = "SELECT * FROM user inner join diagnosa on user.id_user = diagnosa.id_user";
        $listUser = mysqli_query($conn, $sql);
        ?>
        <table class="table">
            <thead>
                <th>Nama Pelanggan</th>
                <th>Jenis Kelamin</th>
                <th>Umur</th>
                <th>Waktu diagnosa</th>
                <th>Terkena penyakit</th>
                <th>Tingkat Kepastian</th>
            </thead>
            <tbody>
                <?php
                foreach ($listUser as $value) {
                ?>
                    <tr>
                        <td> <?= $value['nama_user'] ?> </td>
                        <td> <?= $value['jenis_kelamin'] ?> </td>
                        <td> <?= $value['umur'] ?> </td>
                        <td> <?= $value['tanggal'] ?> </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</body>

</html>