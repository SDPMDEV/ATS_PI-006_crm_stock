<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="/assets/packages/jquery-ui/jquery-ui.css">
<style>
    #upload_retorno {
        display: none;
    }

    .cards-container {
        display: flex;
        flex-wrap: wrap;
    }

    .card {
        padding: 10px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        width: 20rem;
        height: 11rem;
        cursor: pointer;
        transition: 0.3s;
    }

    .card:hover {
        background: #4db7ff;
        transition: 0.3s;
    }
    
    .card-title {
        font-size: 15px;
    }

    .card-text {
        text-align: right;
        font-weight: bold;
    }
</style>
<div class="container" id="app">
    <div class="col-md-6" style="margin-top: 50px">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Chave Sicoob</legend>

            <div class="col-md-12">
                <form id="sicoob_form" class="form">
                    <div class="form-group">
                        <label for="sicoob_key">Chave de acesso</label>
                        <input type="text" name="sicoob_key" id="sicoob_key" class="form-control" value="<?= $sicoob_key ?>">
                    </div>

                    <div class="form-gruop text-right">
                        <input type="submit" value="Salvar Chave" class="btn btn-info" style="width: 120px">
                    </div>
                </form>
            </div>
        </fieldset>
    </div>

    <div class="col-md-12">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Configurações do boleto</legend>

            <form id="boleto_configs" class="form" method="POST" action="<?= admin_url("system_settings/save_sicoob_configs") ?>">
                <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>">

                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="agencia">Agencia</label>
                            <input type="text" id="agencia" name="agencia" class="form-control" value="<?= $configs->agencia ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="conta">Conta</label>
                            <input type="text" id="conta" name="conta" class="form-control" value="<?= $configs->conta ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="convenio">Convenio</label>
                            <input type="text" id="convenio" name="convenio" class="form-control" value="<?= $configs->convenio ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="mora_multa">Valor de multa mora (%)</label>
                            <input type="text" id="mora_multa" name="mora_multa" class="form-control" value="<?= $configs->multa_mora ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="desconto">Desconto Opcional (%)</label>
                            <input type="text" id="desconto" name="desconto" class="form-control" value="<?= $configs->desc_opcional ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="outro_acrescimo">Acrescimo Opcional (%)</label>
                            <input type="text" id="outro_acrescimo" name="outro_acrescimo" class="form-control" value="<?= $configs->acres_opcional ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="deducoes">Outras Deduções (R$)</label>
                            <input type="text" id="deducoes" name="deducoes" class="form-control" value="<?= $configs->deducoes ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="especie">Espécie do documento</label>
                            <select name="especie" id="especie" class="form-control">
                                <?php foreach ($especies as $index => $item) { ?>
                                    <?php if ($index == $configs->especie) { ?>
                                        <option value="<?= $index ?>">
                                            <?= $item ?>
                                        </option>
                                    <?php } ?>
                                <?php }?>

                                <?php foreach ($especies as $index => $item) { ?>
                                    <option value="<?= $index ?>">
                                        <?= $item ?>
                                    </option>
                                <?php }?>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="agencia_dv">Digito verificador da agência</label>
                            <input type="text" name="agencia_dv" value="<?= $configs->agencia_dv ?>" id="agencia_dv" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="conta_dv">Digito verificador da conta</label>
                            <input type="text" name="conta_dv" value="<?= $configs->conta_dv ?>" id="conta_dv" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="codigo_beneficiario">Código de beneficiário</label>
                            <input type="text" name="codigo_beneficiario" value="<?= $configs->codigo_beneficiario ?>" id="codigo_beneficiario" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="codigo_carteira">Código da carteira</label>
                            <select name="codigo_carteira" id="codigo_carteira" class="form-control">
                                <option value="1">Simples Com Registro</option>
                                <option value="2">Simples Sem Registro</option>
                                <option value="3">Garantida Caucionada</option>
                            </select>
                        </div>

                        <input type="hidden" name="modalidade" id="modalidade">
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="identificacao_contrato">Identificação de contrato</label>
                            <input type="text" class="form-control" name="identificacao_contrato" value="<?= $configs->identificacao_contrato ?>" id="identificacao_contrato">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="venc_dias">Dias para vencer o boleto</label>
                            <input type="number" name="venc_dias" id="venc_dias" class="form-control" value="<?= $configs->venc_dias ?>">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="codigo_beneficiario_dv">Digito verificador de beneficiário</label>
                            <input type="text" name="codigo_beneficiario_dv" value="<?= $configs->codigo_beneficiario_dv ?>" id="codigo_beneficiario_dv" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="valor_venc">Percentual de Juros pós vencimento</label>
                            <input type="text" class="form-control" id="valor_venc" name="valor_venc" value="<?= $configs->valor_venc ?>" />
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="inst1">1º Instrução</label>
                            <textarea name="inst1" id="inst1" cols="30" rows="10" class="form-control">
                                <?= $configs->inst1 ?>
                            </textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inst2">2º Instrução</label>
                            <textarea name="inst2" id="inst2" cols="30" rows="10" class="form-control">
                                <?= $configs->inst2 ?>
                            </textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inst3">3º Instrução</label>
                            <textarea name="inst3" id="inst3" cols="30" rows="10" class="form-control">
                                <?= $configs->inst3 ?>
                            </textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inst4">4º Instrução</label>
                            <textarea name="inst4" id="inst4" cols="30" rows="10" class="form-control">
                                <?= $configs->inst4 ?>
                            </textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inst5">5º Instrução</label>
                            <textarea name="inst5" id="inst5" cols="30" rows="10" class="form-control">
                                <?= $configs->inst5 ?>
                            </textarea>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="text-right">
                        <div class="form-group">
                            <input type="submit" value="Salvar Configurações" class="btn btn-info">
                        </div>
                    </div>
                </div>
            </form>
        </fieldset>

        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Arquivos de remessa/retorno</legend>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <form id="uploadForm" action="<?= admin_url('system_settings/upload_retorno') ?>" enctype="multipart/form-data">
                            <input type="hidden" name="<?= $this->security->get_csrf_token_name() ?>" value="<?= $this->security->get_csrf_hash() ?>" />
                            <label for="upload_retorno" class="btn btn-success" style="width: 100%;">Enviar arquivo de retorno</label>
                            <input type="file" name="upload_retorno" id="upload_retorno">
                        </form>
                    </div>
                </div>
            </div>
            <?php if ($remessasParaDownload > 0) {?>
                <div class="container" style="margin-top: 35px">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="alert alert-warning">
                                <p>
                                    Existem
                                    <b><?= $remessasParaDownload ?></b> remessas pendentes no sistema. Você pode fazer o donwload dos arquivos mesclados clicando <a href="<?= admin_url('system_settings/unique_remessa') ?>">aqui</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            <?php }?>
            <div class="container" style="margin-top: 50px">
                <strong style="font-size: 20px;">Arquivos de Remessa</strong>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="remessas_table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center" scope="col">Nome</th>
                                        <th class="text-center" scope="col">Valor (R$)</th>
                                        <th class="text-center" scope="col">Valor Pago(R$)</th>
                                        <th class="text-center" scope="col">Código de referência</th>
                                        <th class="text-center" scope="col">Data de criação</th>
                                        <th class="text-center" scope="col">Situação</th>
                                        <th class="text-center" scope="col">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if ( isset($remessas) ) {?>
                                        <?php foreach($remessas as $remessa) { ?>
                                            <tr>
                                                <td class="text-center"><?= $remessa->nome ?></td>
                                                <td class="text-center"><?= $remessa->valor ?></td>
                                                <td class="text-center"><?= $remessa->valor_pago ?></td>
                                                <td class="text-center"><?= $remessa->referencia ?></td>
                                                <td class="text-center"><?= date('d/m/Y', strtotime($remessa->data_criacao)) ?></td>
                                                <td class="text-center"><?= lang($remessa->situacao) ?></td>
                                                <td class="text-center">
                                                    <a title="Baixar remessa" style="margin-right: 5px" href="<?= admin_url('system_settings/download_remessa?remessaId=') . $remessa->id ?>">
                                                        <i class="fa fa-download"></i>
                                                    </a>

                                                    <a title="Excluir remessa" href="<?= admin_url('system_settings/excluir_remessa?remessaId=') . $remessa->id ?>">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <hr>
                        <strong style="font-size: 17px">Informações extras</strong>
                        <div class="cards-container">
                            <div class="card bg-primary">
                                <span class="card-title">Qntd. de Boletos pendentes</span>
                                <span class="card-text"><?= $remessasParaDownload ?></span>
                            </div>

                            <div class="card bg-primary">
                                <span class="card-title">Valor total de boletos pendentes</span>
                                <span class="card-text"><?= $vlrNaoPagos ?> R$</span>
                            </div>

                            <div class="card bg-primary">
                                <span class="card-title">Quantidade faturada nos últimos 30 dias</span>
                                <span class="card-text"><?= $faturaMes ?> R$</span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </div>
</div>
<script src="/assets/packages/toastr.min.js"></script>
<script src="/assets/packages/jquery.inputmask.min.js"></script>
<script>
    $("#sicoob_form").submit(e=>{
        e.preventDefault();
        $.post('<?= $set_key ?>', $("#sicoob_form").serialize()).then((res)=>{
            if(!res.error) {
                toastr.success(res.message, "Sucesso")
            } else {
                toastr.error(res.message, "Erro")
            }
        })
    })

    $("#uploadForm").submit((e)=>{
        e.preventDefault();
        let formData = new FormData(document.querySelector("#uploadForm"));

        $.ajax({
            url: $("#uploadForm").attr('action'),
            type: 'POST',
            data: formData,
            success: function (res) {
                console.log(res)
                res = JSON.parse(res)
                if (! res.error) {
                    toastr.success(res.message, 'Sucesso');
                } else {
                    toastr.error(res.message, 'Erro');
                }
            },
            cache: false,
            contentType: false,
            processData: false
        });
    });

    $("#upload_retorno").change(()=>{
        $("#uploadForm").submit();
    })

    $(document).ready(()=>{
        $("#modalidade").val( "0" + $("#codigo_carteira").val() );

        $(":input").inputmask();

        $("#desconto").inputmask('99.99');
        $("#outro_acrescimo").inputmask('99.99');
        $("#valor_venc").inputmask('99.99');
        $("#mora_multa").inputmask('99.99');
        $("#deducoes").inputmask('decimal', {
            'alias': 'numeric',
            'groupSeparator': ',',
            'digits': 2,
            'radixPoint': "."
        });

        $('#remessas_table').DataTable();

        $("#codigo_carteira").change((event)=>{
            $("#modalidade").val( "0" + $("#codigo_carteira").val() );
        })
    });
</script>