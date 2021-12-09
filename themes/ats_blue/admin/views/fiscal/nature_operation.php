<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<div class="container">
    <h1>Natureza de operação</h1>
    <hr>

    <div class="row">
        <div class="col-md-3">
            <button class="btn btn-info" data-toggle="modal" data-target="#newNature">
                <i class="fa fa-plus"></i>
                <span>Nova Natureza de Operação</span>
            </button>
        </div>

        <div class="modal fade" id="newNature" tabindex="-1" role="dialog" aria-labelledby="newNatureTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Nova Natureza de Operação</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form-newNature">
                        <fieldset>
                            <div class="col-md-12">
                                <span>Nome: </span>
                                <input name="natureza" required type="text" class="form-control">
                            </div>
                        </fieldset>
                        <hr>
                        
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">CFOP Interno</legend>

                            <div class="col-md-3">
                                <span>Venda</span>
                                <input name="CFOP_entrada_estadual" maxlength="4" required type="text" class="form-control">
                            </div>

                            <div class="col-md-3">
                                <span>Entrada</span>
                                <input name="CFOP_entrada_inter_estadual" maxlength="4" required type="text" class="form-control">
                            </div>
                        </fieldset>

                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">CFOP INTERESTADUAL</legend>

                            <div class="col-md-3">
                                <span>Venda</span>
                                <input name="CFOP_saida_estadual" maxlength="4" required type="text" class="form-control">
                            </div>

                            <div class="col-md-3">
                                <span>Entrada</span>
                                <input name="CFOP_saida_inter_estadual" maxlength="4" required type="text" class="form-control">
                            </div>

                            <input required type="hidden" name="id" value="<?= $natureza->id ?>">
                            <input required type="hidden" name="api_token" id="api_token" value="<?= $api_token ?>">
                        </fieldset>
                        
                        <div style="text-align: end">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn btn-success" type="submit">Salvar</button>
                        </div>
                    </form>
                </div>
                </div>
            </div>
            </div>
        </div>

        <div class="row" style="margin-top: 20px">
        <div class="col-md-3">
            <b style="font-size: 17px;">Lista de Naturezas de Operação</b>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-3">
            <span>Total de registros: <?= $total_registros ?></span>
        </div>
    </div>

    <div class="row">

        <?php foreach($naturezas as $natureza) {?>
            <div class="col-md-3" style="margin-top: 20px; box-shadow: 0 2px 10px #dbdbdb; padding: 20px; margin: 20px">
                <div style="display: flex; justify-content: space-between">
                    <b><?= $natureza->id ?> - <?= $natureza->natureza ?></b>

                    <div class="dropdown">
                        <i class="fa fa-ellipsis-h" style="cursor: pointer" id="dropdown-<?= $natureza->id ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>

                        <div class="dropdown-menu" aria-labelledby="dropdown-<?= $natureza->id ?>">
                            <a class="btn" data-toggle="modal" data-target="#edit-modal-<?= $natureza->id ?>" onclick="editing(<?= $natureza->id ?>)">
                                <i class="fas fa-edit"></i> Editar
                            </a>

                            <br>
                            
                            <a class="btn" onclick="deleteNature(<?= $natureza->id ?>)">
                                <i class="fas fa-trash"></i> Excluir
                            </a>
                        </div>
                        
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="edit-modal-<?= $natureza->id ?>" tabindex="-1" role="dialog" aria-labelledby="edit-modal-<?= $natureza->id ?>Title" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Editar Natureza de Operação</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="edit-nature-<?= $natureza->id ?>">
                                <input required type="hidden" name="api_token" id="api_token" value="<?= $api_token ?>">
                                <input required type="hidden" name="id" value="<?= $natureza->id ?>">
                                <fieldset>
                                    <div class="col-md-12">
                                        <span>Nome: </span>
                                        <input name="natureza" required type="text" class="form-control" value="<?= $natureza->natureza ?>">
                                    </div>
                                </fieldset>
                                <hr>
                                
                                <fieldset class="scheduler-border">
                                    <legend class="scheduler-border">CFOP Interno</legend>

                                    <div class="col-md-3">
                                        <span>Venda</span>
                                        <input maxlength="4" name="CFOP_saida_estadual" required type="text" class="form-control" value="<?= $natureza->CFOP_saida_estadual ?>">
                                    </div>

                                    <div class="col-md-3">
                                        <span>Entrada</span>
                                        <input maxlength="4" name="CFOP_entrada_estadual" required type="text" class="form-control" value="<?= $natureza->CFOP_entrada_estadual ?>">
                                    </div>
                                </fieldset>

                                <fieldset class="scheduler-border">
                                    <legend class="scheduler-border">CFOP INTERESTADUAL</legend>

                                    <div class="col-md-3">
                                        <span>Venda</span>
                                        <input maxlength="4" name="CFOP_saida_inter_estadual" required type="text" class="form-control" value="<?= $natureza->CFOP_saida_inter_estadual ?>">
                                    </div>

                                    <div class="col-md-3">
                                        <span>Entrada</span>
                                        <input maxlength="4" name="CFOP_entrada_inter_estadual" required type="text" class="form-control" value="<?= $natureza->CFOP_entrada_inter_estadual ?>">
                                    </div>
                                </fieldset>

                                <div style="text-align: end">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    <button type="submit" class="btn btn-success" type="submit">Salvar</button>
                                </div>
                            </form>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
                
                <div style="display: flex; flex-direction: column; margin-top: 10px;">
                    <span>CFOP saida estadual: <b class="text-success"><?= $natureza->CFOP_saida_estadual ?></b></span>
                    <span>CFOP entrada estadual: <b class="text-success"><?= $natureza->CFOP_entrada_estadual ?></b></span>
                    <span>CFOP saida interestadual: <b class="text-success"><?= $natureza->CFOP_saida_inter_estadual ?></b></span>
                    <span>CFOP entrada interestadual: <b class="text-success"><?= $natureza->CFOP_entrada_inter_estadual ?></b></span>
                </div>
            </div>
        <?php }?>
    </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    function deleteNature(id)
    {
        if(id) {
            bootbox.confirm({
                message: "Você tem certeza que deseja remover o registro?", 
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
                        $.post("<?= $remote_url ?>/delete_nature", {
                            api_token: $("#api_token").val(),
                            id: id
                        }).then(res=>{
                            if(!res.error) {
                                toastr.success(res.message, "Sucesso");
                                location.reload();
                            } else {
                                toastr.success(res.message, "Erro");
                            }
                        }).fail(err=>{
                            console.log(err.responseText);
                        });
                    }
                }
            });
        }
    }

    function getFormData($form){
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function(n, i){
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    function editing(id)
    {
        if(id) {
            $(`#edit-nature-${id}`).bind('submit', (e)=>{
                e.preventDefault();
                data = getFormData($(`#edit-nature-${id}`));

                $.post("<?= $remote_url ?>/edit_nature", data).then(res=>{
                    if(!res.error) {
                        toastr.success(res.message, "Sucesso");
                        location.reload();
                    } else {
                        toastr.error(res.message, "Erro");
                    }
                }).fail(err=>{
                    toastr.error("Erro interno do servidor", "Erro");
                    console.log(err.responseText);
                });
            });
        }
    }

    $(`#form-newNature`).submit((e)=>{
        e.preventDefault();
        data = getFormData($(`#form-newNature`));

        $.post("<?= $remote_url ?>/new_nature", data).then(res=>{
            if(!res.error) {
                toastr.success(res.message, "Sucesso");
                location.reload();
            } else {
                toastr.error(res.message, "Erro");
            }
        }).fail(err=>{
            toastr.error("Erro interno do servidor", "Erro");
            console.log(err.responseText);
        });
    });
</script>