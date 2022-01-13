<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<div class="container">
    <h1><?= (!empty($configs)) ? "Editar" : "Cadastrar" ?> escritório</h1>
    <hr>
    <form id="office_form">
        <input type="hidden" name="id" value="<?= $configs["id"] ?>">
        <input required type="hidden" name="api_token" id="api_token" value="<?= $token ?>">

        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Informações básicas</legend>

            <div class="col-md-4">
                <div class="form-group">
                    <label>Razao Social</label>
                    <input id="razao_social" type="text" class="form-control" name="razao_social" value="<?= $configs["razao_social"] ?>">
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label>Nome Fantasia</label>
                    <input id="nome_fantasia" type="text" class="form-control " name="nome_fantasia" value="<?= $configs["nome_fantasia"] ?>">
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label>CNPJ</label>
                    <input id="cnpj" type="text" class="form-control " name="cnpj" value="<?= $configs["cnpj"] ?>" maxlength="18">
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label>Inscrição Estadual</label>
                    <input id="ie" type="text" class="form-control " name="ie" value="<?= $configs["ie"] ?>">
                </div>
            </div>
        </fieldset>

        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Endereço</legend>

            <div class="col-md-4">
                <div class="form-group">
                    <label>Logradouro</label>
                    <input id="logradouro" type="text" class="form-control " name="logradouro" value="<?= $configs["logradouro"] ?>">   
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-form-label">Nº</label>
                    <input id="numero" type="text" class="form-control " name="numero" value="<?= $configs["numero"] ?>">
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-form-label">Bairro</label>
                    <input id="bairro" type="text" class="form-control " name="bairro" value="<?= $configs["bairro"] ?>">
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-form-label">CEP</label>
                    <input id="cep" type="text" class="form-control " name="cep" value="<?= $configs["cep"] ?>" maxlength="9">
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-form-label">Email</label>
                    <input id="email" type="text" class="form-control " name="email" value="<?= $configs["email"] ?>">
                </div>
            </div>

            <div class="col-md-4">
                <label class="col-form-label">Telefone</label>
                <input id="telefone" type="text" class="form-control " name="fone" value="<?= $configs["fone"] ?>" maxlength="15">
            </div>
        </fieldset>
        
        <div>
            <a class="btn btn-danger" onclick="goBack()">
                <i class="la la-close"></i>
                <span>Cancelar</span>
            </a>

            <button type="submit" class="btn btn-success">
                <i class="la la-check"></i>
                <span>Salvar</span>
            </button>
        </div>
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.7-beta.29/jquery.inputmask.min.js" integrity="sha512-Ax4+qW2rAVWrk3SU1ef/L8O0jF6vKSfaMIR3du6efzf5v/pibzDcLFx29YCeR7WphoPO4zranQFsFUf+9Rb+dg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    function goBack() {
        window.history.back();
    }

    function getFormData($form){
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function(n, i){
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    $("#office_form").submit(e=>{
        e.preventDefault();
        $.post("<?= $remote_url ?>/save_office_configs", getFormData($("#office_form"))).then(res=>{
            if(!res.error) {
                toastr.success(res.message, "Sucesso");
            } else {
                toastr.error(res.message, "Erro");                
            }
        }).fail(err=>{
            toastr.error("Erro de resposta!", "Erro");
            console.log(err.responseText);
        });
    })

    $(":input").inputmask();

    $("#cnpj").inputmask({"mask": "99.999.999/9999-99"});
    $("#cep").inputmask({"mask": "99999-999"});
    $("#telefone").inputmask({"mask": "9 99999-9999"});
</script>