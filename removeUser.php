<?php
    include("connection.php");

    session_start();
    if (!isset($_SESSION["id"])) {
        header("Location: index.php");
    }

    

        $id = $_SESSION["id"];
        $sql = "DELETE FROM usuario WHERE id_usuario = $id";
        $result = $conn->query($sql);
        session_unset();

        if ($result === TRUE) {
?>
<script>
    alert('Usuário removido com sucesso!!!');
    location.href = 'login.php';
</script>
    <?php
}

else{
    ?>
<script>
    alert('Algo não deu certo...');
    history.go(-1);
</script>
<?php
    }   
?>