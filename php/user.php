<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hakkımızda</title>
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
    justify-content: center;
    background-image: url(photos/background.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}
.rows{
    display: flex;
    flex-direction: row;
    width: 70%;
    padding-top: 1rem;
    padding-bottom: 1rem;
}
.left2{
    display: flex;
    flex: 1;
    flex-direction: column;
    align-items: center;
    margin-right: 1rem;
    background-color: rgb(3 9 47 / 89%);
    border-radius: 3rem;
}
.title{
    display: flex;
    margin-bottom: 12rem;
    color: rgb(50 239 239 / 68%);
}
.right2{
    display: flex;
    flex: 2;
    background-color: rgb(3 9 47 / 89%);
    border-radius: 3rem;
}
.p-ticket{
    display: flex;
    border: solid;
    border-color: rgb(255 255 255 / 39%);
    width: 15rem;
    height: 2rem;
    justify-content: center;
    align-items: center;
    margin-bottom: 1rem;
    border-radius: 2rem;
}
.a2{
    font-size: 20px;
    text-decoration: none;
    padding-right: 2rem;
    padding-left: 2rem;
    color: rgb(50 239 239 / 68%);
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
                    <a href="home2.php">Anasayfa</a>
                    <a href="hakkimizda2.php">Hakkımızda</a>
                    <a href="contact2.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="#">Çıkış Yap</a>
                </div>
            </div>
        </div>

        <div class = "main">
            <div class="rows">
                <div class="left2">
                    <div class="title">
                        <h1>Biletlerim</h1>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="user.php">Purchased Tickets</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="user2.php">Reserved Tickets</a>
                    </div>
                </div>
                <div class="right2">
                    
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

