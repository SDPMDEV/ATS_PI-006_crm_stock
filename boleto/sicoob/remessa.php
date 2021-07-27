<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Gerar remessa</title>
	<link rel="stylesheet" href="css\style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/jquery.mask.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$('#data_vencimento').mask('0000-00-00');
			//$('#data_emissao').mask('0000-00-00');
			$('#valor').mask("#.##0.00", {
				reverse: true
			});
			$('#numero_inscricao').mask('00.000.000/0000-00');
			$('#cep_pagador').mask('00000-000');
			$('#uf_pagador').mask('SS', {
				translation: {
					'SS': {
						pattern: /[A-Z]/
					}
				}
			})
		})
	</script>
</head>

<body>
	<div class="container mt-5">
		<table>
			<tr>
				<th>Gerar Remessa</th>
			</tr>

			<form class="offset-md-3 col-md-6" action="vendor/quilhasoft/opencnabphp/samples/ExemploRemessaSICOOB.php" method="POST">


				<tr>
					<th>Dados do boleto</th>
				</tr>

				<!-- <tr>
					<th><input type="date" name="data_emissao" id="data_emissao" placeholder="Emissão" > => Emissão</th>
				</tr> -->

				<tr>
					<th><input type="date" name="data_vencimento" id="data_vencimento" placeholder="Vencimento"> => Vencimento</th>
				</tr>

				<tr>
					<th><input type="hidden" name="data_juros" id="data_juros" placeholder="Data de Juros"></th>
				</tr>

				<tr>
					<th><input type="hidden" name="data_multa" id="data_multa" placeholder="Data de multa"></th>
				</tr>

				<tr>
					<th><input type="text" name="valor" id="valor" placeholder="valor"></th>
				</tr>

				<!-- <tr>
					<th><input type="text" name="seu_numero" id="seu_numero" placeholder="Seu número"></th>
				</tr> -->



				


				<tr>
					<th>Dados do Pagador</th>
				</tr>

				<tr>
					<th><input type="text" name="numero_inscricao" id="numero_inscricao" placeholder="Inscrição"></th>
				</tr>

				<tr>
					<th><input type="text" name="nome_pagador" id="nome_pagador" placeholder="Pagador"></th>
				</tr>

				<tr>
					<th><input type="text" name="endereco_pagador" id="endereco_pagador" placeholder="Endereço"></th>
				</tr>

				<tr>
					<th><input type="text" name="bairro_pagador" id="bairro_pagador" placeholder="Bairro"></th>
				</tr>

				<tr>
					<th><input type="text" name="cep_pagador" id="cep_pagador" placeholder="CEP"></th>
				</tr>

				<tr>
					<th><input type="text" name="cidade_pagador" id="cidade_pagador" placeholder="Cidade"></th>
				</tr>

				<tr>
					<th><input type="text" name="uf_pagador" id="uf_pagador" placeholder="UF"></th>
				</tr>

				<!-- <tr>
					<th>Instruções</th>
				</tr>

				<tr>
					<th><input type="text" name="mensagem_sc_1" id="mensagem_sc_1" placeholder="Instrução 1"></th>
				</tr>
				<tr>
					<th><input type="text" name="mensagem_sc_2" id="mensagem_sc_2" placeholder="Instrução 2"></th>
				</tr>
				<tr>
					<th><input type="text" name="mensagem_sc_3" id="mensagem_sc_3" placeholder="Instrução 3"></th>
				</tr>
				<tr>
					<th><input type="text" name="mensagem_sc_4" id="mensagem_sc_4" placeholder="Instrução 4"></th>
				</tr> -->

				<tr>
					<th><button type="submit" class="btn btn-success btn-lg btn-block">Gerar</button><button type="reset" class="btn btn-warning btn-lg btn-block">Reset</button></th>
				</tr>

			</form>
		</table>
	</div>
</body>

</html>