<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="/assets/packages/toastr.css"/>
<style>
    .modal.in {
        background-color: rgba(0,0,0,0.5);
    }
</style>
<div class="container" id="app">
    <h1>Manifesto</h1>
    <hr>
    <div class="row">
        <div class="col-md-12">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Filtro</legend>
                <input required type="hidden" id="csrf" name="<?= $this->security->get_csrf_token_name() ?>" value="<?= $this->security->get_csrf_hash() ?>">

                <div class="col-md-4">
                    <label for="dataInicial">Data Inicial</label>
                    <input v-model="initDate" class="form-control" type="date" name="data_inical" id="dataInicial">
                </div>

                <div class="col-md-4">
                    <label for="dataFinal">Data Final</label>
                    <input v-model="finalDate" class="form-control" type="date" name="data_final" id="dataFinal">
                </div>

                <div class="col-md-4">
                    <label for="tipo">Tipo</label>
                    <select name="tipo" id="tipo" class="form-control">
                        <option value="--">TODOS</option>
                        <option value="1">CIÊNCIA</option>
                        <option value="2">CONFIRMADA</option>
                        <option value="3">DESCONHECIDA</option>
                        <option value="4">NÃO REALIZADA</option>
                        <option value="0">SEM AÇÃO</option>
                    </select>
                </div>

                <div class="col-md-12">
                    <div class="form-group" style="margin-top: 15px; text-align: end">
                        <input v-on:click="filterManifest()" type="submit" class="btn btn-info" value="Pesquisa"/>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-12">
            <input v-on:click="getNewDocuments" type="button" value="Nova Consulta de Documentos"
                   class="btn btn-success">

            <label for="imported_xml" type="button" value="Importar XML" class="btn btn-danger" style="margin-top: 0">Importar XML</label>
            <form id="import_xml_form" enctype="multipart/form-data" method="POST">
                <input v-on:change="submitXML" type="file" id="imported_xml" name="xml_file" accept=".xml" style="display: none;"/>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <br>
            <span style="font-size: 18px">Total de registros: <b style="color: green">{{ docs.length }}</b></span>
        </div>
    </div>
    <hr>
    <div class="row table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Nome</th>
                <th scope="col">Documento</th>
                <th scope="col">Valor</th>
                <th scope="col">Data Emissão</th>
                <th scope="col">Nº Protocolo</th>
                <th scope="col">Chave</th>
                <th scope="col">Estado</th>
                <th scope="col">Ações</th>
            </tr>
            </thead>
            <tbody>
            <tr v-if="docs !== ''" v-for="doc in docs">
                <td>{{ doc.nome }}</td>
                <td>{{ doc.documento }}</td>
                <td>{{ doc.valor }}</td>
                <td>{{ doc.data_emissao }}</td>
                <td>{{ doc.num_prot }}</td>
                <td>{{ doc.chave }}</td>
                <td>{{ doc.estado }}</td>
                <td>
                    <a v-if="doc.tipo == 1 || doc.tipo == 2" style="width: 100%;" class="btn btn-success" v-on:click="getDownloadConfigs(doc.chave)">Completa</a>
                    <a v-if="doc.tipo == 1 || doc.tipo == 2" style="width: 100%;" target="_blank" class="btn btn-primary" v-bind:href="'<?= $api_url ?>/dfe/imprimirDanfe/'+doc.chave" target="_blank">Imprimir</a>
                    <a v-if="doc.tipo == 3" style="width: 100%;" class="btn btn-danger">Desconhecida</a>
                    <a v-if="doc.tipo == 4" style="width: 100%" class="btn btn-warning">Não realizada</a>
                    <a v-if="doc.tipo == 0" style="width: 100%;" class="btn btn-info" onclick="" data-toggle="modal" data-target="#modal-manifest" v-on:click="prepareManifest(doc.chave)">Manifestar</a>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="modal" role="dialog" id="modal-completa">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Importando XML</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div v-if="downloadConfigs !== ''" class="col-md-12" style="margin-bottom: 15px;">
                            <b>Nota Fiscal: </b>
                            <p style="color: #3c82e6;">{{ downloadConfigs.infos.nNf[0] }}</p>
                            <b>Chave: </b>
                            <p style="color: #3c82e6;">{{ downloadConfigs.infos.chave }}</p>
                            <b>Fornecedor: </b>
                            <p>{{ downloadConfigs.fornecedor.razaoSocial[0] }}</p>
                            <b>Nome fantasia: </b>
                            <p>{{ downloadConfigs.fornecedor.nomeFantasia[0] }}</p>
                            <b>CNPJ: </b>
                            <p>{{ downloadConfigs.fornecedor.cnpj[0] }}</p>
                            <b>IE: </b>
                            <p>{{ downloadConfigs.fornecedor.ie[0] }}</p>
                            <b>CEP: </b>
                            <p>{{ downloadConfigs.fornecedor.cep[0] }}</p>
                            <b>Fone: </b>
                            <p>{{ downloadConfigs.fornecedor.fone[0] }}</p>
                            <b>Logradouro: </b>
                            <p>{{ downloadConfigs.fornecedor.logradouro[0] }}</p>
                            <b>Número: </b>
                            <p>{{ downloadConfigs.fornecedor.numero[0] }}</p>
                            <b>Bairro: </b>
                            <p>{{ downloadConfigs.fornecedor.bairro[0] }}</p>

                            <hr>

                            <div class="row" style="text-align: start; margin-left: 10px">
                                <p><b>Fatura</b></p>
                                <b>Total: </b><span>{{ downloadConfigs.infos.vProd[0] }}</span>
                            </div>

                            <div class="row" style="text-align: end; margin-right: 10px">
                                <a download class="btn btn-info" v-bind:href=" '<?= $api_url ?>/dfe/downloadXML/' + downloadConfigs.infos.chave ">
                                    Baixar XML
                                </a>
                            </div>
                        </div>
                        <div class="cold-md-12">

                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Produto</th>
                                    <th scope="col">NCM</th>
                                    <th scope="col">CFOP</th>
                                    <th scope="col">COD. BARRAS</th>
                                    <th scope="col">UN. COMPRA</th>
                                    <th scope="col">VALOR</th>
                                    <th scope="col">QTD</th>
                                    <th scope="col">SUBTOTAL</th>
                                    <th scope="col">AÇÕES</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="item in downloadConfigs.itens">
                                    <td v-bind:id=" `td_cod_${item.codigo[0]}` ">{{ item.codigo[0] }}</td>
                                    <td v-bind:id=" `td_name_${item.codigo[0]}` ">{{ item.xProd[0] }}</td>
                                    <td v-bind:id=" `td_ncm_${item.codigo[0]}` ">{{ item.NCM[0] }}</td>
                                    <td v-bind:id=" `td_cfop_${item.codigo[0]}` ">{{ item.CFOP[0] }}</td>
                                    <td v-bind:id=" `td_codbar_${item.codigo[0]}` ">{{ item.codBarras[0] }}</td>
                                    <td v-bind:id=" `td_uncomp_${item.codigo[0]}` ">{{ item.uCom[0] }}</td>
                                    <td v-bind:id=" `td_value_${item.codigo[0]}` ">{{ item.vUnCom[0] }}</td>
                                    <td v-bind:id=" `td_qtd_${item.codigo[0]}` ">{{ item.qCom[0] }}</td>
                                    <td v-bind:id=" `td_subt_${item.codigo[0]}` "> {{ number_format(parseFloat(item.qCom[0]) * parseFloat(item.vUnCom[0]), 2, ',', '.') }} </td>

                                    <th class="datatable-cell">
                                            <span style="width: 80px;">
                                                <a v-on:click="openCadModal(item.codigo[0])" v-if="item.produtoNovo"
                                                   class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="modal"
                                                   href="#modal-cad">
                                                    <span class="svg-icon svg-icon-success">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                                                             height="24px" viewBox="0 0 24 24">
                                                            <g stroke="none" stroke-width="1" fill="none"
                                                               fill-rule="evenodd">
                                                                <rect fill="#000000" x="4" y="11" width="16" height="2"
                                                                      rx="1"/>
                                                                <rect fill="#000000" opacity="0.3"
                                                                      transform="translate(12.000000, 12.000000) rotate(-270.000000) translate(-12.000000, -12.000000) "
                                                                      x="4" y="11" width="16" height="2" rx="1"/>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                </a>

                                                <a v-if="item.produtoNovo === false"
                                                   title="Editar Produto" class="btn btn-sm btn-clean btn-icon mr-2" v-bind:href="'/admin/products/edit/'+item.id" target="_blank">
                                                    <span class="svg-icon svg-icon-warning">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                                                             height="24px" viewBox="0 0 24 24">
                                                            <g stroke="none" stroke-width="1" fill="none"
                                                               fill-rule="evenodd">
                                                                <rect x="0" y="0" width="24" height="24"/>
                                                                <path d="M4,9.67471899 L10.880262,13.6470401 C10.9543486,13.689814 11.0320333,13.7207107 11.1111111,13.740321 L11.1111111,21.4444444 L4.49070127,17.526473 C4.18655139,17.3464765 4,17.0193034 4,16.6658832 L4,9.67471899 Z M20,9.56911707 L20,16.6658832 C20,17.0193034 19.8134486,17.3464765 19.5092987,17.526473 L12.8888889,21.4444444 L12.8888889,13.6728275 C12.9050191,13.6647696 12.9210067,13.6561758 12.9368301,13.6470401 L20,9.56911707 Z"
                                                                      fill="#000000"/>
                                                                <path d="M4.21611835,7.74669402 C4.30015839,7.64056877 4.40623188,7.55087574 4.5299008,7.48500698 L11.5299008,3.75665466 C11.8237589,3.60013944 12.1762411,3.60013944 12.4700992,3.75665466 L19.4700992,7.48500698 C19.5654307,7.53578262 19.6503066,7.60071528 19.7226939,7.67641889 L12.0479413,12.1074394 C11.9974761,12.1365754 11.9509488,12.1699127 11.9085461,12.2067543 C11.8661433,12.1699127 11.819616,12.1365754 11.7691509,12.1074394 L4.21611835,7.74669402 Z"
                                                                      fill="#000000" opacity="0.3"/>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                </a>
                                            </span>
                                    </th>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="modal-manifest" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Manifestação de Destinatário</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="nome" name="nome" />
                        <input type="hidden" id="cnpj" name="cnpj" />
                        <input type="hidden" id="valor" name="valor" />
                        <input type="hidden" id="data_emissao" name="data_emissao" />
                        <input type="hidden" id="num_prot" name="num_prot" />
                        <input type="hidden" id="chave" name="chave" />

                        <label for="tipo_evento" class="col-form-label">Unidade de venda</label>
                        <select class="custom-select form-control" name="evento" id="tipo_evento" onchange="getTipoEvento(this)">
                            <option value="1">Ciência de operação</option>
                            <option value="2">Confirmação</option>
                            <option value="3">Desconhecimento</option>
                            <option value="4">Operação não realizada</option>
                        </select>
                        <div id="div-just" style="display: none; margin-top: 15px;">
                            <label for="justificativa" class="col-form-label">Justificativa</label>
                            <input id="justificativa" type="text" class="form-control" name="justificativa" value="">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a onclick="$('#modal-manifest').modal('toggle')" class="btn btn-danger">Fechar</a>
                        <a id="btnManifest" class="btn btn-success" v-on:click="manifest">Manifestar</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="modal-cad">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cadastrar Produto</h4>
                        <button type="button" class="close" onclick="$('#modal-cad').modal('toggle')" aria-hidden="true">×</button>
                    </div><div class="container"></div>
                    <div class="modal-body" v-if="productToAdd !== ''">
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">Os títulos de campos marcados com * são obrigatórios.</legend>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="alert alert-warning" role="alert">
                                        <strong>Atenção,</strong> esse é um método rápido de salvamento de produtos, algumas configurações que não se encontram aqui deverão ser feitas na <a href="/admin/products/">Página de produtos</a>.
                                    </div>
                                </div>
                            </div>

                            <form method="POST" id="cadNewProduct" v-on:submit="addProduct($event)">
                                <input required type="hidden" id="csrf" name="<?= $this->security->get_csrf_token_name() ?>" value="<?= $this->security->get_csrf_hash() ?>">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="name"><b>Nome do produto *</b></label>
                                        <input required type="text" name="name" class="form-control" id="name" v-bind:value="productToAdd.xProd[0]">
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="ncm"><b>NCM *</b></label>
                                            <input required type="text" class="form-control" name="ncm" id="ncm" v-bind:value="productToAdd.NCM[0]" maxlength="10">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="cfop_saida_estudal"><b>CFOP *</b></label>
                                            <input required type="text" class="form-control" name="cfop_saida_estudal" id="cfop_saida_estudal" v-bind:value="productToAdd.CFOP[0]">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="codigo_barras"><b>COD. Barras *</b></label>
                                            <input required type="text" class="form-control" name="codigo_barras" id="codigo_barras" v-bind:value="productToAdd.codBarras[0]">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="unidade_compras"><b>UN. Compras *</b></label>
                                            <input required type="text" class="form-control" name="unidade_compras" id="unidade_compras" v-bind:value="productToAdd.uCom[0]">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="unidade_vendas"><b>UN. Venda</b></label>
                                            <select required class="form-control" id="unidade_vendas" name="unidade_vendas">
                                                <option v-for="unv in downloadConfigs.unidadesDeMedida" v-bind:value="unv">{{ unv }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="qtd"><b>Quantidade *</b></label>
                                            <input required type="text" class="form-control" name="quantidade" id="qtd" v-bind:value="productToAdd.qCom[0]">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="cst_IPI"><b>CST IPI</b></label>
                                            <select required class="form-control" name="cst_IPI" id="cst_IPI">
                                                <option v-for="(cst_ipi, index) in downloadConfigs.listaCST_IPI" v-bind:value="index">{{ index }} - {{ cst_ipi }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label  for="cest">CEST</label>
                                            <input required type="text" class="form-control" name="cest" id="cest" v-bind:value="productToAdd.cest[0]">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group all">
                                            <?= lang('barcode_symbology', 'barcode_symbology') ?>

                                            <?php
                                                $bs = ['code25' => 'Code25', 'code39' => 'Code39', 'code128' => 'Code128', 'ean8' => 'EAN8', 'ean13' => 'EAN13', 'upca' => 'UPC-A', 'upce' => 'UPC-E'];
                                                echo form_dropdown('barcode_symbology', $bs, ($_POST['barcode_symbology'] ?? ($product ? $product->barcode_symbology : 'code128')), 'class="form-control select" id="barcode_symbology" required="required" style="width:100%;"');
                                            ?>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="referencia"><b>Referência *</b></label>
                                            <input type="text" name="referencia" id="referencia" class="form-control" v-bind:value="productToAdd.codigo[0]">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <?= lang('tax_method', 'tax_method') ?>
                                            <?php
                                            $tm = ['1' => lang('exclusive'), '0' => lang('inclusive')];
                                            echo form_dropdown('tax_method', $tm, ($_POST['tax_method'] ?? ($product ? $product->tax_method : '')), 'class="form-control select" id="tax_method" placeholder="' . lang('select') . ' ' . lang('tax_method') . '" style="width:100%"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input name="hide_pos" type="checkbox" id="hide_pos"/>
                                            <label for="hide_pos" class="padding05"><b>Esconder no Módulo POS</b></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="valor_compra"><b>Valor de Compra</b></label>
                                            <input required type="text" class="form-control" name="valor_compra" id="valor_compra" v-bind:value="productToAdd.vUnCom[0]" v-on:change="calcularValorVenda">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="valor_venda"><b>Valor de venda</b></label>
                                            <input required type="text" class="form-control" name="valor_venda" id="valor_venda" value="0">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="conversao_estoque"><b>Conversão unitária para estoque</b></label>
                                            <input required type="text" class="form-control" name="conversao_estoque" id="conversao_estoque" v-bind:value="(productToAdd.conversao_unitaria) ? productToAdd.conversao_unitaria : 1" v-on:change="calcularValorVenda">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="cor"><b>Cor (opicional)</b></label>
                                            <select required name="cor" class="custom-select form-control" id="cor">
                                                <option value="--">--</option>
                                                <option value="Preto">Preto</option>
                                                <option value="Branco">Branco</option>
                                                <option value="Dourado">Dourado</option>
                                                <option value="Vermelho">Vermelho</option>
                                                <option value="Azul">Azul</option>
                                                <option value="Rosa">Rosa</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="categoria"><b>Categoria</b></label>
                                            <select required class="form-control" id="categoria" name="categoria">
                                                <option v-for="categoria in downloadConfigs.categorias" v-bind:value="categoria.id">{{ categoria.name }}</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="code"><b>Código do Produto *</b></label>

                                            <div style="display: flex; width: 100%; align-items: center; background: #e1e1e1">
                                                <input required maxlength="8" type="text" name="code" id="code" class="form-control">
                                                <span class="pointer" id="random_num" style="padding: 1px 10px; background: #e1e1e1" onclick="generate(8)"><i class="fa fa-random"></i></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="cst_CSOSN"><b>CST/CSOSN</b></label>
                                            <select required class="form-control" name="cst_CSOSN" id="cst_CSOSN">
                                                <option value="00">00 - Tributa Integralmente</option>
                                                <option v-for="(cst_cson, index) in downloadConfigs.listaCSTCSOSN" v-bind:value="index" v-if="index !== '00' ">{{ index }} - {{ cst_cson }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="cst_PIS"><b>CST PIS</b></label>
                                            <select required class="form-control" name="cst_PIS" id="cst_PIS">
                                                <option v-for="(cst_pis, index) in downloadConfigs.listaCST_PIS_COFINS" v-bind:value="index">{{ index }} - {{ cst_pis }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="cst_COFINS"><b>CST COFINS</b></label>
                                            <select required class="form-control" name="cst_COFINS" id="cst_COFINS">
                                                <option v-for="(cst_confins, index) in downloadConfigs.listaCST_PIS_COFINS" v-bind:value="index">{{ index }} - {{ cst_confins }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group all">
                                            <?= lang('category', 'category') ?>
                                            <?php
                                                $cat[''] = '';
                                                foreach ($categories as $category) {
                                                    $cat[$category->id] = $category->name;
                                                }
                                                echo form_dropdown('category', $cat, ($_POST['category'] ?? ($product ? $product->category_id : '')), 'class="form-control select" id="category" placeholder="' . lang('select') . ' ' . lang('category') . '" required="required" style="width:100%"')
                                            ?>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <?= lang('warehouse', 'qawarehouse'); ?>
                                            <?php
                                            $wh[''] = '';
                                            foreach ($warehouses as $warehouse) {
                                                $wh[$warehouse->id] = $warehouse->name;
                                            }
                                            echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : ($warehouse_id ? $warehouse_id : $Settings->default_warehouse)), 'id="qawarehouse" class="form-control input-tip select" data-placeholder="' . lang('select') . ' ' . lang('warehouse') . '" required="required" ' . ($warehouse_id ? 'readonly' : '') . ' style="width:100%;"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <?= lang('product_tax', 'tax_rate') ?>
                                            <?php
                                            $tr[''] = '';
                                            foreach ($tax_rates as $tax) {
                                                $tr[$tax->id] = $tax->name;
                                            }
                                            echo form_dropdown('tax_rate', $tr, ($_POST['tax_rate'] ?? ($product ? $product->tax_rate : $Settings->default_tax_rate)), 'class="form-control select" id="tax_rate" placeholder="' . lang('select') . ' ' . lang('product_tax') . '" style="width:100%"')
                                            ?>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="checkbox" name="hide" id="hide">
                                            <label for="hide" class="padding05"><b>Esconder na loja</b></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12" style="text-align: end; margin-top: 10px">
                                    <a onclick="$('#modal-cad').modal('toggle')" class="btn btn-danger">Fechar</a>
                                    <input type="submit" class="btn btn-success" value="Salvar Produto" />
                                </div>
                            </form>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/assets/packages/vue.min.js"></script>
<script src="/assets/packages/toastr.min.js"></script>
<script src="/assets/packages/jquery.inputmask.min.js"></script>
<script>
    const app = new Vue({
        el: "#app",
        data: {
            docs: '',
            remote_url: "<?= $remote_url ?>",
            initDate: "<?= date('Y-m-d', strtotime("-90 day", strtotime(date("Y-m-d")))) ?>",
            finalDate: "<?= date('Y-m-d') ?>",
            token: $("#csrf").val(),
            downloadConfigs: '',
            productToAdd: '',
            actChave: '',
            manifestChave: '',
        },
        methods: {
            submitXML: () => {
                const data = new FormData(document.querySelector("#import_xml_form"));

                axios.post("<?= $api_url ?>/import_xml", data).then(res=>{
                    console.log(res.data)
                    if(res.data.error) {
                        toastr.error(res.data.message, "Erro");
                    } else {
                        toastr.success(res.data.message, "Sucesso");
                    }
                })
            },
            filterManifest: function (type = $("#tipo").val()) {
                $.post('/validate/request', {
                    api_url: '/get_docs_filter',
                    token: this.token,
                    tipo: type,
                    data_inicial: this.formatDate(this.initDate),
                    data_final: this.formatDate(this.finalDate)
                }).then(res => {
                    this.docs = res.docs;
                    if (this.docs.length <= 0) {
                        toastr.warning("Nenhum registro encontado", 'Atenção');
                    } else {
                        toastr.success("Filtrado com sucesso", 'Sucesso');
                    }
                }).fail(err => {
                    toastr.error("Erro interno do servidor", 'Erro');
                    console.error(err.responseText);
                });
            },
            formatDate: function (dateString) {
                let day = dateString[8] + dateString[9];
                let mnth = dateString[5] + dateString[6];
                let year = dateString[0] + dateString[1] + dateString[2] + dateString[3];

                return `${day}/${mnth}/${year}`;
            },
            getNewDocuments: function () {
                $.post('/validate/request', {api_url: '/get_new_docs', token: this.token}).then(res => {
                    if (res.length <= 0 || typeof res.length === 'undefined') {
                        toastr.info(`0 Documentos novos encontrados`);
                    } else {
                        toastr.success(`Novos documentos novos encontrados`);
                        this.filterManifest(0);
                    }
                }).fail(err => {
                    toastr.error("Erro interno do servidor", 'Erro');
                    console.error(err.responseText);
                });
            },
            getDownloadConfigs: function (chave) {
                this.actChave = chave;

                axios.post("<?= $api_url ?>/get_download_configs/" + chave, {
                    token: this.token
                }).then(res => {
                    this.downloadConfigs = res.data;
                    console.log(res.data);
                    if(res.data.error) {
                        toastr.error(res.data.message, "Error");
                    } else {
                        $('#modal-completa').modal('show');
                    }
                }).catch(err => {
                    toastr.error("Erro interno do servidor", 'Erro');
                    console.error(err);
                });
            },
            number_format: function (number, decimals, dec_point, thousands_sep) {
                // Strip all characters but numerical ones.
                number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
                let n = !isFinite(+number) ? 0 : +number,
                    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                    s = '',
                    toFixedFix = function (n, prec) {
                        let k = Math.pow(10, prec);
                        return '' + Math.round(n * k) / k;
                    };
                // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
                if (s[0].length > 3) {
                    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                }
                if ((s[1] || '').length < prec) {
                    s[1] = s[1] || '';
                    s[1] += new Array(prec - s[1].length + 1).join('0');
                }
                return s.join(dec);
            },
            openCadModal: function (itemCod) {

                this.downloadConfigs.itens.forEach((element, index)=>{
                    if(element.codigo[0] == itemCod)
                        this.productToAdd = this.downloadConfigs.itens[index];
                })

                $('#modal-cad').modal('show');
            },
            addProduct: function(event){
                event.preventDefault();
                let data = this.getFormData($("#cadNewProduct"));

                $.post('fiscal/add_product', data).then(res=>{
                    if(!res.error) {
                        toastr.success(res.message, 'Sucesso');

                        $('#modal-cad').modal('toggle');
                        this.updateDownloadConfigs(this.actChave);
                    } else {
                        toastr.warning(res.message, 'Error');
                    }
                }).fail(err=>{
                    toastr.error('Erro interno do servidor.', 'Error');
                    console.error(err.responseText);
                })
            },
            getFormData: function($form){
                var unindexed_array = $form.serializeArray();
                var indexed_array = {};

                $.map(unindexed_array, function(n, i){
                    indexed_array[n['name']] = n['value'];
                });

                return indexed_array;
            },
            updateDownloadConfigs: function(chave)
            {
                $.post('/validate/request', {
                    api_url: `/get_download_configs/${chave}`,
                    token: this.token
                }).then(res => {
                    this.downloadConfigs = res;
                }).fail(err => {
                    toastr.error("Erro interno do servidor", 'Erro');
                    console.error(err.responseText);
                });
            },
            prepareManifest: function(chave) {
                this.manifestChave = chave;
            },
            manifest: function () {
                $.post('/validate/request', {
                    api_url: '/manifest',
                    token: this.token,
                    evento: $('#tipo_evento').val(),
                    chave: this.manifestChave
                }).then(res=>{
                    if(!res.error) {
                        toastr.success(res.message, 'Sucesso');
                    } else {
                        toastr.warning(res.message, 'Erro');
                        setTimeout(()=>{
                            location.reload();
                        }, 1500);
                    }
                }).fail(err=>{
                    toastr.error("Erro interno do servidor", 'Erro');
                    console.error(err.responseText)
                })
            },
            calcularValorVenda: function() {
                document.querySelector('#valor_venda').value = document.querySelector("#valor_compra").value / document.querySelector('#conversao_estoque').value;
            }

        },
        created: function () {
            $.post('/validate/request', {api_url: '/get_docs', token: this.token}).then(res => {
                this.docs = res.docs;
            }).fail(err => {
                toastr.error("Erro interno do servidor", 'Erro');
                console.error(err.responseText);
            });
        }
    })

    $(document).on('hidden.bs.modal', function (event) {
        if ($('.modal:visible').length) {
            $('body').addClass('modal-open');
        }
    });
</script>
<script>
    function generate(n) {
        var add = 1, max = 12 - add;   // 12 is the min safe number Math.random() can generate without it starting to pad the end with zeros.

        if ( n > max ) {
                return generate(max) + generate(n - max);
        }

        max        = Math.pow(10, n+add);
        var min    = max/10; // Math.pow(10, n) basically
        var number = Math.floor( Math.random() * (max - min + 1) ) + min;

        $("#code").val(("" + number).substring(add)); 
    }

    function getTipoEvento(el)
    {
        if(el.value == 3 || el.value == 4) {
            $("#div-just").slideDown();
        }  else {
            $("#div-just").slideUp();
        }
    }
</script>