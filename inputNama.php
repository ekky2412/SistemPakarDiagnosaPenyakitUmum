<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include "assets/bootstrap.php" ?>
    <title>Input Data Diri</title>
</head>
<body>
<div class="p-5">
<form action="" method="get">
  <div class="form-group">
    <label for="namaLengkap">Nama Lengkap</label>
    <input name="nama" type="text" class="form-control" id="namaLengkap" placeholder="Masukkan Nama" required>
  </div>
  <div class="form-group">
    <label for="jenisKelamin">Jenis Kelamin</label>
    <input name="jenisKelamin" type="text" class="form-control" id="jenisKelamin" placeholder="Masukkan Jenis Kelamin" required>
  </div>
  <div class="form-group">
    <label for="umur">Umur</label>
    <input name="umur" type="text" class="form-control" id="umur" placeholder="Masukkan Umur" required>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</body>
</html>

<?php
    if(isset($_GET['nama']) && isset($_GET['jenisKelamin']) && isset($_GET['umur']) ){
        $sql = "INSERT INTO user(nama_user,jenis_kelamin,umur) values('".$_GET['nama']."','".$_GET['jenisKelamin']."','".$_GET['umur']."')";
        
        // $query = mysqli_query($conn,$sql);

        echo "<script>
        window.location.href = 'diagnosa.php';
        </script>";

        // To Do Membuat Inputan gejala-gejala
    }
?>