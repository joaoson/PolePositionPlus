<?php
    include("connection.php");

    $email = $_POST["email"];
    $password = $_POST["password"];

    $sql = "SELECT id_usuario, email, senha FROM usuario WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            if ($row["senha"] == $password) {
                session_start();
                $_SESSION["id"] = intval($row["id_usuario"]);
                header("Location: indexLoggedIn.php");
            }
            else {
?>
<script>
    alert("Senha não confere");
    history.go(-1);
</script>
<?php
            }
        }
    }
    else {
?>
<script>
    alert("Login não confere");
    history.go(-1);
</script>
<?php
    }
?>