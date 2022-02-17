<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="container">
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
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="venc_em_dias">Vencer boleto em: (dias pós emissão)</label>
                            <input type="number" id="venc_em_dias" name="venc_em_dias" value="<?= $configs->venc_em_dias ?>">
                        </div>

                        <div class="form-group">
                            <label for="valor_iof">Valor IOF: </label>
                            <input type="text" id="valor_iof" name="valor_iof" value="<?= $configs->valor_iof ?>">
                        </div>

                        <div class="form-group">
                            <label for="multa_em_dias">Aplicar multa pós vencimento em: (dias)</label>
                            <input type="text" id="multa_em_dias" name="multa_em_dias" value="<?= $configs->multa_em_dias ?>">
                        </div>

                        <div class="form-group">
                            <label for="juros_em_dias">Aplicar juros pós vencimento em: (dias)</label>
                            <input type="text" id="juros_em_dias" name="juros_em_dias" value="<?= $configs->juros_em_dias ?>">
                        </div>

                        <div class="form-group">
                            <label for="num_cliente">Número do cliente</label>
                            <input type="number" id="num_cliente" name="num_cliente" value="<?= $configs->num_cliente ?>">
                        </div>

                        <div class="form-group">
                            <label for="cooperativa">Cooperativa</label>
                            <input type="text" id="cooperativa" name="cooperativa" value="<?= $configs->cooperativa ?>">
                        </div>

                        <div class="form-group">
                            <label for="perc_juros">Percentual de juros</label>
                            <input type="number" id="perc_juros" name="perc_juros" value="<?= $configs->perc_juros ?>">
                        </div>

                        <div class="form-group">
                            <label for="perc_taxa_mora">Percetual de taxa mora</label>
                            <input type="number" id="perc_taxa_mora" name="perc_taxa_mora" value="<?= $configs->perc_taxa_mora ?>">
                        </div>

                        <div class="form-group">
                            <label for="num_conta_corrente">Número da conta corrente</label>
                            <input type="number" id="num_conta_corrente" name="num_conta_corrente" value="<?= $configs->num_conta_corrente ?>">
                        </div>
                    </div>
                </div>

                <hr>

                <div class="col-md-6">
                    <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Instruções</legend>

                        <div class="form-group">
                            <label for="inst_1">1º Instrução</label>
                            <textarea name="inst_1" id="inst_1" cols="30" rows="10">
                                <?= $configs->inst_1 ?>
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label for="inst_2">2º Instrução</label>
                            <textarea name="inst_2" id="inst_2" cols="30" rows="10">
                                <?= $configs->inst_2 ?>
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label for="inst_3">3º Instrução</label>
                            <textarea name="inst_3" id="inst_3" cols="30" rows="10">
                                <?= $configs->inst_3 ?>
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label for="inst_4">4º Instrução</label>
                            <textarea name="inst_4" id="inst_4" cols="30" rows="10">
                                <?= $configs->inst_4 ?>
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label for="inst_5">5º Instrução</label>
                            <textarea name="inst_5" id="inst_5" cols="30" rows="10">
                                <?= $configs->inst_5 ?>
                            </textarea>
                        </div>
                    </fieldset>
                </div>

                <div class="col-md-6">
                    <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Descontos</legend>

                        <div class="form-group">
                            <label for="data_desc_1">Data 1º desconto: (dias pós emissão)</label>
                            <input type="number" name="data_desc_1" id="data_desc_1" class="form-control" value="<?= $configs->data_desc_1 ?>">

                            <label for="valor_desc_1">Valor 1º desconto: (% do valor total)</label>
                            <input type="number" name="valor_desc_1" id="valor_desc_1" class="form-control" max="100" min="0" value="<?= $configs->valor_desc_1 ?>">
                        </div>

                        <div class="form-group" style="margin-top: 50px">
                            <label for="data_desc_2">Data 2º desconto: (dias pós emissão)</label>
                            <input type="number" name="data_desc_2" id="data_desc_2" class="form-control" value="<?= $configs->data_desc_2 ?>">

                            <label for="valor_desc_2">Valor 2º desconto: (% do valor total)</label>
                            <input type="number" name="valor_desc_2" id="valor_desc_2" class="form-control" max="100" min="0" value="<?= $configs->valor_desc_2 ?>">
                        </div>

                        <div class="form-group" style="margin-top: 50px">
                            <label for="data_desc_3">Data 3º desconto: (dias pós emissão)</label>
                            <input type="number" name="data_desc_3" id="data_desc_3" class="form-control" value="<?= $configs->data_desc_3 ?>">

                            <label for="valor_desc_3">Valor 3º desconto: (% do valor total)</label>
                            <input type="number" name="valor_desc_3" id="valor_desc_3" class="form-control" max="100" min="0" value="<?= $configs->valor_desc_3 ?>">
                        </div>
                    </fieldset>
                </div>

                <div class="form-group text-center">
                    <input type="submit" value="Salvar Configurações" class="btn btn-info" style="width: 70%">
                </div>
            </form>
        </fieldset>
    </div>
</div>
<script src="/assets/packages/toastr.min.js"></script>
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

    $()
</script>
