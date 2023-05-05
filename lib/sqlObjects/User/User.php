<?php

require_once "../sqlTemplate/sqlTemplate.php";
require_once"../../../mysqlCRMConn.php";

class User implements sqlTemplate{
  
  private string $username_;
  private string $password_;
  private string $fName;
  private string $lname;
  private int $empID;

  // hashes the set password,
  // if the current password is blank returns false
  private function hashPasword() : string | bool{
    $result = self::$password_ == "" ? false : password_hash(self::$password_, PASSWORD_BCRYPT);
    return $result;
  } 

  public function setUsername(string $newUsername) : void{
    self::$username_ = $newUsername;
  }

  public function setPassword(string $password) : void{
    self::$password_ = $password;
  }

  public function exists() : bool{

    if(self::$username_ == "") return false;     
    $conn = new mysqlCRMConn(); 

    if ($stmt = $conn->getConnection()->prepare("SELECT * FROM USERS WHERE username = ?")){
      $stmt->bind_param("s", $paramUname);
      $paramUname = self::$username_;

      if($stmt->execute()){

        $stmt->bind_result("s", $resUname);
        $stmt->fetch();

        if($stmt->num_rows() == 1){
          $stmt->close();
          return true;
        }
      }
      $stmt->close();
    }
    return false;
  }

  public function passwordMatch(){

  }

  public function purge() : bool{

  }

  public function fetch() : mysqli_result{

  }

  public function push() : bool{

  }
}
?>
