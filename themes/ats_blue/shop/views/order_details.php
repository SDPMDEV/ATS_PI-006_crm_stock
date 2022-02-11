<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<section class="page-contents">
    <div class="container" style="background: #fff; padding: 20px">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-12">
                <h2>Detalhes da venda: </h2>
                <hr>
            </div>
            <div class="col-md-6">
                <strong style="font-size: 17px;">Produtos: </strong>
                <br><br>
                <div class="table-responsive">
                    <table class="table" style="border: 1px solid #000">
                        <tr style="background: #283b87; color: #fff">
                            <th>Nome</th>
                            <th style="text-align: center">Quantidade</th>
                            <th style="text-align: center">Valor</th>
                        </tr>

                        <?php foreach($mercado_pago->additional_info->items as $product) { ?>
                            <tr>
                                <td><?= $product->title ?></td>
                                <td style="text-align: center"><?= $product->quantity ?></td>
                                <td style="text-align: center">R$ <?= $product->unit_price ?></td>
                            </tr>
                        <?php } ?>

                        <tr style="background: #283b87; color: #fff">
                            <td style="text-align: center">TOTAL</td>
                            <td></td>
                            <td style="text-align: center">R$ <?= $mercado_pago->transaction_details->total_paid_amount ?></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-6">
                <strong style="font-size: 17px;">Detalhes extras: </strong>
                <br><br>
                <p>Número de identificação: <strong><?= $mercado_pago->id ?></strong></p>
                <p>Descrição: <strong><?= $mercado_pago->description ?></strong></p>
                <p>Email comprador: <strong><?= $mercado_pago->payer->email ?></strong></p>
                <p>Expira em: <strong><?= date_format(date_create($mercado_pago->date_to_expire),"d/m/Y") ?></strong></p>
                <p>Método de pagamento: <strong><?= strtoupper($mercado_pago->payment_method_id) ?></strong></p>
                <p>Nº de parcelas: <strong><?= $mercado_pago->installments ?></strong></p>
                <p>
                    Status do pagamento:
                    <strong>
                        <?= lang($mercado_pago->status_detail) ?> (<?= strtolower(lang($mercado_pago->status)) ?>)
                    </strong>
                </p>

                <?php if($mercado_pago->payment_method_id == "pix" && $mercado_pago->status == "pending") { ?>
                    <hr>
                    <div>
                        <strong style="font-size: 17px">Efetuar Pagamento</strong>
                        <br><br>
                        <span>Valor do Pix a pagar: <strong style="color: #059960">R$ <?= $mercado_pago->transaction_details->total_paid_amount ?></strong></span>
                        <hr>
                        <div style="text-align: center">
                            <img src="data:image/jpeg;base64,<?= $mercado_pago->point_of_interaction->transaction_data->qr_code_base64 ?>"
                                 alt="<?= $mercado_pago->point_of_interaction->transaction_data->qr_code ?>"
                                 width="250"
                                 height="250"
                            >
                            <br><br>
                            <span>Ou, copie e cole o código abaixo:</span>
                            <br><br>
                            <input type="text" id="code_to_copy" style="padding: 10px;
                                border-radius: 10px;
                                width: 100%;
                                overflow: hidden;
                                border: 2px dashed #ced1e2;
                                text-overflow: '----';
                                white-space: nowrap;
                                display: flex;
                                flex-direction: row;"
                               readonly
                               value="<?= $mercado_pago->point_of_interaction->transaction_data->qr_code ?>"
                            />
                            <br>
                            <input type="button" value="Copiar código" class="btn btn-info btn-block" onclick="copyToClipboard()">
                        </div>
                    </div>
                <?php } ?>

                <?php if(!empty( (array)$mercado_pago->card )) { ?>
                        <p>Últimos 4 dígitos do cartão: <strong><?= $mercado_pago->card->last_four_digits ?></strong></p>
                        <p>Titular do cartão: <strong><?= $mercado_pago->card->cardholder->name ?></strong></p>
                        <p><?= $mercado_pago->card->cardholder->identification->type ?>: <strong><?= $mercado_pago->card->cardholder->identification->number ?></strong></p>
                <?php } ?>
            </div>

            <div class="col-md-12">
                <?php if($mercado_pago->status == "approved") { ?>
                    <div class="alert alert-success">
                        O pagamento foi aprovado e credenciado.
                    </div>
                <?php }?>
            </div>
        </div>
    </div>
</div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    const copyToClipboard = () => {
        let copyText = document.querySelector("#code_to_copy");

        copyText.select();
        copyText.setSelectionRange(0, 99999);

        navigator.clipboard.writeText(copyText.value);

        toastr.success('Copiado para área de transferência.');
    }
</script>

