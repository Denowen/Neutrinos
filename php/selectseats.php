<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Koltuk Seçimi</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="selectseats.css">

</head>
<body>    
   
<?php
    session_start();
    include 'dbconnect.php';

    $number_ = $_POST['number'];
    $route1_ = $_SESSION['route1_'];
    $route2_ = $_SESSION['route2_'];
    $trainNumber = $_SESSION['trainNumber'];
    $trainNumber2 = $_SESSION['trainNumber2'];
    $passType_ = $_POST['passType'];

    $_SESSION['number']=$number_;
    $_SESSION['passType']=$passType_;

    $query = "SELECT seatNumber FROM seatandclass s, Route r WHERE classType = '$passType_' and trainNo='$trainNumber' and r.routeId=$route1_ and s.trainNo=r.trainNumber";
    $query2 = "SELECT seatNumber FROM seatandclass s, Route r WHERE classType = '$passType_' and trainNo='$trainNumber2' and r.routeId=$route2_ and s.trainNo=r.trainNumber";
    
    $result0 = mysqli_query($conn, $query);
    $num0 = mysqli_num_rows($result0);

    $result1 = mysqli_query($conn, $query);
    $num1 = mysqli_num_rows($result1);

    $result2 = mysqli_query($conn, $query);
    $num2 = mysqli_num_rows($result2);

    $result3 = mysqli_query($conn, $query);
    $num3 = mysqli_num_rows($result3);

    $result4 = mysqli_query($conn, $query);
    $num4 = mysqli_num_rows($result4);

    $result5 = mysqli_query($conn, $query);
    $num5 = mysqli_num_rows($result5);

    $result6 = mysqli_query($conn, $query);
    $num6 = mysqli_num_rows($result6);

    $result7 = mysqli_query($conn, $query);
    $num7 = mysqli_num_rows($result7);

    $result8 = mysqli_query($conn, $query);
    $num8 = mysqli_num_rows($result8);

    $result9 = mysqli_query($conn, $query);
    $num9 = mysqli_num_rows($result9);

    $result10 = mysqli_query($conn, $query2);
    $num10 = mysqli_num_rows($result10);

    $result11 = mysqli_query($conn, $query2);
    $num11 = mysqli_num_rows($result11);

    $result12 = mysqli_query($conn, $query2);
    $num12 = mysqli_num_rows($result12);

    $result13 = mysqli_query($conn, $query2);
    $num13 = mysqli_num_rows($result13);

    $result14 = mysqli_query($conn, $query2);
    $num14 = mysqli_num_rows($result14);

    $result15 = mysqli_query($conn, $query2);
    $num15 = mysqli_num_rows($result15);

    $result16 = mysqli_query($conn, $query2);
    $num16 = mysqli_num_rows($result16);

    $result17 = mysqli_query($conn, $query2);
    $num17 = mysqli_num_rows($result17);

    $result18 = mysqli_query($conn, $query2);
    $num18 = mysqli_num_rows($result18);

    $result19 = mysqli_query($conn, $query2);
    $num19 = mysqli_num_rows($result19);

    mysqli_close($conn);
    ?>

    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="contact.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="signout.php">Çıkış Yap</a>
                </div>
            </div>
        </div>
        
        <div class="box">
            <div class="contain">
                <div class="c-row">
                    <h3>Koltuk Seçimi</h3>
                    <h4><?php echo $_SESSION['way'] ?> </h4> 
                    <h4><?php echo $_SESSION['route1_'] ?> </h4> 
                    <h4><?php echo $_SESSION['route2_'] ?> </h4> 
                    <h4><?php echo $_SESSION['trainNumber'] ?> </h4> 
                    <h4><?php echo $_SESSION['trainNumber2'] ?> </h4> 
                    
                </div>
                <form class ="row" action="pay.php" method="post">
                    <div class="image">
                        <h3>Business</h3>
                        <img src="photos/seats.png" style="width: 99%;padding-left: 1.0005rem;">
                    </div>
                    <div class="image">
                    <h3 >Economy</h3>
                        <img src="photos/seats1.png" style= "width: 99%;">
                    </div>

                    
                    <div class="a-row">
                        <div class = "d-row">
                            <?php if($_SESSION['way'] == 'çift'){ $i6 = 0; ?>  
                         
                            <?php for($i4=0; $i4 < 2; $i4++){ ?>
                                <?php if($i4==0){ ?>
                            <label for="seatNum" style="padding-right: 1rem">Koltuk Numarası Gidiş</label>
                                 <?php }else{ $i6=10; ?>
                                    <label for="seatNum" style="padding-right: 1rem">Koltuk Numarası Dönüş</label>
                                    <?php } ?>
                        
                            <div class="s">
                            <?php for($i2=0; $i2<$number_; $i2++){ ?>
                                <select style="max-width: 3rem;" name="seatNum".$i2 id="seatNum" style="height: 156%;width: 200%;">

                                <?php
$i = 0;
echo"$i6";
while ($i < ${"num$i6"}) {
    while ($count = mysqli_fetch_array(${"result$i6"})) { 
        ?>
                                        <option value="<?php echo $count['seatNumber'] ?>"><?php echo $count['seatNumber'] ?></option>
                                        <?php
       $i++;
    }   
}
?>
                                
                                </select>
                                <?php $i6++; } ?>
                                </div>
                                <?php } ?>
                                <?php }else{ ?>
                                    <label for="seatNum" style="padding-right: 1rem">Koltuk Numarası</label>

                        
                            <div class="s">
                            <?php for($i9=0; $i9<$number_; $i9++){ ?>
                                <select style="max-width: 3rem;" name="seatNum".$i9 id="seatNum" style="height: 156%;width: 200%;">

                                <?php
$i = 0;
while ($i < ${"num$i9"}) {
    while ($count = mysqli_fetch_array(${"result$i9"})) { 
        ?>
                                        <option value="<?php echo $count['seatNumber'] ?>"><?php echo $count['seatNumber'] ?></option>
                                        <?php
       $i++;
    }   
}
?>
                                
                                </select>
                                <?php } ?>
                                </div>
                                <?php } ?>
                            
                        </div>

                    </div>
                    
                     <div class="h-row"">
                        <div class="d-row" style="justify-content: center;">
                                <input type="submit" value="Devam Et" style="background-color: #E5FFCC;
                            border-radius: 1rem;
                            border-color: green;
                            margin-top: 1rem;
                            width: 6rem;
                            height: 2rem;"/>
                            </div>
                        </div>
                        </form>
            </div>
        </div>

        <div class="footer">
            <div class="f-img">
                <img src="photos/new_footer.jpg">
            </div>
            <div class="textt">
                <p>Neutrinos Copyright © 2020. Tüm Hakları Saklıdır.</p>
            </div>
        </div>
        
    </div>


</body>
</html>
