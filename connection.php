<?php
    $host = "localhost";
    $username = 'root';
    $password = "PUC@2023";
    $database = "polepositionplus";

    $conn = new mysqli($host, $username, $password, $database);

    if ($conn->connect_error) {
        die("". $conn->connect_error);
    }
?>