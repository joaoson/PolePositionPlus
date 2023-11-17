<?php
    include_once 'connection.php';
    session_start();
    if (!isset($_SESSION["id"])) {
        header("Location: index.php");
    }
    $id = $_SESSION["id"];
    $sql = "SELECT * FROM usuario WHERE id_usuario ='". $id . "';";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

?>

<!DOCTYPE html>
<html lang="en">
<head>  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./loggedInStyle.css">
    <title>Logged in</title>
</head>
<body>
    <main>
        <div class="information">
            <h1><?php echo $row['nome'];?></h1>

            <?php
                echo "<p> Nome: " .   $row['nome'] . "</p>";
                echo "<p> Sobrenome: "  .   $row['sobrenome'] . "</p>";
                echo "<p> Email: "  .   $row['email'] . "</p>";
                echo "<p> Senha: " .   $row['senha'] . "</p>";
            ?>
            <div class="buttons">
                <a href="./updateInfo.php"><button>Update Information</button></a>
                <a href="./removeUser.php"><button>Remove Account</button></a>
            </div>
        </div>
    </main>

</body>
</html>

