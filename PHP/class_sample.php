<?php
require_once("./class_mysqli_connection.php");


$mysqli=new mysqli_connection("localhost","test_user","password","test_db");

var_dump($mysqli->db_a_fetch_assoc(array("select * from test_db.test_table;"));

?>