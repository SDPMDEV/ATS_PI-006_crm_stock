<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="/assets/packages/toastr.css"/>
<div class="container">
    <h1>Tributação</h1>
    <hr>
        <form id="trib-form">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Editar/Cadastrar Tributações</legend>

                <input type="hidden" name="ajax" value="1">
                <input required type="hidden" name="<?= $this->security->get_csrf_token_name() ?>" value="<?= $this->security->get_csrf_hash() ?>">
                <input required type="hidden" value="/save_taxation" name="api_url">

                <input required type="hidden" name="id" value="<?= $configs[0]->id ?>">

                <div class="col-md-4">
                    <div class="form-group">
                        <span>ICMS</span>
                        <input required maxlength="5" type="text" class="form-control" name="icms" id="icms" value="<?= $configs[0]->icms ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>PIS</span>
                        <input required maxlength="5" type="text" class="form-control" name="pis" id="pis" value="<?= $configs[0]->pis ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>COFINS</span>
                        <input required maxlength="5" type="text" class="form-control" name="cofins" id="cofins" value="<?= $configs[0]->cofins ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>IPI</span>
                        <input required maxlength="5" type="text" class="form-control" name="ipi" id="ipi" data-inputmask="'mask': '99.99'" value="<?= $configs[0]->ipi ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>NCM Padrão</span>
                        <input required type="text" class="form-control" name="ncm_padrao" id="ncm_padrao" maxlength="10" value="<?= $configs[0]->ncm_padrao ?>">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <span>Regime</span>
                        <select required name="regime" class="form-control">
                            <option value="0">Simples</option>
                            <option value="1">Normal</option>
                        </select>
                    </div>
                </div>
            </fieldset>
            <div>
                <input type="button" onclick="window.history.back();" class="btn btn-danger" value="Cancelar">
                <input type="submit" class="btn btn-success" value="Salvar">
            </div>
        </form>
</div>

<script src="/assets/packages/toastr.min.js"></script>
<script src="/assets/packages/jquery.inputmask.min.js"></script>
<script>
    function getFormData($form){
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function(n, i){
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    $(":input").inputmask();

    $("#ncm_padrao").inputmask({"mask": "9999.99.99"});
    $("#icms").inputmask({"mask": "99.99"});
    $("#pis").inputmask({"mask": "99.99"});
    $("#cofins").inputmask({"mask": "99.99"});
    $("#ipi").inputmask({"mask": "99.99"});

    $("#trib-form").submit((e)=>{
        e.preventDefault();

        let data = getFormData($("#trib-form"));

        $.post("/validate/request", data).then(res=>{
            console.log(data)
            if(!res.error) {
                toastr.success(res.message, "Sucesso");
            } else {
                toastr.error(res.message, "Erro");
            }
        }).fail(err=>{
            toastr.error("Erro interno do servidor", "Erro");
            console.log(err.responseText);
        });
    });
</script>