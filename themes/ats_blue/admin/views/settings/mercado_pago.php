<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="container">
    <div class="col-md-6" style="margin-top: 50px">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Mercado pago</legend>

            <form method="POST" class="form" id="mp_form">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="access_token">Access Token (token de acesso)</label>
                        <input type="text" name="access_token" id="access_token" class="form-control" value="<?= $access_token ?>">
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="public_key">Public Key (chave pública)</label>
                        <input type="text" name="public_key" id="public_key" class="form-control" value="<?= $public_key ?>">
                    </div>
                </div>

                <div class="col-lg-12 text-right">
                    <input type="submit" value="Salvar" class="btn btn-success" style="width: 150px; margin-top: 2rem">
                </div>
            </form>
        </fieldset>
    </div>
</div>
<script src="/assets/packages/toastr.min.js"></script>
<script>
    $("#mp_form").submit(e=>{
        e.preventDefault();
        $.post('<?= $set_keys ?>', $("#mp_form").serialize()).then(res=>{
            if(!res.error) {
                toastr.success(res.message, "Sucesso")
            } else {
                toastr.error(res.message, "Erro")
            }
        });
    })
</script>
