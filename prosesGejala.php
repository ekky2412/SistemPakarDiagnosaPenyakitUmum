<?php

error_reporting(0);
    include "koneksi.php";

    $aydi = $_POST['aydi'];

    $sqlRule = "SELECT * FROM gejala";
    $query = mysqli_query($conn,$sqlRule);

    $i = 0;
    foreach($query as $row){
        $tes = $row['id_gejala'];
        $gejala[$i] = (float) $_POST[$tes];
        if($gejala[$i] != 0.0){
            $sqlDiteyl = "INSERT INTO detail_diagnosa(id_diagnosa, id_gejala, cf_user) VALUES ('".$aydi."', '".$tes."', '".$gejala[$i]."')";
            $query2 = mysqli_query($conn,$sqlDiteyl);
        }
        $i++;
    }

    // $sql = "select * from diagnosa inner join detail_diagnosa on detail_diagnosa.id_diagnosa = diagnosa.id_diagnosa inner join gejala on detail_diagnosa.id_gejala = gejala.id_gejala inner join user on user.id_user = diagnosa.id_user where user.id_user = '1'";
    // $sqlBatas = "select penyakit.nama_penyakit,gejala.nama_gejala,gejala.bobot_cf from rule join penyakit on penyakit.id_penyakit = rule.id_penyakit join gejala on gejala.id_gejala = rule.id_gejala";
    $sqlBanyakPenyakit = "Select id_penyakit,kode_penyakit,nama_penyakit from penyakit";
    // $result = mysqli_query($conn,$sql);


    $banyakPenyakit = mysqli_query($conn,$sqlBanyakPenyakit);
    //Perulangan setiap banyak penyakit
    while($row = mysqli_fetch_assoc($banyakPenyakit)){
        $namaPenyakit = $row['nama_penyakit'];
        $kodePenyakit = $row['kode_penyakit'];
        $id_penyakit = $row['id_penyakit'];
        $persentaseRule["$id_penyakit"] = 0;
        
        $sqlRule = "select * from rule join gejala on gejala.id_gejala = rule.id_gejala where id_penyakit = '$id_penyakit'";
        $banyakRule = mysqli_query($conn,$sqlRule);
        $hasil = array();

        //untuk cf user * cf pakar
        $i = 0;

        //untuk cf kombinasi
        $j = 0;
        
        //perulangan setiap rule penyakit
        while($row2 = mysqli_fetch_assoc($banyakRule)){
            
            $sqlUser = "select * from detail_diagnosa where id_diagnosa = '$aydi'";
            $banyakUser = mysqli_query($conn,$sqlUser);
            //perulangan gejala per user
            while($row3 = mysqli_fetch_assoc($banyakUser)){
                // echo "<pre>".var_dump($row3['id_gejala'])."</pre>";
                // echo $row3['id_gejala']."   ".$row2['id_gejala']."<br><br>";
                // echo "<pre>".var_dump($row2['id_gejala'])."</pre>";
                if($row3['id_gejala'] == $row2['id_gejala']){
                    $hasil[$i] = $row3['cf_user'] * $row2['bobot_cf'];
                    $i++;
                    
                }
            }
            
        }
        
        // echo "<pre>".var_dump($hasil)."</pre>";
        // $j = $i;
        
        while($j<$i){
            
            if($j == 0){
                $persentaseRule["$id_penyakit"] = $hasil[$j] + $hasil[$j+1] - ($hasil[$j] * $hasil[$j+1]);
                // echo $persentaseRule["$kodePenyakit"]." ";
                $j++;
            }
            else{
                $persentaseRule["$id_penyakit"] = $persentaseRule["$id_penyakit"] + $hasil[$j+1] - ($persentaseRule["$id_penyakit"] * $hasil[$j+1]);
                $j++;
            }
            
        }

    }

    
    // echo "<pre>".var_dump($persentaseRule)."</pre>";
    var_dump($persentaseRule)."\n";
    // echo array_search(max($persentaseRule), $persentaseRule);
    echo "<br><br>Hasil prediksi penyakit nilai CF yakni pada penyakit ".array_search(max($persentaseRule), $persentaseRule)." dengan nilai CF = ".max($persentaseRule);

    $id_penyakit_tinggi = array_search(max($persentaseRule), $persentaseRule);
    $persentase_penyakit_tinggi = max($persentaseRule);
    $sqlUpdate = "UPDATE diagnosa SET penyakit='$id_penyakit_tinggi', persentase='$persentase_penyakit_tinggi' WHERE id_diagnosa = '$aydi'";
    $query = mysqli_query($conn,$sqlUpdate);

    // TODO Tampilan Hasil Diagnosa Penyakit User, Terus Direct ke Index.php
?>