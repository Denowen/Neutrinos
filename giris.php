<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giriş</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="giris.css">
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

            .main{
    display: flex;
    flex: 1;
    background-image: url("photos/background.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    justify-content: center;
    
}
.contain{
    display: flex;
    flex: 1;
    max-width: 70%;
    flex-direction: column;
    height: 33rem;
    align-items:center;
}
.c-row{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 5rem;
    margin-bottom: 1rem;
    border: outset;
    width: 55%;
    background-color: white;
    border-radius: 2rem;
    border-color: rgba(0, 128, 128, 0.678);
    filter: opacity(0.9);
    border-width: 0.3rem;
}
.footer{
    display: flex;
    flex-direction: column;
    margin-top: 0%;
    background-color:black;
    border-width: 0.3rem;
}

.giris{
    display: flex;
}

.d-row{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 0.2rem;
    margin-bottom: 1rem;
    border: outset;
    width: 55%;
    background-color: white;
    border-radius: 2rem;
    filter: opacity(0.9);
    border-color: rgba(0, 128, 128, 0.678);
}

.e-row{
    display:flex;
    flex-direction: row;
    margin-bottom: 1rem;
}


</style>
</head>
<body>    
   
    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="kayit.php">Kayıt Ol</a>
                    <a href="contact.php">İletişim</a>
                    <a href="giris.php">Giriş Yap</a>
                </div>
            </div>
        </div>

        <div class = "main">
            <div class = "contain">
                <div class = "c-row">
                    <div class = "giris">
                        <h3>Üye Girişi</h3>
                        
                    </div>
                </div>

                <div class = "d-row">

                <form class = "a-row">
                    <div class="e-row">
                        <label for="email" style= "margin-top:1rem">E-mail:</label>
                        <input type="email" id="email" name="email" style="height: 100%;margin-top:1rem"/>
                    </div>
                    <div class="e-row">
                        <label for="password" style="padding-right: 5%">Şifre:</label>
                        <input type="password" id="password" name="password" style="height: 100%;"/>
                    </div>
                    <div class="submit" style="width:43%; padding-left:33%">
                        <input type="submit" value="Giriş Yap" style="background-color: #E5FFCC;border-radius: 1rem;border-color: green; width:100%;height:100%" />
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
    </body>
    </html>
