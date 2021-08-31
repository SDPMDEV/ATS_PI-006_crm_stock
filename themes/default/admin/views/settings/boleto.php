<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<script>
    $(document).ready(function () {
        $('#boleto_form').bootstrapValidator({
            message: 'Please enter/select a value',
            submitButtons: 'input[type="submit"]'
        });
        $('#banco').change(function () {
            
        });
    });
</script>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-cog"></i><?= lang('Config. de Boleto'); ?></h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown"><a href="<?= admin_url('system_settings/paypal') ?>" class="toggle_up"><i
                            class="icon fa fa-paypal"></i><span
                            class="padding-right-10"><?= lang('paypal'); ?></span></a></li>
                <li class="dropdown"><a href="<?= admin_url('system_settings/skrill') ?>" class="toggle_down"><i
                            class="icon fa fa-bank"></i><span class="padding-right-10"><?= lang('skrill'); ?></span></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?= lang('update_info'); ?></p>

                <?php $attrib = ['role' => 'form', 'id="boleto_form"'];
                echo admin_form_open('system_settings/boleto', $attrib);
                ?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <?= lang('Bancos', 'banco'); ?>
                            <?php
                            $yn = ['sicoob' => 'Sicoob'];
                            echo form_dropdown('banco', $yn, 'sicoob', 'class="form-control tip" required="required" id="banco"');
                            ?>
                        </div>

                        <div class="form-group">
                            <?= lang('Agência', 'Agência'); ?>
                            <?php echo form_input('agencia', $paypal->account_email, 'class="form-control tip" id="agencia"'); ?>
                            <!--<small class="help-block"><?= lang('agencia'); ?></small>-->
                        </div>

                        <div class="form-group">
                            <?= lang('Conta', 'Conta'); ?>
                            <?php echo form_input('conta', $paypal->fixed_charges, 'class="form-control tip" id="conta"'); ?>
                            <!--<small class="help-block"><?= lang('conta'); ?></small>-->
                        </div>

                        <div class="form-group">
                            <?= lang('Convênio', 'Convênio'); ?>
                            <?php echo form_input('convenio', 'qwert', 'class="form-control tip" id="convenio"'); ?>
                            <!--<small class="help-block"><?= lang('convenio'); ?></small>-->
                        </div>
                    </div>
                </div>
                <div style="clear: both; height: 10px;"></div>
                <div class="form-group">
                    <?php echo form_submit('update_settings', lang('update_settings'), 'class="btn btn-primary"'); ?>
                </div>
            </div>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>