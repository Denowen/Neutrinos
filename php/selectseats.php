<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Koltuk Seçimi</title>
    <style>
        * {
    font-family: Arial;
}
.page{
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
    display: flex;
    flex: 1;
    flex-direction: column;
}
.navbar{
    display: flex;
    flex-direction: row;
    height: 10rem;
    background-color: black;
}
.left{
    display: flex;
    flex: 1;
    background-image: url(photos/Untitled\ Design.jpg);
}
.right{
    display: flex;
    flex: 1;
    align-items: center;
    justify-content: center;
    background-color: black;
}
.list{
    display: flex;
    flex: 1;
    max-width: 70%;
}
.list a{
    display: flex;
    flex: 1;
    align-items: center;
    justify-content: center;
    height: 2rem;
    border-radius: 5rem;
    text-decoration: none;
    color: rgba(255, 255, 255, 0.836);
    border-style: solid;
    border-color: rgba(0, 128, 128, 0.678);
    margin: 1%;
}
.list a:hover{
    color: red;
}

.footer{
    display: flex;
    flex-direction: column;
    background-color:black;
}
.f-img{
    display: flex;
    justify-content: center;
    padding-top: 1rem;
}
.textt{
    display: flex;
    justify-content: center;
    color: white;
}
.box{
    display: flex;
    flex: 1;
    justify-content: center;
    background-image: url(photos/background.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}
.contain{
    display: flex;
    flex: 1;
    max-width: 70%;
    flex-direction: column;
    align-items: center;
    
}
.c-row{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 1rem;
    border: outset;
    border-radius: 5rem;
    background-color: whitesmoke;
    border-color:rgba(0, 128, 128, 0.678);
    border-width: 0.3rem;
    width: 80rem;
    filter: opacity(0.9);
}

.row{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: outset;
    border-radius: 5rem;
    background-color: whitesmoke;
    border-color:rgba(0, 128, 128, 0.678);
    border-width: 0.3rem;
    filter: opacity(0.9);
}

.d-row{
    display: flex;
    padding: 1rem;
}

.image{
    display: flex;
    padding: 1rem;
    flex-direction: column;
    align-items: center;
}






    </style>

</head>
<body>    
   
<?php
    session_start();
    include 'dbconnect.php';
    $number_ = $_POST['number'];
    $_SESSION['number']=$number_;
    $passType_ = $_POST['passType'];
    $query = "SELECT seatNumber FROM seatandclass WHERE classType = '$passType_'";
    $query = "SELECT seatNumber FROM seatandclass WHERE classType = '$passType_'";
    
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

    $result10 = mysqli_query($conn, $query);
    $num10 = mysqli_num_rows($result10);

    $result11 = mysqli_query($conn, $query);
    $num11 = mysqli_num_rows($result11);

    $result12 = mysqli_query($conn, $query);
    $num12 = mysqli_num_rows($result12);

    $result13 = mysqli_query($conn, $query);
    $num13 = mysqli_num_rows($result13);

    $result14 = mysqli_query($conn, $query);
    $num14 = mysqli_num_rows($result14);

    $result15 = mysqli_query($conn, $query);
    $num15 = mysqli_num_rows($result15);

    $result16 = mysqli_query($conn, $query);
    $num16 = mysqli_num_rows($result16);

    $result17 = mysqli_query($conn, $query);
    $num17 = mysqli_num_rows($result17);

    $result18 = mysqli_query($conn, $query);
    $num18 = mysqli_num_rows($result18);

    $result19 = mysqli_query($conn, $query);
    $num19 = mysqli_num_rows($result19);

    mysqli_close($conn);
    ?>

    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.html">Anasayfa</a>
                    <a href="hakkimizda.html">Hakkımızda</a>
                    <a href="kayıt.html">Kayıt Ol</a>
                    <a href="contact.html">İletişim</a>
                    <a href="giris.html">Giriş Yap</a>
                </div>
            </div>
        </div>
        
        <div class="box">
            <div class="contain">
                <div class="c-row">
                    <h3>Koltuk Seçimi</h3>
                    <h4><?php echo $_SESSION['way'] ?> </h4> 
                    <h4><?php echo $_SESSION['route1'] ?> </h4> 
                    <h4><?php echo $_SESSION['route2'] ?> </h4> 
                    <form method="get" action="pay.php">
     <input type="hidden" name="number" value='$number_'>
        </form>
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
                                 <?php }else{ ?>
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
                    
                     <div class="h-row" action="pay.html">
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