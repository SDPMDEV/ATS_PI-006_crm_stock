<?php

Error_reporting(0);

require_once '../../database/conexao.class.php';
$con = new conexao(); // instancia classe de conxao
$con->connect(); // abre conexao com o banco

$connection = mysqli_connect(HOST, LOGIN, SENHA,BANCO);

$query = "SELECT
						sma_boleto_config.agencia AS agencia,
						sma_boleto_config.conta AS conta,
						sma_banco_boleto.nome AS banco,
						sma_boleto_config.auto_incremento AS auto_incremento,
						sma_boleto_config.codigo_cliente AS convenio
					FROM
						sma_boleto_config
					INNER JOIN sma_banco_boleto ON sma_banco_boleto.id = sma_boleto_config.banco_id
					WHERE
						sma_banco_boleto.nome = 'sicoob'";
$query_boleto_config = mysqli_query($connection, $query);
$boleto_config = mysqli_fetch_array($query_boleto_config);

// ------------------------- DADOS DINÂMICOS DO SEU CLIENTE PARA A GERAÇÃO DO BOLETO (FIXO OU VIA GET) -------------------- //
// Os valores abaixo podem ser colocados manualmente ou ajustados p/ formulário c/ POST, GET ou de BD (MySql,Postgre,etc)	//

// DADOS DO BOLETO PARA O SEU CLIENTE
$dias_de_prazo_para_pagamento = 7;
$taxa_boleto = 0;
$data_venc = '12/12/2021'; //date("d/m/Y", time() + ($dias_de_prazo_para_pagamento * 86400));  // Prazo de X dias OU informe data: "13/04/2006"; 
$valor_cobrado = $_POST['valor_cobrado']; // Valor - REGRA: Sem pontos na milhar e tanto faz com "." ou "," ou com 1 ou 2 ou sem casa decimal
$valor_cobrado = str_replace(".", "", $valor_cobrado);
$valor_cobrado = str_replace("R$ ", "", $valor_cobrado);
//$valor_cobrado = str_replace(",", ".", $valor_cobrado);
$valor_boleto = $valor_cobrado; //number_format($valor_cobrado + $taxa_boleto, 2, ',', '');

//$dadosboleto["nosso_numero"] = "08123456";  // Até 8 digitos, sendo os 2 primeiros o ano atual (Ex.: 08 se for 2008)


/*************************************************************************
 * +++
 *************************************************************************/

// http://www.bancoob.com.br/atendimentocobranca/CAS/2_Implanta%C3%A7%C3%A3o_do_Servi%C3%A7o/Sistema_Proprio/DigitoVerificador.htm
// http://blog.inhosting.com.br/calculo-do-nosso-numero-no-boleto-bancoob-sicoob-do-boletophp/
// http://www.samuca.eti.br
// 
// http://www.bancoob.com.br/atendimentocobranca/CAS/2_Implanta%C3%A7%C3%A3o_do_Servi%C3%A7o/Sistema_Proprio/LinhaDigitavelCodicodeBarras.htm

// Contribuição de script por:
// 
// Samuel de L. Hantschel
// Site: www.samuca.eti.br
// 

if (!function_exists('formata_numdoc')) {
	function formata_numdoc($num, $tamanho)
	{
		while (strlen($num) < $tamanho) {
			$num = "0" . $num;
		}
		return $num;
	}
}

$IdDoSeuSistemaAutoIncremento = $boleto_config['auto_incremento']; // Deve informar um numero sequencial a ser passada a função abaixo, Até 6 dígitos
$agencia = $boleto_config['agencia']; // Num da agencia, sem digito
$conta = $boleto_config['conta']; // Num da conta, sem digito
$convenio = $boleto_config['convenio']; //Número do convênio indicado no frontend

$NossoNumero = formata_numdoc($IdDoSeuSistemaAutoIncremento, 7);
$qtde_nosso_numero = strlen($NossoNumero);
$sequencia = formata_numdoc($agencia, 4) . formata_numdoc(str_replace("-", "", $convenio), 10) . formata_numdoc($NossoNumero, 7);
$cont = 0;

$calculoDv = '';
for ($num = 1; $num <= strlen($sequencia); $num++) {
	$cont++;
	if ($cont == 1) {
		$constante = 3;
	}
	if ($cont == 2) {
		$constante = 1;
	}
	if ($cont == 3) {
		$constante = 9;
	}
	if ($cont == 4) {
		$constante = 7;
		$cont = 0;
	}

	$calculoDv = $calculoDv + (substr($sequencia, $num, 1) * $constante);
}

$Resto = $calculoDv % 11;

if ($Resto == 0 || $Resto == 1) {
	$Dv = 0;
} else {
	$Dv = 11 - $Resto;
}


$dadosboleto["nosso_numero"] = $NossoNumero . $Dv;

/*************************************************************************
 * +++
 *************************************************************************/



$dadosboleto["numero_documento"] = "0";	// Num do pedido ou do documento
$dadosboleto["data_vencimento"] = $data_venc; // Data de Vencimento do Boleto - REGRA: Formato DD/MM/AAAA
$dadosboleto["data_documento"] = date("d/m/Y"); // Data de emissão do Boleto
$dadosboleto["data_processamento"] = date("d/m/Y"); // Data de processamento do boleto (opcional)
$dadosboleto["valor_boleto"] = $valor_boleto; 	// Valor do Boleto - REGRA: Com vírgula e sempre com duas casas depois da virgula

// DADOS DO SEU CLIENTE
$dadosboleto["sacado"] = $_POST['sacado'];
$dadosboleto["endereco1"] = $_POST['endereco1'];
$dadosboleto["endereco2"] = $_POST['endereco2'];

// INFORMACOES PARA O CLIENTE
$dadosboleto["demonstrativo1"] = "Custeio mensal Conf.CCT - ref. 01/2021";
//$dadosboleto["demonstrativo2"] = "Apos vencimento cobrar juros de - R$ ".number_format($taxa_boleto, 2, ',', '');
//$dadosboleto["demonstrativo3"] = "BoletoPhp - http://www.boletophp.com.br";

// INSTRUÇÕES PARA O CAIXA
$dadosboleto["instrucoes1"] = "Apos vencimento cobrar juros de 2% + 0,33% ao dia";
//$dadosboleto["instrucoes2"] = "- Receber até 10 dias após o vencimento";
//$dadosboleto["instrucoes3"] = "- Em caso de dúvidas entre em contato conosco: xxxx@xxxx.com.br";
$dadosboleto["instrucoes4"] = "Sinduscon DF / STICOMBE DF";

// DADOS OPCIONAIS DE ACORDO COM O BANCO OU CLIENTE
$dadosboleto["quantidade"] = "";
$dadosboleto["valor_unitario"] = "";
$dadosboleto["aceite"] = "N";
$dadosboleto["especie"] = "R$";
$dadosboleto["especie_doc"] = "DM";


// ---------------------- DADOS FIXOS DE CONFIGURAÇÃO DO SEU BOLETO --------------- //
// DADOS ESPECIFICOS DO SICOOB
$dadosboleto["modalidade_cobranca"] = "01";
$dadosboleto["numero_parcela"] = "001";


// DADOS DA SUA CONTA - BANCO SICOOB
$dadosboleto["agencia"] = '3116'; // Num da agencia, sem digito
$dadosboleto["conta"] = $conta; // Num da conta, sem digito

// DADOS PERSONALIZADOS - SICOOB
$dadosboleto["convenio"] = $convenio; // Num do convênio - REGRA: No máximo 7 dígitos
$dadosboleto["carteira"] = "1";

// SEUS DADOS
$dadosboleto["identificacao"] = "";
$dadosboleto["cpf_cnpj"] = $_POST["cpf_cnpj"];
$dadosboleto["endereco"] = "";
$dadosboleto["cidade_uf"] = "";
$dadosboleto["cedente"] = $_POST["cedente"];
$dadosboleto["logo"] = $_POST["logo"];

// NÃO ALTERAR!
include("include/funcoes_bancoob.php");
include("include/layout_bancoob.php");

?>
