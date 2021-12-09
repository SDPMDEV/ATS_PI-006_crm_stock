<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<div class="container">
    <div>
        <h1>Cadastrar Emitente Fiscal</h1>

        <?php if($message) { ?>
            <div class="alert alert-danger" role="alert">
                <?= $message ?>

                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true" style="color: #000">&times;</span>
                </button>
            </div>
        <?php } ?>
        <hr>
    </div>  
    <div>
        <?php if($configs->certificado) {?>
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Certificado</legend>
                <div class="form-control" style="display: flex; flex-direction: column; height: auto">
                    <span>Serial Certificado: <b><?= $configs->infoCerfificado->serial ?></b></span>
                    <span>Inicio: <b><?= $configs->infoCerfificado->inicio ?></b></span>
                    <span>Expiração: <b><?= $configs->infoCerfificado->expiracao ?></b></span>
                    <span>IDCTX: <b><?= $configs->infoCerfificado->id ?></b></span>
                </div>

                <div style="margin-top: 15px"> 
                    <button class="btn btn-danger" onclick="deleteCertificate()">Remover certificado</button>
                    <button class="btn btn-success" onclick="testCertificate()">Testar ambiente</button>
                </div>
            </fieldset>
            
        <?php } else { ?>

            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Certificado</legend>
                <div>
                    <b style="color: red">VOCE AINDA NÃO FEZ UPLOAD DO CERTIFICADO ATÉ O MOMENTO</b>
                    <br><br>
                    <button data-toggle="modal" data-target="#uploadModal" class="btn btn-info">Fazer upload agora</button>
                </div>
            </fieldset>

            <!-- Modal -->
            <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadModalLabel">Upload de certificado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="certificado-form" enctype="multipart/form-data">

                        <span>
                            Arquivo: 
                            <input required accept=".bin, .pfx" name="file" type="file" id="certificate_file" style="margin: 15px 0;">
                        </span>
                        <span>
                            Senha: 
                            <input required id="senha_certificado" type="password" class="form-control " name="senha">
                        </span>

                        <input type="hidden" name="ajax" value="1">
                        <input required type="hidden" id="csrf" name="<?= $this->security->get_csrf_token_name() ?>" value="<?= $this->security->get_csrf_hash() ?>">
                        <input required type="hidden" name="api_url" value="/save_certificate">
                        <input required type="hidden" id="api_token" name="api_token" value="<?= $token ?>">

                        <div style="margin-top: 20px; text-align: right;">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                            <button type="submit" class="btn btn-success">Salvar</button>
                        </div>
                    </form>

                    <b style="color: red" id="b-tentativas"></b></span>
                </div>
                </div>
            </div>
            </div>
        <?php }?>

        <form method="POST" id="form" enctype="multipart/form-data">
            <input type="hidden" name="ajax" value="1">
            <input required type="hidden" name="api_token" value="<?= $token ?>">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Informações básicas</legend>

                <div class="col-md-4">
                    <div class="form-group">
                        <b>Razão Social</b>                    
                        <input class="form-control tip" required type="text" value="<?= $props->razao_social ?>" name="razao_social">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <b>Nome Fantasia</b>
                        <input class="form-control tip" required type="text" value="<?= $props->nome_fantasia ?>" name="nome_fantasia">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <b>CNPJ</b>
                        <input class="form-control tip" required type="text" value="<?= $props->cnpj ?>" id="cnpj" name="cnpj" maxlength="18">
                    </div>
                </div>
            </fieldset>

            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Endereço</legend>
                <div class="col-md-4">
                    <div class="form-group">
                        <span>Razão Social</span>
                        <input class="form-control" required type="text" value="<?= $props->ie ?>" name="ie">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Logradouro</span>
                        <input class="form-control" required type="text" value="<?= $props->logradouro ?>" name="logradouro">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Nº</span>
                        <input class="form-control" required type="text" value="<?= $props->numero ?>" name="numero">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Bairro</span>
                        <input class="form-control" required type="text" value="<?= $props->bairro ?>" name="bairro">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>CEP</span>
                        <input class="form-control" required type="text" value="<?= $props->cep ?>" name="cep" id="cep">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Município</span>
                        <input class="form-control" required type="text" value="<?= $props->municipio ?>" name="municipio">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Codigo do Municipio</span>
                        <input class="form-control" required type="text" value="<?= $props->codMun ?>" name="codMun">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>UF</span>
                        <select class="form-control" required  name="UF" id="uf">
                            <option value="<?= $props->cUF ?>"><?= $props->UF ?></option>

                            <?php foreach($configs->estados as $estado_value => $estado) {?>
                                <option value="<?= $estado_value ?>"><?= $estado ?></option>
                            <?php }?>

                        </select>
                    </div>
                </div>
                                    

                <div class="col-md-4">
                    <div class="form-group">
                        <span>País</span>
                        <input class="form-control" required type="text" placeholder="BRASIL" value="<?= $props->pais ?>" name="pais">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Codigo do País</span>
                        <input class="form-control" required type="text" value="<?= $props->codPais ?>" name="codPais">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Telefone</span>
                        <input class="form-control" required type="text" value="<?= $props->fone ?>" name="fone" id="telefone">
                    </div>
                </div>
            </fieldset>
            
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">CST</legend>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>CST/CSOSN Padrão</span>
                        <select required name="CST_CSOSN_padrao" class="form-control">
                            <?php foreach($configs->listaCSTCSOSN as $value_cstcsosn => $cstcsosn) {?>
                                <?php if($value_cstcsosn == $props->CST_CSOSN_padrao) { ?>
                                    <option value="<?= $props->CST_CSOSN_padrao ?>">
                                        <?= $cstcsosn ?>
                                    </option>
                                <?php } ?>
                            <?php } ?>

                            <?php foreach($configs->listaCSTCSOSN as $value_cstcsosn => $cstcsosn) {?>
                                <option value="<?= $value_cstcsosn ?>"><?= $cstcsosn ?></option>
                            <?php }?>
                        </select>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="form-group">
                        <span>CST/PIS Padrão</span>
                        <select required name="CST_PIS_padrao" class="form-control">
                            <?php foreach($configs->listaCSTPISCOFINS as $value_cstpis => $cstpis) {?>
                                <?php if($props->CST_PIS_padrao == $value_cstpis) {?>
                                    <option value="<?= $props->CST_PIS_padrao ?>"><?= $cstpis ?></option>
                                <?php }?>
                            <?php }?>

                            <?php foreach($configs->listaCSTPISCOFINS as $value_cstpis => $cstpis) {?>
                                <option value="<?= $value_cstpis ?>"><?= $cstpis ?></option>
                            <?php }?>
                        </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>CST/COFINS Padrão</span>
                        <select required name="CST_COFINS_padrao" class="form-control">
                            <?php foreach($configs->listaCSTPISCOFINS as $value_cstpiscofins => $cstpiscofins) {?>
                                <?php if($value_cstpiscofins == $props->CST_COFINS_padrao){?>
                                    <option value="<?= $value_cstpiscofins ?>">
                                        <?= $cstpiscofins ?>
                                    </option>
                                <?php }?>
                            <?php }?>


                            <?php foreach($configs->listaCSTPISCOFINS as $value_cstpiscofins => $cstpiscofins) {?>
                                <option value="<?= $value_cstpiscofins ?>"><?= $cstpiscofins ?></option>
                            <?php }?>
                        </select>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="form-group">
                        <span>CST/IPI Padrão</span>
                        <select required name="CST_IPI_padrao" class="form-control">                        
                            <?php foreach($configs->listaCSTIPI as $value_cstipi => $cstipi) {?>
                                <?php if($props->CST_IPI_padrao == $value_cstipi) {?>
                                    <option value="<?= $props->CST_IPI_padrao ?>">
                                        <?= $cstipi ?>
                                    </option>
                                <?php }?>
                            <?php }?>

                            <?php foreach($configs->listaCSTIPI as $value_cstipi => $cstipi) {?>
                                <option value="<?= $value_cstipi ?>"><?= $cstipi ?></option>
                            <?php }?>
                        </select>
                    </div>
                </div>
            </fieldset>
            
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Informações avançadas</legend>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Frete Padrão</span>
                        <select required name="frete_padrao" class="form-control">                        
                            <?php foreach($configs->tiposFrete as $value_frete => $frete) {?>
                                <?php if($value_frete == $props->frete_padrao) {?>
                                <option value="<?= $props->frete_padrao ?>">
                                    <?= $frete ?>
                                </option>
                                <?php }?>
                            <?php }?>

                            <?php foreach($configs->tiposFrete as $value_frete => $frete) {?>
                                <option value="<?= $value_frete ?>"><?= $frete ?></option>
                            <?php }?>
                        </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Tipo de pagamento Padrão</span>
                        <select required name="tipo_pagamento_padrao" class="form-control">
                            <?php foreach($configs->tiposPagamento as $value_pagamento => $pagamento) {?>
                                <?php if($value_pagamento == $props->tipo_pagamento_padrao) {?>
                                    <option value="<?= $value_pagamento ?>"><?= $pagamento ?></option>
                                <?php }?>
                            <?php }?>


                            <?php foreach($configs->tiposPagamento as $value_pagamento => $pagamento) {?>
                                <option value="<?= $value_pagamento ?>"><?= $pagamento ?></option>
                            <?php }?>

                        </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Natureza de Operação Padrão Frente de Caixa</span>
                        <select required name="nat_op_padrao" class="form-control">                
                            <?php foreach($configs->naturezas as $value_natureza => $natureza) {?>
                                <?php if($natureza->id == $props->nat_op_padrao) {?>
                                    <option value="<?= $value_natureza?>"><?= $natureza->natureza ?></option>
                                <?php }?>
                            <?php }?>

                            <?php foreach($configs->naturezas as $value_natureza => $natureza) {?>
                                <option value="<?= $value_natureza?>"><?= $natureza->natureza ?></option>
                            <?php }?>
                        </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Ambiente</span>
                        <select required name="ambiente" class="form-control">
                            <option value="1">Produção</option>
                            <option value="2">Homologação</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Nº Serie NF-e</span>
                        <input class="form-control" required name="numero_serie_nfe" type="text" value="<?= $props->numero_serie_nfe ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Nº Serie NFC-e</span>
                            <input class="form-control" required name="numero_serie_nfce" type="text" value="<?= $props->numero_serie_nfce ?>">
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="form-group">
                        <span>Ultimo Nº NF-e</span>
                        <input class="form-control" required name="ultimo_numero_nfe" type="text" value="<?= $props->ultimo_numero_nfe ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Ultimo Nº NFC-e'</span>
                        <input class="form-control" required name="ultimo_numero_nfce" type="text" value="<?= $props->ultimo_numero_nfce ?>">
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="form-group">
                        <span>Ultimo Nº CT-e</span>
                        <input class="form-control" required name="ultimo_numero_cte" type="text" value="<?= $props->ultimo_numero_cte ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Ultimo Nº MDF-e</span>
                        <input class="form-control" required name="ultimo_numero_mdfe" type="text" value="<?= $props->ultimo_numero_mdfe ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>CSC</span>
                        <input class="form-control" required name="csc" type="text" value="<?= $props->csc ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>CSCID</span>
                        <input class="form-control" required name="csc_id" type="text" value="<?= $props->csc_id ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span class="certificado">
                            <b style="color: red;">*Em desenvolvimento</b><br>
                            <span>Certificado A3</span>
                            <input class="form-control" name="certificado_a3" type="checkbox" value="<?= $props->certificado_a3 ?>">
                        </span>
                    </div>
                </div>
            </fieldset>

            <input required type="hidden" name="<?= $this->security->get_csrf_token_name() ?>" value="<?= $this->security->get_csrf_hash() ?>">
            <input required type="hidden" name="api_url" value="/save_issuer">
            </div>

            <hr>
            
            <div style="margin-bottom: 15px">
                <input type="submit" class="btn btn-success" value="Salvar">
                <input type="button" value="Cancelar" class="btn btn-danger" onclick="window.history.back();">
            </div>
        </form>
    </div>
</div>

<div id="modalCertificateInfo" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="modal-certificate-info"></div>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.7-beta.29/jquery.inputmask.min.js" integrity="sha512-Ax4+qW2rAVWrk3SU1ef/L8O0jF6vKSfaMIR3du6efzf5v/pibzDcLFx29YCeR7WphoPO4zranQFsFUf+9Rb+dg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    function getFormData($form){
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function(n, i){
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    function validateForm(formData)
    {
        Object.keys(formData).forEach(key => {
            if(formData[key] == "") {
                console.log(key)
                return false;
            }
        });

        return true;
    }


    $("#form").submit(function(e) {
        e.preventDefault();

        let data = getFormData($("#form"));
        if(!validateForm(data)) {
            toastr.warning('Preencha todos os campos corretamente para prosseguir', 'Atenção');
            return false;
        }

        $.post("/validate/request", data).then(res =>{
            if(!res.error) {
                toastr.success(res.message, 'Sucesso');
            } else {
                toastr.error(res.message, 'Erro');
            }
        }).fail(err=>{
            toastr.error('Erro no lado do servidor', 'Erro');
            console.error(err.responseText);
        })
    });

    $("#certificado-form").submit(function(e){
        e.preventDefault();


        let dataTentativas = new FormData(this);
        //verifica as tentativas
        $.ajax({
            url: "<?= $remote_url ?>/get_certificate_status",
            type: 'POST',
            data: dataTentativas,
            cache: false,
            contentType: false,
            processData: false
        }).then(res =>{
            if( res.tentativas >= 3 ) {
                $("#b-tentativas").html(`Limite de tentativas excedido.`);
            }
        }).fail(err=>{
            toastr.error('Erro no lado do servidor', 'Erro');
            console.error(err.responseText);
        });


        let dataSalvar = new FormData(this);
        //salva o certificado
        $.ajax({
            url: "<?= $remote_url ?>/save_certificate",
            type: 'POST',
            data: dataSalvar,
            cache: false,
            contentType: false,
            processData: false
        }).then(res =>{
            console.log(res);
            if(!res.error) {
                toastr.success(res.message, 'Sucesso');
                location.reload();
            } else {
                if(res.type == "warning") {
                    toastr.warning(res.message, 'Erro');
                } else {
                    toastr.error(res.message, 'Erro');
                }
            }
        }).fail(err=>{
            toastr.error('Erro no lado do servidor', 'Erro');
            console.error(err.responseText);
        });
    });
    
    function deleteCertificate()
    {
        bootbox.confirm({
            message: "Você tem certeza que deseja remover o certificado?", 
            buttons: {
                confirm: {
                    label: 'Remover',
                    className: 'btn-danger'
                },
                cancel: {
                    label: 'Cancelar',
                    className: 'btn-secondary'
                }
            },
            callback: function(result){ 
                if(result) {
                    $.post("<?= $remote_url ?>/delete_certificate", {api_token: $("#api_token").val() }).then(res=>{
                        if(!res.error) {
                            toastr.success(res.message, 'Sucesso');
                            location.reload();
                        } else {
                            toastr.error(res.message, 'Erro');
                        }
                    }).fail(err=>{
                        toastr.error('Erro no lado do servidor', 'Erro');
                        console.error(err.responseText);
                    });
                }
            }
        });
    }

    function testCertificate()
    {
        $.post("<?= $remote_url ?>/test_certificate", { api_token: $("#api_token").val() }).fail(res=>{
            toastr.success("Certificado OK", "Sucesso");
            $("#modal-certificate-info").html("<code><pre>"+res.responseText+"</pre></code>");
            $('#modalCertificateInfo').modal('show');
        });
    }



    $(":input").inputmask();

    $("#cnpj").inputmask({"mask": "99.999.999/9999-99"});
    $("#telefone").inputmask({"mask": "(99) 99999-9999"});
    $('#cep').inputmask({"mask": "99999-999"});
</script>