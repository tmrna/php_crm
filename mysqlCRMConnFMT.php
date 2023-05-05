<?php
// singleton
// exists server side


class mysqlCRMConn{
 private static mysqli $connection;
 private string $host = "host";
 private string $username = "username";
 private string $password = "password";
 private string $database = "database";
  

 public function __construct(){
   // prohibited
 }
 public function __destruct(){
   // prohibited
 }

 // returns reference to the connection instance
 public function getConnection(){
   if(self::$connection == null){
     self::$connection = new mysqli(self::$host, self::$username, self::$password, self::$database);
   }
   return self::$connection;
 } 
}
?>
