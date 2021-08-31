<?php

Error_reporting(0);

require_once '../../database/conexao.class.php';
$con = new conexao(); // instancia classe de conxao
$con->connect(); // abre conexao com o banco

$connection = mysqli_connect(HOST, LOGIN, SENHA,BANCO);

$query = "SELECT
						sma_boleto_config.agencia AS agencia,
						sma_boleto_config.conta AS conta,
						sma_boleto_config.serial_number AS serial_number,
						sma_boleto_config.codigo_cliente AS codigo_cliente,
						sma_boleto_config.chave_acesso_web AS chave_acesso_web
					FROM
						sma_boleto_config
					INNER JOIN sma_banco_boleto ON sma_banco_boleto.id = sma_boleto_config.banco_id
					WHERE
						sma_banco_boleto.nome = 'sicoob'";
$query_boleto_config = mysqli_query($connection, $query);
$boleto_config = mysqli_fetch_array($query_boleto_config);


$dadosboleto['numCliente'] = $boleto_config['codigo_cliente'] ? $boleto_config['codigo_cliente'] : '';
$dadosboleto['coopCartao'] = $boleto_config['agencia'] ? $boleto_config['agencia'] : '';
$dadosboleto['chaveAcessoWeb'] = $boleto_config['chave_acesso_web'] ? $boleto_config['chave_acesso_web'] : '';
$dadosboleto['numContaCorrente'] = $boleto_config['conta'] ? $boleto_config['conta'] : '';
$dadosboleto['nomeSacado'] = $_POST['customer_name'] ? $_POST['customer_name'] : '';
$dadosboleto['cpfCGC'] = '01234567890';
$dadosboleto['dataNascimento'] = '19901225';
$dadosboleto['endereco'] = '';
$dadosboleto['bairro'] = '';
$dadosboleto['cidade'] = $_POST['customer_city'] ? $_POST['customer_city'] : '';
$dadosboleto['cep'] = '';
$dadosboleto['uf'] = $_POST['customer_state'] ? $_POST['customer_state'] : '';
$dadosboleto['codMunicipio'] = '';
$dadosboleto['telefone'] = $_POST['customer_phone'] ? $_POST['customer_phone'] : '';
$dadosboleto['ddd'] = '';
$dadosboleto['ramal'] = '';
$dadosboleto['bolRecebeBoletoEletronico'] = $_POST['customer_email'] ? '1' : '0';
$dadosboleto['email'] = $_POST['customer_email'] ? $_POST['customer_email'] : '';
$dadosboleto['numTitulo'] = '1542';
$dadosboleto['codEspDocumento'] = '';
$dadosboleto['dataEmissao'] = '20210830';
$dadosboleto['seuNumero'] = '';
$dadosboleto['valorTitulo'] = $_POST['valor_cobrado'] ? number_format((float)$_POST['valor_cobrado'], 2, '.', '') : '0.0';
$dadosboleto['codTipoVencimento'] = '1';
$dadosboleto['dataVencimentoTit'] = '20200901';
$dadosboleto['dataLimitePagamento'] = '20200901';
$dadosboleto['valorAbatimento'] = '0.00';
$dadosboleto['valorIOF'] = '0.00';
$dadosboleto['bolAceite'] = '';
$dadosboleto['percTaxaMulta'] = '0.00';
$dadosboleto['percTaxaMora'] = '0.00';
$dadosboleto['dataMulta'] = '';
$dadosboleto['dataJuros'] = '';
$dadosboleto['nomeSacador'] = '';
$dadosboleto['numCGCCPFSacador'] = '';
$dadosboleto['dataPrimDesconto'] = '';
$dadosboleto['valorPrimDesconto'] = '0.00';
$dadosboleto['dataSegDesconto'] = '';
$dadosboleto['valorSegDesconto'] = '0.00';
$dadosboleto['dataTerDesconto'] = '';
$dadosboleto['valorTerDesconto'] = '0.00';
$dadosboleto['descInstrucao1'] = '';
$dadosboleto['descInstrucao2'] = '';
$dadosboleto['descInstrucao3'] = '';
$dadosboleto['descInstrucao4'] = '';
$dadosboleto['descInstrucao5'] = '';
$dadosboleto['submit'] = 'Gravar';

function sendToSiccob($data) {
	$curl = curl_init();
	
	curl_setopt_array($curl, array(
		CURLOPT_URL => 'https://geraboleto.sicoobnet.com.br/geradorBoleto/GerarBoleto.do',
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => '',
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 0,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => 'POST',
		CURLOPT_POSTFIELDS => http_build_query($data),
		CURLOPT_HTTPHEADER => array(
			'Content-Type: application/x-www-form-urlencoded',
			'Cookie: JSESSIONID=00EDA2603657B2788ED8DEB4DCF4F20D.node_boleto; BIGipServerpool-prod-geraboleto-8109=!Ucz7Nn/uPYy4whCas2kgYa8EkmKUKlQvceHOjsvB7fvGW1izVvjaQnOZX/DO+ezHnv7EnEcPEqozUA==; TS011519d4=01cd5c66823e402f2ab0e6546de0991432e6a4f21076a31702b077f651cad031541010a5477f644e9031ea0bb5c37903c254c6b23c1f433df345abf8ddf31440f26afd174d07812b66f32c58edd67fa63f402f6241'
		),
	));
	
	$response = curl_exec($curl);
	
	curl_close($curl);
	return $response;
	
}

echo sendToSiccob($dadosboleto);
?>
