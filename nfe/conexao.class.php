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
    CONEXÃO CRUDS
    */

    private $db_host = HOST; // servidor
    private $db_user = LOGIN; // usuario do banco
    private $db_pass = SENHA; // senha do usuario do banco
    private $db_name = BANCO; // nome do banco

    private $con = false;

   
    public function connect() // Estabelece conexao
    {
        if(!$this->con)
        {
            $myconn = @mysqli_connect($this->db_host,$this->db_user,$this->db_pass,$this->db_name);
            if($myconn)
            {
                $seldb = @mysqli_select_db($this->db_name,$myconn);
                if($seldb)
                {
                    $this->con = true;
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        else
        {
            return true;
        }
    }

   
    public function disconnect() // Fecha conexao
    {
    if($this->con)
    {
        if(@mysqli_close())
        {
                        $this->con = false;
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
