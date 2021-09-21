<?php
require_once "../vendor/autoload.php";
require_once 'conexao.php';
require_once 'conexao.class.php';

ini_set('display_errors', 1);
error_reporting(E_ALL);

date_default_timezone_set("Brazil/East"); // Brasil

function nfce($string)
{
    $string = mb_convert_encoding($string, "UTF-8");
    $string = str_replace('á','a',$string);
    $string = str_replace('Á','A',$string);
    $string = str_replace('à','a',$string);
    $string = str_replace('À','A',$string);
    $string = str_replace('â','a',$string);
    $string = str_replace('Â','A',$string);
    $string = str_replace('ã','a',$string);
    $string = str_replace('Ã','A',$string);
    $string = str_replace('ç','c',$string);
    $string = str_replace('Ç','C',$string);
    $string = str_replace('é','e',$string);
    $string = str_replace('É','E',$string);
    $string = str_replace('ê','e',$string);
    $string = str_replace('Ê','E',$string);
    $string = str_replace('è','e',$string);
    $string = str_replace('È','E',$string);
    $string = str_replace('í','i',$string);
    $string = str_replace('Í','I',$string);
    $string = str_replace('ó','o',$string);
    $string = str_replace('Ó','O',$string);
    $string = str_replace('ô','o',$string);
    $string = str_replace('Ô','O',$string);
    $string = str_replace('õ','o',$string);
    $string = str_replace('Õ','O',$string);
    $string = str_replace('ú','u',$string);
    $string = str_replace('Ú','U',$string);
    $string = str_replace('~','',$string);
    $string = str_replace('&','e',$string);
    $string = str_replace('.','',$string);
    $string = str_replace('-','',$string);
    $string = str_replace(',','',$string);
    $string = str_replace(';','',$string);
    $string = str_replace(':','',$string);
    $string = str_replace('(','',$string);
    $string = str_replace(')','',$string);
    $string = str_replace('/','',$string);

    return $string;
}
  
  
$pedido = $_GET['pedido'];

$connection = mysqli_connect(HOST, LOGIN, SENHA,BANCO);
$connection->set_charset("utf8mb4");

$query = "SELECT * FROM sma_sales WHERE id = '$pedido'";
$query_sale = mysqli_query($connection, $query);

$sales = mysqli_fetch_array($query_sale);
$row = mysqli_num_rows($query_sale);
$clienteid = $sales['customer_id'];

$query_customer = mysqli_query($connection, "SELECT * FROM sma_companies WHERE id = '$clienteid'");
$cliente = mysqli_fetch_array($query_customer);  
  
$query_psale = mysqli_query($connection, "SELECT * FROM sma_payments WHERE sale_id = '$pedido'");
$paymentsale = mysqli_fetch_array($query_psale);  

$query_settings = mysqli_query($connection, "SELECT * FROM sma_settings WHERE setting_id = 1");
$settings = mysqli_fetch_array($query_settings); 

$idpedido = $_GET['pedido'];

$nomecliente = nfce($cliente['name']);
$cpfcliente = nfce($cliente['vat_no']);
$enderecocliente = nfce($cliente['address']);
$numerocliente = nfce($cliente['cf2']);
$complementocliente = nfce($cliente['cf3']);
$bairrocliente = nfce($cliente['cf5']);
$cidadecliente = nfce($cliente['city']);
$estadocliente = nfce($cliente['state']);
$cepcliente = nfce($cliente['postal_code']);
$fonecliente = nfce($cliente['phone']);

$razao = nfce(EMPRESA);
$cnpj = nfce(CNPJ);
$ie = INSCRICAOESTADUAL;
$endereco = nfce(EMPRESA_ENDERECO);
$cidade = nfce(EMPRESA_CIDADE);
$estado = EMPRESA_UF;
$cep = nfce(EMPRESA_CEP);
$fone = str_replace(' ', '', nfce(EMPRESA_TEL));
$codmunicipio = EMPRESA_IBGE;

$totalvendas = $sales['total'];
//Monta DV 65
$cUF = '35';
$aamm = nfce(date('y/m')); 
$cnpj = nfce(CNPJ);
$mod='55';
$serie='001';
$num = $sales['id'];   
$tpEmis='1';     
$dv='';
$num = str_pad($num, 9, '0',STR_PAD_LEFT);
$cn = geraCN(8);
$chave = "$cUF$aamm$cnpj$mod$serie$num$tpEmis$cn";
$dv = calculaDV($chave);
$chave .= $dv;
$n = strlen($chave);

function icms($preco, $icms) {
    $valor = $preco; // valor original
    $percentual = $icms / 100.0; // 8%
    $valor_final = $valor - ($percentual * $valor);
    $creditoicms = $valor - $valor_final;

    return $creditoicms;
}

function geraCN($length=8){
    $numero = '';    
    for ($x=0; $x<$length; $x++){
        $numero .= rand(0,9);
    }
    return $numero;
}


function calculaDV($chave43) {
    $multiplicadores = array(2,3,4,5,6,7,8,9);
    $i = 42;
    $soma_ponderada = 0.0;
    while ($i >= 0) {
        for ($m=0; $m<count($multiplicadores) && $i>=0; $m++) {
            $soma_ponderada+= $chave43[$i] * $multiplicadores[$m];
            $i--;
        }
    }
    $resto = $soma_ponderada % 11;
    if ($resto == '0' || $resto == '1') {
        return 0;
    } else {
        return (11 - $resto);
   }
}

$datanfe = date('Y-m-d');
$horanfe = date('H:i:s');
$formatadata = $datanfe.'T'.$horanfe;

$claculoicmsnota = icms($totalvendas,7.60);
$claculopisnota = icms($totalvendas,1.65);

// Verifica se Existe
if($row >0) {
    // NFCE
    if($paymentsale['paid_by'] = 'cash') {
        $formapgto = "Dinheiro";
    } else {
        $formapgto = "Outros";
    }

    $digVal = base64_encode($idpedido);

    // Escrevendo XML
    $xml = '';
    $xml .= '<NFe xmlns="http://www.portalfiscal.inf.br/nfe">';
    $xml .= '<infNFe Id="NFe'.$chave.'" versao="4.00">';
    $xml .= "<ide>";
    $xml .= "<cUF>13</cUF>";
    $xml .= "<cNF>73987665</cNF>";
    $xml .= "<natOp>VENDA DE MERCADORIA</natOp>";
    $xml .= "<mod>55</mod>";
    $xml .= "<serie>1</serie>";
    $xml .= "<nNF>2</nNF>";  // Rever
    $xml .= "<dhEmi>$formatadata-02:00</dhEmi>";
    $xml .= "<tpNF>1</tpNF>";
    $xml .= "<idDest>1</idDest>";
    $xml .= "<cMunFG>$codmunicipio</cMunFG>";
    $xml .= "<tpImp>4</tpImp>";
    $xml .= "<tpEmis>1</tpEmis>";
    $xml .= "<cDV>8</cDV>";
    $xml .= "<tpAmb>2</tpAmb>";
    $xml .= "<finNFe>1</finNFe>";
    $xml .= "<indFinal>1</indFinal>";
    $xml .= "<indPres>1</indPres>";
    $xml .= "<procEmi>0</procEmi>";
    $xml .= "<verProc>V2.245</verProc>";
    $xml .= "</ide>";
    $xml .= "<emit>";
    $xml .= "<CNPJ>$cnpj</CNPJ>";
    $xml .= "<xNome>$razao</xNome>";
    $xml .= "<enderEmit>";
    $xml .= "<xLgr>$endereco</xLgr>";
    $xml .= "<nro>262</nro>";
    $xml .= "<xCpl>rua</xCpl>";
    $xml .= "<xBairro>belvedere</xBairro>";
    $xml .= "<cMun>$codmunicipio</cMun>";
    $xml .= "<xMun>$cidade</xMun>";
    $xml .= "<UF>$estado</UF>";
    $xml .= "<CEP>$cep</CEP>";
    $xml .= "<cPais>1058</cPais>";
    $xml .= "<xPais>Brasil</xPais>";
    $xml .= "<fone>$fone</fone>";
    $xml .= "</enderEmit>";
    $xml .= "<IE>$ie</IE>";
    $xml .= "<CRT>3</CRT>";
    $xml .= "</emit>";
    $xml .= "<dest>";
    $xml .= "<CPF>01234567890</CPF>";  // Rever
    $xml .= "<xNome>$nomecliente</xNome>";
    $xml .= "<enderDest>";
    $xml .= "<xLgr>$enderecocliente</xLgr>";
    $xml .= "<nro>000</nro>";  // Rever <nro>$numerocliente</nro>
    $xml .= "<xCpl>xxx</xCpl>"; // <xCpl>$complementocliente</xCpl>
    $xml .= "<xBairro>xxx</xBairro>";  // <xBairro>$bairrocliente</xBairro>
    $xml .= "<cMun>1302603</cMun>";
    $xml .= "<xMun>$cidadecliente</xMun>";
    $xml .= "<UF>$estadocliente</UF>";
    $xml .= "<CEP>12345678</CEP>";  // Rever <CEP>$cepcliente</CEP>
    $xml .= "<cPais>1058</cPais>";
    $xml .= "<xPais>BRASIL</xPais>";
    $xml .= "<fone>$fonecliente</fone>";
    $xml .= "</enderDest>";
    $xml .= "<indIEDest>1</indIEDest>";  // Rever
    $xml .= "<IE>6564344535</IE>";  // Rever
    $xml .= "</dest>";

    $z = 0;
    $query_bling = mysqli_query($connection, "SELECT * FROM sma_sales WHERE id = '$pedido'");
    while($bling = mysqli_fetch_array($query_bling)){
        $prdbling = mysqli_query($connection, "SELECT * FROM sma_sale_items WHERE sale_id = '".$bling['id']."'");
        $produtobling = mysqli_fetch_array($prdbling);

        $prdsbb = mysqli_query($connection, "SELECT * FROM sma_products WHERE id = '".$produtobling['product_id']."'");
        $prds = mysqli_fetch_array($prdsbb);

        $z++;
        $ncm = $prds['cf3'];
        $ean = $prds['code'];
        $nomeproduto = nfce($produtobling['product_name']);
        $preco = round(floatval($produtobling['unit_price']), 2);

        $uTrib = nfce($prds['unit']);
        $pisproduto = round(icms($preco, 1.65), 2);
        $icmsproduto = round(icms($preco,7.60), 2);

        $xml .= "<det nItem='$z'>";
        $xml .= "<prod>";
        $xml .= "<cProd>$ean</cProd>";
        $xml .= "<cEAN/>";
        $xml .= "<xProd>$nomeproduto</xProd>";
        $xml .= "<NCM>00</NCM>";  // Rever <NCM>$ncm</NCM>
        $xml .= "<CFOP>5405</CFOP>";
        $xml .= "<uCom>$uTrib</uCom>";
        $xml .= "<qCom>1.0000</qCom>";
        $xml .= "<vUnCom>$preco</vUnCom>";
        $xml .= "<vProd>$preco</vProd>";
        $xml .= "<cEANTrib/>";
        $xml .= "<uTrib>$uTrib</uTrib>";
        $xml .= "<qTrib>1.0000</qTrib>";
        $xml .= "<vUnTrib>$preco</vUnTrib>";
        $xml .= "<indTot>1</indTot>";
        $xml .= "</prod>";
        $xml .= "<imposto>";
        $xml .= "<ICMS>";
        $xml .= "<ICMS00>";
        $xml .= "<orig>0</orig>";
        $xml .= "<CST>00</CST>";
        $xml .= "<modBC>0</modBC>";
        $xml .= "<vBC>0.00</vBC>";
        $xml .= "<pICMS>18.0000</pICMS>";
		$xml .= "<vICMS>0.04</vICMS>";
        $xml .= "</ICMS00>";
        $xml .= "</ICMS>";
        $xml .= "<PIS>";
        $xml .= "<PISAliq>";
        $xml .= "<CST>01</CST>";
        $xml .= "<vBC>$preco</vBC>";
        $xml .= "<pPIS>0.65</pPIS>";
        $xml .= "<vPIS>$pisproduto</vPIS>";
        $xml .= "</PISAliq>";
        $xml .= "</PIS>";
        $xml .= "<COFINS>";
        $xml .= "<COFINSAliq>";
        $xml .= "<CST>01</CST>";
        $xml .= "<vBC>$preco</vBC>";
        $xml .= "<pCOFINS>7.60</pCOFINS>";
        $xml .= "<vCOFINS>$icmsproduto</vCOFINS>";
        $xml .= "</COFINSAliq>";
        $xml .= "</COFINS>";
        $xml .= "</imposto>";
        $xml .= "</det>";
    }

    $xml .= "<total>";
    $xml .= "<ICMSTot>";
    /*
    $xml .= "<vBC>0.00</vBC>";
    $xml .= "<vICMS>0.00</vICMS>";
    $xml .= "<vST>0.00</vST>";
    $xml .= "<vProd>$totalvendas</vProd>";
    $xml .= "<vFrete>0.00</vFrete>";
    $xml .= "<vSeg>0.00</vSeg>";
    $xml .= "<vDesc>0.00</vDesc>";
    $xml .= "<vII>0.00</vII>";
    $xml .= "<vIPI>0.00</vIPI>";
    $xml .= "<vPIS>$claculopisnota</vPIS>";
    $xml .= "<vCOFINS>$claculoicmsnota</vCOFINS>";
    $xml .= "<vOutro>0.00</vOutro>";
    $xml .= "<vNF>$totalvendas</vNF>";
    */
    $xml .= "<vBC>0.20</vBC>";
    $xml .= "<vICMS>0.04</vICMS>";
    $xml .= "<vICMSDeson>0.00</vICMSDeson>";
    $xml .= "<vFCP>0.00</vFCP>";
    $xml .= "<vBCST>0.00</vBCST>";
    $xml .= "<vST>0.00</vST>";
    $xml .= "<vFCPST>0.00</vFCPST>";
    $xml .= "<vFCPSTRet>0.00</vFCPSTRet>";
    $xml .= "<vProd>10.99</vProd>";
    $xml .= "<vFrete>0.00</vFrete>";
    $xml .= "<vSeg>0.00</vSeg>";
    $xml .= "<vDesc>0.00</vDesc>";
    $xml .= "<vII>0.00</vII>";
    $xml .= "<vIPI>0.00</vIPI>";
    $xml .= "<vIPIDevol>0.00</vIPIDevol>";
    $xml .= "<vPIS>0.00</vPIS>";
    $xml .= "<vCOFINS>0.00</vCOFINS>";
    $xml .= "<vOutro>0.00</vOutro>";
    $xml .= "<vNF>11.03</vNF>";
    $xml .= "<vTotTrib>10.99</vTotTrib>";
    $xml .= "</ICMSTot>";
    $xml .= "</total>";
    $xml .= "<transp>";
    $xml .= "<modFrete>9</modFrete>";
    $xml .= "</transp>";
    $xml .= "<pag>";
    $xml .= "<detPag>";
    $xml .= "<indPag>0</indPag>";
    $xml .= "<tPag>01</tPag>";
    $xml .= "<vPag>100.00</vPag>";
    $xml .= "</detPag>";
    $xml .= "</pag>";
    $xml .= "</infNFe>";
    $xml .= "</NFe>";

    $config = [
        "atualizacao" => "2018-02-06 06:01:21",
        "tpAmb" => 2, // Se deixar o tpAmb como 2 você emitirá a nota em ambiente de homologação(teste) e as notas fiscais aqui não tem valor fiscal
        "razaosocial" => "ALLIANCE TECNOLOGIA E DESENVOLVIMENTO DE SISTEMAS",
        "siglaUF" => "MG",
        "cnpj" => "36665277000180",
        "schemes" => "PL_008i2",
        "versao" => "4.00",
        "tokenIBPT" => "AAAAAAA"
    ];
    $configJson = json_encode($config);

    $certificadoDigital = file_get_contents('certificados/6b86b273ff34.pfx');

    $tools = new NFePHP\NFe\Tools($configJson,NFePHP\Common\Certificate::readPfx($certificadoDigital, $settings['certificate_password']));
    $xmlAssinado = $tools->signNFe($xml); // O conteúdo do XML assinado fica armazenado na variável $xmlAssinado

    $arquivo = "xml/nfe$chave.xml";
    $ponteiro = fopen($arquivo, "w");
    fwrite($ponteiro, $xmlAssinado);
    fclose($ponteiro);

} // Fecha IF($row)


?>
<script>
alert('NFe Gerado - Ambiente Teste Sem Certificado Digital');
document.location.href = ("libs/DanfeNFe.php?nfe=nfe<?php echo $chave; ?>.xml");
</script>
