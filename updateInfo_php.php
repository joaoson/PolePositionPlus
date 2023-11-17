<html>
    <head>
        <title>Dados do usuário</title>
    </head>
    <body>
        <?php
            include("connection.php");

            session_start();
            if (!isset($_SESSION["id"])) {
                header("Location: index.php");
            }

            $id = $_SESSION["id"];
            $nome = $_POST['nome'];
            $sobrenome = $_POST['sobrenome'];
            $email = $_POST['email'];
            $senha = $_POST['senha'];
            $sql = "UPDATE usuario SET nome = '$nome', sobrenome = '$sobrenome', email = '$email' , senha = '$senha' WHERE id_usuario = $id";
            $result = $conn->query($sql);

            if ($result === TRUE) {
?>
<script>
    alert('Usuário editado com sucesso!!!');
    location.href = 'indexLoggedIn.php';
</script>
<?php
            }
            else {
?>
<script>
    alert('Algo não deu certo...');
    history.go(-1);
</script>
<?php
            }
?>
    </body>
</html>