<?php 
  include "koneksi.php";

  $sqlRule = "SELECT * FROM gejala";
  $query = mysqli_query($conn,$sqlRule); 

  $aydi = $_GET['id_diag'];

  ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include "assets/bootstrap.php" ?>
    <title>Input Gejala</title>
</head>
<body>
  <div class="container">
      <div class="p-5">
        <h1 align="center" style="margin-bottom: 24px;"> Input Gejala Anda</h1>
        <form action="prosesGejala.php" method="POST">
          <input type="hidden" name="aydi" value="<?=$aydi?>">
          <div class="form-group row">
            <?php 
            foreach($query as $row){
            ?>
            <div class="col-md-12" align="center">
              <label class="col-sm-9 col-form-label">Apakah Anda mengalami <?= $row['nama_gejala'] ?>?</label>
              <div class="col-sm-6 my-2">
                <select class="custom-select" name="<?=$row['id_gejala']?>" required>
                  <option selected disabled>Select</option>
                  <option value="0">Tidak</option>
                  <option value="0.2">Tidak Tahu</option>
                  <option value="0.4">Sedikit Yakin</option>
                  <option value="0.6">Cukup Yakin</option>
                  <option value="0.8">Yakin</option>
                  <option value="1">Sangat Yakin</option>
                </select>
              </div>
            </div>
            <?php }
            ?>
          </div>
          <center>
            <button type="submit" class="btn btn-primary">Submit</button>
          </center>
        </form>
      </div>
  </div>
</body>
</html>