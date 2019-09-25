<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hospiten";

//$dbname = md5("electronicax");

// Crear connection
$conn = @mysqli_connect($servername, $username, $password, $dbname);
return $conn;
// revisar connection


?>
