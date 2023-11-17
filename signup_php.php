<html>
    <head>
        <title>Sign up - PPP</title>
    </head>
    <body>
        <?php
            include("connection.php");

            $name = $_POST["name"];
            $surname = $_POST["surname"];
            $birth = $_POST["birth"];
            $telephone = $_POST["telephone"];
            $email = $_POST["email"];
            $password = $_POST["password"];
            $sql = "INSERT INTO Usuario(nome, sobrenome, dataNascimento, email, telefone, senha) VALUES('$name', '$surname' , '$birth' , '$email' , '$telephone', '$password')";
            $result = $conn->query($sql);

            if ($result === TRUE) {
?>
<script>
    alert('Usuário cadastrado com sucesso!');
    location.href = 'login.php';
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