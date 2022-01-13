<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('edit_customer'); ?></h4>
        </div>
        <?php $attrib = ['data-toggle' => 'validator', 'role' => 'form'];
        echo admin_form_open_multipart('customers/edit/' . $customer->id, $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                    <label class="control-label" for="customer_group"><?php echo $this->lang->line('customer_group'); ?></label>
                        <?php
                        foreach ($customer_groups as $customer_group) {
                            $cgs[$customer_group->id] = $customer_group->name;
                        }
                        echo form_dropdown('customer_group', $cgs, $customer->customer_group_id, 'class="form-control select" id="customer_group" style="width:100%;" required="required"');
                        ?>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label" for="price_group"><?php echo $this->lang->line('price_group'); ?></label>
                        <?php
                        $pgs[''] = lang('select') . ' ' . lang('price_group');
                        foreach ($price_groups as $price_group) {
                            $pgs[$price_group->id] = $price_group->name;
                        }
                        echo form_dropdown('price_group', $pgs, $customer->price_group_id, 'class="form-control select" id="price_group" style="width:100%;"');
                        ?>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group company">
                        <?= lang('company', 'company'); ?>
                        <?php echo form_input('company', $customer->company, 'class="form-control tip" id="company" required="required"'); ?>
                    </div>
                    <div class="form-group person">
                        <?= lang('name', 'name'); ?>
                        <?php echo form_input('name', $customer->name, 'class="form-control tip" id="name" required="required"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang('gst_no', 'gst_no'); ?>
                        <?php echo form_input('gst_no', $customer->gst_no, 'class="form-control" id="gst_no"'); ?>
                    </div>
                    <!--<div class="form-group company">
                    <?= lang('contact_person', 'contact_person'); ?>
                    <?php //echo form_input('contact_person', $customer->contact_person, 'class="form-control" id="contact_person" required="required"');?>
                </div> -->
                    <div class="form-group">
                        <?= lang('email_address', 'email_address'); ?>
                        <input type="email" name="email" class="form-control" required="required" id="email_address"
                               value="<?= $customer->email ?>"/>
                    </div>
                    <div class="form-group">
                        <?= lang('phone', 'phone'); ?>
                        <input type="tel" name="phone" class="form-control" required="required" id="phone"
                               value="<?= $customer->phone ?>"/>
                    </div>
                    <div class="form-group">
                        <?= lang('address', 'address'); ?>
                        <?php echo form_input('address', $customer->address, 'class="form-control" id="address" required="required"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang('city', 'city'); ?>
                        <?php echo form_input('city', $customer->city, 'class="form-control" id="city" required="required"'); ?>
                    </div>
                    <div class="form-group">
                        <label for="state"><b>Estado</b></label>
                        <label for="state"><b>Estado</b></label>
                        <select name="state" id="state" class="form-control">
                            <?php foreach($configs->estados as $cMun => $estado) {?>
                                <?php if($customer->state == $estado) { ?>
                                    <option value="<?= $cMun . ' - ' . $estado ?>">
                                        <?= $estado ?>
                                    </option>
                                <?php } ?>
                            <?php }?>

                            <?php foreach($configs->estados as $cMun => $estado) {?>
                                <option value="<?= $cMun . ' - ' . $estado ?>">
                                    <?= $estado ?>
                                </option>
                            <?php }?>
                        </select>
                    </div>
                <!-- col-md-6 -->
                    <div class="form-group">
                        <?= lang('ccf6', 'cf6'); ?>
                        <?php echo form_input('cf6', $customer->cf6, 'class="form-control" id="cf6"'); ?>
                    </div>

                    <div class="form-group">
                        <label for="ie_rg">IE/RG</label>
                        <input type="text" name="ie_rg" id="ie_rg" class="form-control" value="<?= $customer->ie_rg ?>">
                    </div>

                    <div class="form-group">
                        <label for="rua">Rua</label>
                        <input type="text" name="rua" id="rua" class="form-control" value="<?= $customer->rua ?>">
                    </div>

                    <div class="form-group">
                        <label for="numero">Número</label>
                        <input type="text" name="numero" id="numero" class="form-control" value="<?= $customer->numero ?>">
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- col-md-6 -->

                    <div class="form-group">
                        <label for="contribuinte">Contribuinte</label>
                        <select name="contribuinte" id="contribuinte" class="form-control">
                            <?php if($customer->contribuinte == 1) {?>
                                <option value="1">Sim</option>
                                <option value="0">Não</option>
                            <?php } else {?>
                                <option value="0">Não</option>
                                <option value="1">Sim</option>
                            <?php } ?>

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="cep">CEP</label>
                        <input type="text" name="cep" id="cep" class="form-control" value="<?= $customer->cep ?>">
                    </div>

                    <div class="form-group">
                        <label for="cpf_cnpj">CPF/CNPJ</label>
                        <input type="text" name="cpf_cnpj" id="cpf_cnpj" class="form-control" value="<?= $customer->cpf_cnpj ?>">
                    </div>

                    <div class="form-group">
                        <label for="consumidor_final">Consumidor Final</label>
                        <select name="consumidor_final" id="consumidor_final" class="form-control">
                            <?php if($customer->cosumidor_final == 1) {?>
                                <option value="1">Sim</option>
                                <option value="0">Não</option>
                            <?php } else { ?>
                                <option value="0">Não</option>
                                <option value="1">Sim</option>
                            <?php }?>

                        </select>
                    </div>

                    <div class="form-group">
                        <?= lang('country', 'country'); ?>
                        <?php echo form_input('country', $customer->country, 'class="form-control" id="country"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang('ccf2', 'cf2'); ?>
                        <?php echo form_input('cf2', $customer->cf2, 'class="form-control" id="cf2"'); ?>

                    </div>
                    <div class="form-group">
                        <?= lang('ccf3', 'cf3'); ?>
                        <?php echo form_input('cf3', $customer->cf3, 'class="form-control" id="cf3"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang('ccf4', 'cf4'); ?>
                        <?php echo form_input('cf4', $customer->cf4, 'class="form-control" id="cf4"'); ?>

                    </div>
                    <div class="form-group">
                        <?= lang('ccf5', 'cf5'); ?>
                        <?php echo form_input('cf5', $customer->cf5, 'class="form-control" id="cf5"'); ?>

                    </div>

                    <div class="form-group">
                        <label for="bairro">Bairro</label>
                        <input type="text" name="bairro" id="bairro" class="form-control" value="<?= $customer->bairro ?>">
                    </div>

                    <div class="form-group">
                        <label for="cMun">Código do Municipio</label>
                        <input readonly type="text" name="cMun" id="cMun" class="form-control" placeholder="Preenchimento automático" value="<?= $customer->cMun ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <?php echo form_submit('edit_customer', lang('edit_customer'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<?= $modal_js ?>
<script>
    $(document).ready(function(e){
        $('#cMun').val($('#state').find(":selected").val().substring(0,2))

        $("#state").change(()=>{
            $('#cMun').val($('#state').find(":selected").val().substring(0,2))
        });
    })
</script>
