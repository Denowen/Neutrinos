<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="100;url=home.php" />
    <title>Ödeme</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="pay.css">

</head>
<body>    
   <?php
   session_start();
   include 'dbconnect.php';
   
   $email = $_SESSION['email'];
    //QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
    $query = mysqli_query($conn, "select * from registeredusers where regUserEmail = '$email'");
    $counta = mysqli_num_rows($query);
    if (!$counta) {
        header("location:admin.php");
    } 

   ?>
    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="kayit.php">İletişim</a>
                    <a href="contact.php">Profilim</a>
                    <a href="giris.php">Çıkış Yap</a>
                </div>
            </div>
        </div>
        
        <div class="box">
            <div class="contain">
                <div class="c-row">
                    <h3>Ödeme</h3>
                    
                </div>
                <div class="row">
                    <div class ="image">
                   <img src="photos/deneme.png" style="width:73%">
                </div>

                <form class="a-row" action = "pay2.php" method = "post">
                <div class = "d-row">
                    <label for="cardnumber" style="padding-right: 1rem">Kart Numarası</label>
                    <input type="number" required id="cardnumber"  oninput="if(value.length>16)value=value.slice(0,16)" min="1000000000000000" name="cardnumber" style="height: 56%;" />
                </div>

                <div class = "d-row">
                    <label for="cvv" style="padding-right: 1rem">Güvenlik Kodu</label>
                    <input type="number" required id="cvv" oninput="if(value.length>3)value=value.slice(0,3)" name="cvv" style="height: 56%;" />
                </div>

                <div class = "d-row">
                    <label for="expDate" style="padding-right: 1rem">Son Kullanma Tarihi</label>
                    <div class="s">
                        <select name="month" id="month" style="height: 156%;">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>

                        </select>
                        /
                        <select name="year" id="year" style="height: 156%;">
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                        </select>

                    </div>
                    
                    
                </div>
                <div class = "d-row">
                    <label for="ns" style="padding-right: 1rem">İsim & Soyisim:</label>
                    <input type="text" required id="ns" name="ns" style="height: 56%;" />
                </div>
                <div class="d-row" style="justify-content: center">
                        <input type="submit" value="Ödeme Yap" style="background-color: #E5FFCC;
                    border-radius: 1rem;
                    border-color: green;
                    margin-top: 1rem;
                    width: 6rem;
                    height: 2rem;"/>
                    </div>

            </form>
            
        </div>
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
