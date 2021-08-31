<?php
require_once '../database/conexao.class.php';
$con = new conexao(); // instancia classe de conxao
$con->connect(); // abre conexao com o banco

$connection = mysqli_connect(HOST, LOGIN, SENHA,BANCO);

$query = "SELECT
						sma_boleto_config.agencia AS agencia,
						sma_boleto_config.conta AS conta,
						sma_banco_boleto.nome AS banco,
						sma_banco_boleto.auto_incremento AS auto_incremento
					FROM
						sma_boleto_config
					INNER JOIN sma_banco_boleto ON sma_banco_boleto.id = sma_boleto_config.banco_id
					WHERE
						sma_banco_boleto.nome = 'sicoob'";
$query_boleto_config = mysqli_query($connection, $query);
$boleto_config = mysqli_fetch_array($query_boleto_config);

die(var_dump($boleto_config));
?>