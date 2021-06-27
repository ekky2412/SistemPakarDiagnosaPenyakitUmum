<?php
include "koneksi.php";

        $cari = $_GET['detail'];
        $query = "SELECT * FROM user inner join diagnosa on user.id_user = diagnosa.id_user inner join penyakit on diagnosa.penyakit = penyakit.id_penyakit where id_diagnosa='$cari' ";
        $listDetail = mysqli_query($conn, $query);


        $sqlGejala = "SELECT * FROM diagnosa inner join detail_diagnosa on detail_diagnosa.id_diagnosa = diagnosa.id_diagnosa inner join gejala on detail_diagnosa.id_gejala = gejala.id_gejala where detail_diagnosa.id_diagnosa = '$cari'";
        $listGejala = mysqli_query($conn, $sqlGejala);



?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include "assets/bootstrap.php" ?>
    <title>Proses Gejala</title>
</head>
<body>
    <div class="container">
    <h1 align="center" style="margin-bottom: 24px;">Data Hasil Diagnosa</h1>


    <table class="table table-striped">

    <thead>
        <tr>
            <th>Nama Pelanggan</th>
            <th>Jenis Kelamin</th>
            <th>Umur</th>
            <th>Waktu diagnosa</th>
        </tr>
    </thead>
    <tbody>
        <?php
           foreach ($listDetail as $key) {
  
        ?>
      <tr>
        <td> <?= $key['nama_user'] ?> </td>
        <td> <?= $key['jenis_kelamin'] ?> </td>
        <td> <?= $key['umur'] ?> </td>
        <td> <?= $key['tanggal'] ?> </td>
      </tr>

    <?php
        }
    ?>
    </tbody>
  </table>

  <br>

   <table class="table table-striped">

    <thead>
        <tr>
            <th colspan="3">Gejala yang dialami</th>
        </tr>
        <tr>
            <th>No</th>
            <th>Nama Gejala</th>
        </tr>
    </thead>
    <tbody>
    <?php
        $No = 1;
        foreach($listGejala as $row){
    ?>

      <tr>
        <td><?= $No++ ?></td>
        <td><?= $row['nama_gejala'] ?></td>
      </tr>

    <?php
        }
    ?>
    </tbody>
  </table>


    <hr>
    <h3>Hasil Konsultasi</h1>

    <table   style="font-size: 20px; border-collapse: collapse; width: 100%;">
            <tr>
                <?php
                foreach($listDetail as $value){
                    ?>
                <td style="font-size: 18px; width: 90%;" >
                    <b>Jenis Penyakit yang diderita adalah : <?=$value['nama_penyakit'] ?> / <?= round($value['persentase'], 2)?> % (<?= $value['persentase']?>)
                    </b>
                </td>
 
            </tr>
    </table>

    <br>
    <table class="table table-striped" border="1"  style="font-size: 16px; width: 100%;">
            <tr>
                <td style="font-size: 16px; width: 100%;" > Penanganan   : <?php echo $value['penanganan']; ?></td>
            </tr>
    </table>
    <br>
    <table class="table table-striped" border="1"  style="font-size: 16px; width: 100%;">
            <tr>
                <td style="font-size: 16px; width: 100%;" > Untuk penanganan lebih lanjut disarankan untuk kerumah sakit atau mengunjungi dokter terdekat.</td>
            </tr>
    </table>
    <br>
            <?php
                }
            ?>
        <center>
            <a style="margin-top: 24px; margin-bottom: 24px;" class="btn btn-success" href= "detail_print.php?detail=<?= $value['id_diagnosa']?>">Print</a>
            <a style="margin-top: 24px; margin-bottom: 24px;" class="btn btn-success" href="index.php">Kembali</a>
        </center>

    <br>
    <br>
</div>
</body>
</html>