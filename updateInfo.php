<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/loggedInStyle.css">
    <title>Update Info - PPP</title>
</head>
<body>
    <main>

        
        <?php
            include("connection.php");
            
            session_start();
            if (!isset($_SESSION["id"])) {
                header("Location: index.php");
            }
            
            $id = $_SESSION["id"];
            $sql = "SELECT * FROM usuario WHERE id_usuario ='". $id . "';";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $nome = $row['nome'];
                    $sobrenome = $row['sobrenome'];
                    $email = $row['email'];
                    $senha = $row['senha'];
                }
            }
            ?>
        <h1>Editar Usuário</h1>
        <form name="form1" id="form1" method="post" action="updateInfo_php.php">
            <div>
                <label for="nome">Nome:</label>
                <input type="text" name="nome" value="<?php echo $nome ?>"><br>
            </div>
            <div>
                <label for="sobrenome">Sbrenome:</label>
                <input type="text" name="sobrenome" value="<?php echo $sobrenome ?>"><br>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="text" name="email" value="<?php echo $email ?>"><br>
            </div>
            <div>
                <label for="senha">senha</label>
                <input type="text" name="senha" value="<?php echo $senha ?>"><br>
            </div>
            <input type="submit" value="Enviar">
        </form>
    </main>
    </body>
    </html>