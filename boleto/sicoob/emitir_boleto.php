<Html lang="pt-br">

<head>
    <meta charset="utf-8">
    <title>Gerar Boleto</title>
    <link rel="stylesheet" href="css\style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/jquery.mask.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#data_venc').mask('00/00/0000');
            $('#valor_cobrado').mask("#.##0,00", {
                reverse: true
            });
        })
    </script>
</head>

<body>

    <div class="container mt-5">
        <table>
            <tr>
                <th>Gerar Boleto</th>
            </tr>
            <form class="offset-md-3 col-md-6" action="boleto_bancoob.php" method="POST">
                <tr>
                    <th><input type="text" name="data_venc" id="data_venc" placeholder="00/00/0000" class="form-control" required></th>
                </tr>
                <tr>
                    <th><input type="text" name="valor_cobrado" id="valor_cobrado" placeholder="Valor R$" class="form-control" required></th>
                </tr>
                <tr>
                    <th><input type="text" name="sacado" id="sacado" placeholder="Cliente" class="form-control" required></th>
                </tr>
                <tr>
                    <th><input type="text" name="endereco1" id="endereco1" placeholder="Endereço" class="form-control" required></th>
                </tr>
                <tr>
                    <th><input type="text" name="endereco2" id="endereco2" placeholder="Cidade - Estado - CEP" class="form-control" required></th>
                </tr>
                <tr>
                    <th><button type="submit" class="btn btn-success btn-lg btn-block">Gerar</button><button type="reset" class="btn btn-warning btn-lg btn-block">Reset</button></th>
                </tr>
            </form>
        </table>
    </div>
</body>

</Html>