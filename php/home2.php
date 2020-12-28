<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Anasayfa</title>
    
    <style>
        #slider {
   overflow: hidden;
   margin-bottom: 1rem;
   margin-top: 1rem;
}

@keyframes slider {
	0% { left: -3%; }
	30% { left: -3%; }
	33% { left: -103%; }
	63% { left: -103%; }
	66% { left: -203.4%; }
	95% { left: -203.4%; }
	100% { left: -3%; }
}
#slider figure {
	width:300%;
	position: relative;
	animation: 9s slider infinite;
}

#slider figure:hover {
	animation-play-state: paused;
}
#slider figure img {
	width: 33.333333333%;
	height : 100%;
	float: left;
}

        .box{
  display: flex;
  flex: 1;
  background-color: white;
  justify-content: center;
  background-image: url(photos/background.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  padding-bottom: 1rem;
}
.contain{
    display: flex;
    flex: 1;
    max-width: 70%;
    flex-direction: column;
}
.c-row{
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 1rem;
  margin-bottom: 1rem;
  border: outset;
  background-color: rgba(255, 255, 255, 1);
  border-color: rgb(232 66 66 / 51%);
  border-width: 0.3rem;
  border-radius: 3rem;
  filter: invert(1);
}
.a-row{
    display: flex;
    flex-direction: column;
    padding: 1%;
    width: 50%;
}
.ticket{
    display: flex;
    flex: 1;
    padding-right: 5rem;
}
.way{
    display: flex;
    flex: 1;
    width: 12rem;
}
.start{
    display: flex;
    flex: 1;
    padding-right: 5rem;
}
.end{
    display: flex;
    flex: 1;
    width: 12rem;
}
.sdate{
    display: flex;
    flex: 1;
    padding-right: 5rem;
}
.edate{
    display: flex;
    flex: 1;
    width: 12rem;
}
.s1{
    display: flex;
    padding-right: 1rem;
}
.container {
    display: flex;
    flex-direction: row;
    height: 17rem;
    width: 87%;
  }
  
  .image {
    display: block;
    width: 100%;
    image-rendering: pixelated;
  }
  
  .overlay {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100%;
    width: 100%;
    opacity: 0;
    transition: .5s ease;
    background-color: #008bba63;
  }

  .text {
    color: white;
    font-size: 20px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
  }

  .a{
      display: flex;
      position: relative;
      margin: 2px;
      width: 25%;
  }

  .a:hover .overlay {
    opacity: 1;
  }

  .b{
    display: flex;
    position: relative;
    margin: 2px;
    width: 25%;
  }

  .b:hover .overlay {
    opacity: 1;
  }

  .c{
    display: flex;
    position: relative;
    margin: 2px;
    width: 50%;
  }

  .c:hover .overlay {
    opacity: 1;
  }
  .container2 {
    display: flex;
    flex-direction: row;
    width: 87%;
  }
  .d{
    display: flex;
    flex: 1;
    position: relative;
    margin: 2px;
  }

  .d:hover .overlay {
    opacity: 1;
  }

  .e1{
    display: flex;
    flex: 1;
    flex-direction: column;
  }

  .e{
    display: flex;
    position: relative;
    margin: 2px;
  }

  .e:hover .overlay {
    opacity: 1;
  }
  .f{
    display: flex;
    position: relative;
    margin: 2px;
  }

  .f:hover .overlay {
    opacity: 1;
  }
  .search{
    display: flex;
    width: 100%;
    justify-content: flex-end;
  }
  .a-container{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .details{
    display: flex;
    flex: 1;
    margin-bottom: 1rem;
    filter: invert(1);
  }
  .div1{
    display: flex;
    flex-direction: row;
    margin: 1rem;
  }

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
}</style>
</head>
<body> 
    <?php
    include 'dbconnect.php';
    $query = "SELECT stationName FROM station ";

    $result = mysqli_query($conn, $query);
    $num = mysqli_num_rows($result);
    $result2 = mysqli_query($conn, $query);
    $num2 = mysqli_num_rows($result2);
    mysqli_close($conn);
  ?>

  <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home2.php">Anasayfa</a>
                    <a href="hakkimizda2.php">Hakkımızda</a>
                    <a href="contact2.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="#">Çıkış Yap</a>
                </div>
            </div>
        </div>
        
        
        <div class="box">
            <div class="contain">
                
                <div id="slider">
                    <figure>
                          <img src="photos/CORONA.jpg" style="filter: invert(1);">
                          <img src="photos/trenyolu_.jpg">
                          <img src="photos/trenyolu_2.jpg" style="filter: hue-rotate(45deg);">
                    </figure>
                </div>
                
                <div class="c-row">
                    <form class="a-row" action="filteredticket.php" method="post">
                        <div class="div1">
                            <div class="ticket">
                                <div class="s">
                                    Satış
                                </div>
                                <div class="s1">
                                    <input type="radio" name="ticket" value="Satış" />
                                </div>
                                <div class="s">
                                    Rezervasyon
                                </div>
                                <div class="s1">
                                    <input type="radio" name="ticket" value="Rezervasyon" />
                                </div>
                            </div>
                            <div class="way">
                                <div class="s">
                                    Tek yön
                                </div>
                                <div class="s1">
                                    <input type="radio" id="way" name="way" value="tek" />
                                </div>
                                <div class="s">
                                    Gidiş dönüş
                                </div>
                                <div class="s1">
                                    <input type="radio" id="way2" name="way" value="çift" />
                                </div>
                            </div>
                        </div>
                        <div class="div1">
                            <div class="start">
                                <div class="s1">
                                    Nereden
                                </div>
                                <div class="s">
                                    <select name="nereden" id="nereden" style="width: 160%;">
        <?php
$i = 0;
while ($i < $num) {
    while ($count = mysqli_fetch_array($result)) {
        ?>
                                        <option value="<?php echo $count['stationName'] ?>"><?php echo $count['stationName'] ?></option>
                                        <?php
        $i++;   
    }   
}
?>
                                    </select>
                                </div>
                            </div>
                            <div class="end">
                                <div class="s1">
                                    Nereye
                                </div>
                                <div class="s">
                                    <select name="nereye" id="nereye" style="width: 160%;">
                                    
                                    <?php
$i2 = 0;
while ($i2 < $num2) {
    while ($count = mysqli_fetch_array($result2)) {
        ?>
                                        <option value="<?php echo $count['stationName'] ?>"><?php echo $count['stationName'] ?></option>
                                        <?php
        $i2++;   
    }   
}
?>

                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="div1">
                            <div class="sdate">
                               
                                <div class="s1">
                                    <label for="sdate">Gidiş Tarihi</label>
                                </div>
                                <div class="s">
                                    <input type="date" id="sdate" name="sdate"/>
                                </div>
                            </div>
                            
                            <div class="edate">
                                <div class="s1">
                                    <label for="edate">Dönüş Tarihi</label>
                                </div>
                                <div class="s">
                                    <input type="date" id="edate" name="edate" />
                                </div>
                            </div>
                        </div>
                        <div class="div1">
                            <div class="search">
                                <input type="submit" value="Ara" style="background-color: #E5FFCC;
                                border-radius: 1rem;
                                border-color: green;
                                width: 6rem;
                                height: 2rem;"/>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="details">
                    <img src="photos/details.jpg" style="width: 100%;">
                </div>

                <div class="a-container">
                    <div class="container">
                        <div class="a">
                            <img src="photos/ankara.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">Ankara</div>
                            </div>
                        </div>
    
                        <div class="b">
                            <img src="photos/konya.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">Konya</div>
                            </div>
                        </div>
    
                        <div class="c">
                            <img src="photos/istanbul.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">İstanbul</div>
                            </div>
                        </div>
                    </div>
    
                    <div class="container2">
                        <div class="d">
                            <img src="photos/izmir.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">İzmir</div>
                            </div>
                        </div>
    
                        <div class="e1">
    
                            <div class="e">
                                <img src="photos/eskisehir.jpg" alt="Avatar" class="image">
                                <div class="overlay">
                                  <div class="text">Eskişehir</div>
                                </div>
                            </div>
                            <div class="f">
                                <img src="photos/kars.jpg" alt="Avatar" class="image">
                                <div class="overlay">
                                  <div class="text">Kars</div>
                                </div>
                            </div>
    
                        </div>
    
                    </div>
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
