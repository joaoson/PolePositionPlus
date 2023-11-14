<!DOCTYPE html>
<?php

    include("connection.php");
?>
<html lang="en" translate="no">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <title>Pole Position Plus</title>
</head>
<body>
    <header>
        <div class="wrapper">
            <h1>
                PPP
            </h1>
            <div class="buttons">
                <button class="botao">Login</button>
                <a href="./signup.php"><button class="botao">Sign up</button></a>
            </div>
        </div>
    </header>
    <main>
        <div class="mainTitle">
            <h1>
                <div class="green">
                    POLE
                </div>
                <div class="red">
                    POSITION 
                </div>
                <div>
                    PLUS
                </div>
            </h1>
        </div>
        <div class="arrow" id="arrow">
            <svg id="arrowIcon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/></svg>

        </div>
        <div id="container3D"></div>
        <section class="infoPanel" data-aos="zoom-in">
            <h3 class="red">Welcome to our platform</h3>
            <h4>Your online gaming and gambling all in one platform, the only one completely related to formula 1</h4>
            <h3>Wanna now more about our services and how it works?</h3>
            <h4>Go to our FAQ page</h4>
        </section>
        <section class="teamDriverInfo">
            <h2>Here are the current Formula 1 drivers and teams</h2>
            <div class="results">
            <?php
                $sql = "SELECT piloto.nome,piloto.sobrenome,Equipe.Nome as equipe, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),piloto.dataNascimento)), '%y') as Idade FROM piloto INNER JOIN Equipe on (piloto.fk_Equipe_id_equipe = Equipe.id_equipe)";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        ?>
                            <div class="card" data-aos="zoom-in">
                                <h2><?php echo $row["nome"]?></h2>
                                <h3><?php echo $row["sobrenome"]?></h3>
                                <img class="imageDriver" src="<?php echo $row["sobrenome"]== "Russel" ? "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/russell.jpg.img.1920.medium.jpg/1677069334466.jpg": "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/". $row["sobrenome"] . ".jpg.img.1024.medium.jpg/1677069646195.jpg"?>" alt="">
                                <h4><?php echo $row["equipe"]?></h4>
                                <h4><?php echo $row["Idade"]?> Years Old</h4>
                            </div>
                        <?php
                    }
                }
            ?>
            </div>
        </section>
        
    </main>
    <footer class="footer">
        <h2>Thank you for visiting our website</h2>
    </footer>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="module" src="./main.js"></script>
    <script>
        AOS.init();
    </script>

</body>
</html>