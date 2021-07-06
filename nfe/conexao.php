<?php

$servername = "localhost";
$username = "alliancets_stock";
$password = "zK%3g0NNSnas";
$dbname = "alliancets_stock";

// Create connection
$bd = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$bd) {
  die("Connection failed: " . mysqli_connect_error());
}

	
define('EMPRESA', "ALLIANCE TECNOLOGIA E DESENVOLVIMENTO DE SISTEMAS LTDA");	
define('CNPJ',  "36.665.277/0001-80");
define('INSCRICAOESTADUAL',  "");
define('EMPRESA_ENDERECO',  "R. Modesto de Carvalho Araújo");	
define('EMPRESA_CIDADE',  "262");
define('EMPRESA_UF',  "MG");
define('EMPRESA_CEP',  "30.320-410");
define('EMPRESA_TEL',  "(31) 9818-7918");
define('EMPRESA_IBGE',  "123456");

define('API_BLING',  "2061af2d2fbfb2dd29fdbd122c680aa8830fb4e8");
	
	
	
?>
