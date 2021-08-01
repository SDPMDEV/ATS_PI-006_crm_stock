<?php
// CONEXAO PADRÃO
require_once("conexao.php"); 
date_default_timezone_set("Brazil/East"); // Brasil
$host = $servername; // servidor
$database = $dbname; // nome do banco
$login_db = $username; // usuario do banco 
$senha_db = $password; // senha do usuario do banco

define('HOST', $host);	
define('BANCO',  $database);
define('LOGIN',  $login_db);
define('SENHA',  $senha_db);		

// Create connection
$cn = mysqli_connect($host, $login_db, $senha_db, $database);
// Check connection
if (!$cn) {
  die("Connection failed: " . mysqli_connect_error());
}

class conexao
{

    /*
    CONEX�O CRUDS
    */

    private $db_host = HOST; // servidor
    private $db_user = LOGIN; // usuario do banco
    private $db_pass = SENHA; // senha do usuario do banco
    private $db_name = BANCO; // nome do banco

    private $con = false;
    public $link = null;

   
    public function connect() // Estabelece conexao
    {
        if(!$this->link)
        {
            $link = @mysqli_connect($this->db_host,$this->db_user,$this->db_pass,$this->db_name);
            if($link)
            {
                $seldb = @mysqli_select_db($link, $this->db_name);
                return $seldb ? $this->link : null;
            }
            else
            {
                return null;
            }
        }
        else
        {
            return $this->link;
        }
    }

   
    public function disconnect() // Fecha conexao
    {
        if($this->link)
        {
            if(@mysqli_close($this->link))
            {
                $this->link = null;
                return true;
            }
            else
            {
                return false;
            }
        }
    }
      
}

?>
