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
<form action="" method="GET">
  <div class="form-group">
    <label for="namaLengkap">Nama Lengkap</label>
    <input name="nama" type="text" class="form-control" id="namaLengkap" placeholder="Masukkan Nama" required>
  </div>
  <div class="form-group">
    <label for="jenisKelamin">Jenis Kelamin</label>
    <select class="custom-select" name="jenisKelamin" required>
      <option selected disabled>Select</option>
      <option value="L">Laki-Laki</option>
      <option value="P">Perempuan</option>
    </select>
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
    include "koneksi.php";
    if(isset($_GET['nama']) && isset($_GET['jenisKelamin']) && isset($_GET['umur']) ){
        $sqlUser = "INSERT INTO user(nama_user,jenis_kelamin,umur) values('".$_GET['nama']."','".$_GET['jenisKelamin']."','".$_GET['umur']."')";
        
        $query1 = mysqli_query($conn,$sqlUser);

        $user_id = mysqli_insert_id($conn);

        $sqlDiag = "INSERT INTO diagnosa(id_user,penyakit) values('".$user_id."','1')";
        
        $query2 = mysqli_query($conn,$sqlDiag);

        echo "<script>
        window.location.href = 'diagnosa.php?id_diag=".mysqli_insert_id($conn)."';
        </script>";

        // To Do Membuat Inputan gejala-gejala
    }
?>