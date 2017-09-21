<?php
require_once("./class_mysqli_connection.php");


$mysqli=mysqli_connection->db_connect("localhost","test_user","password","test_db");
var_dump($mysqli->db_fetch("select * from test_db.test_table;"));

?>