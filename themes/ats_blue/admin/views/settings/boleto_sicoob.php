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
                            <label for="venc_dias">Dias para vencer o boleto</label>
                            <input type="number" name="venc_dias" id="venc_dias" class="form-control" value="<?= $configs->venc_dias ?>">
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

    $(document).ready(()=>{
        $(":input").inputmask();

        $("#desconto").inputmask('99.99');
        $("#outro_acrescimo").inputmask('99.99');
        $("#mora_multa").inputmask('99.99');
        $("#deducoes").inputmask('decimal', {
            'alias': 'numeric',
            'groupSeparator': ',',
            'digits': 2,
            'radixPoint': "."
        });
    });
</script>
