<?php
    $namaserver = "localhost";
    $username = "root";
    $password = "";
    $namadb = "db_pakar";
    
    $conn = mysqli_connect($namaserver, $username, $password,$namadb);

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
// echo "Connected successfully";
?>