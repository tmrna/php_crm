<?php

interface sqlTemplate{

  public function __construct();
  public function __destruct();

  // check if the object exists
  public function exists() : bool;

  // delete the object
  public function purge() : bool;

  // fetch the object from database
  public function fetch() : mysqli_result;

  // add the object to the database
  public function push() : bool;

}

?>
