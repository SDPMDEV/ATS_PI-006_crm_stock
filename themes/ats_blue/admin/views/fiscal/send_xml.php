<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="/assets/packages/toastr.css"/>
<div class="container" id="app">
    <fieldset class="scheduler-border">
        <legend class="scheduler-border">Listagem de xml</legend>

        <form id="form-filter">


            <input type="hidden" name="ajax" value="1">
            <input required type="hidden" id="csrf" name="<?= $this->security->get_csrf_token_name() ?>" value="<?= $this->security->get_csrf_hash() ?>">
            <input required type="hidden" name="api_url" value="/filter_xml">

            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <span>Data inicial</span>
                        <br>
                        <input class="form-control" type="date" name="data_inicial" id="data_inicial" >
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="form-group">
                        <span>Data final</span>
                        <br>
                        <input class="form-control" type="date" name="data_final" id="data_final">
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="form-group" style="margin-top: 20px">
                        <input type="submit" value="Filtrar" class="btn btn-info">
                    </div>
                </div>
            </div>
        </form>
    </fieldset>

    <div v-if="allXML.length > 0">
        <hr>

        <div class="row">
            <div class="col-md-12">
                <b style="text-align: start">Total de arquivos de NFCe: <span style="color: #0eaad6">{{ allXML.length }}</span></b>      
                <div style="text-align: end">                
                    <a type="button" v-bind:href="downloadNfceLink" id="btn-baixarXML" class="btn btn-info">Baixar Arquivos XML (NFCe)</a>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 50px; width: 100%">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Venda ID</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Valor</th>
                        <th scope="col">Chave</th>
                        <th scope="col">Data</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="xml in allXML">
                        <td style="text-align: center;">{{ xml.id }}</td>
                        <td style="text-align: center;">{{ xml.customer }}</td>
                        <td style="text-align: center;">{{ xml.grand_total }}</td>
                        <td style="text-align: center;">{{ xml.chave }}</td>
                        <td style="text-align: center;">{{ xml.date }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div v-if="xmlNfe.length > 0">
        <hr>

        <div class="row">
            <div class="col-md-12">
                <b style="text-align: start">Total de arquivos de NFe: <span style="color: #0eaad6">{{ xmlNfe.length }}</span></b>
                <div style="text-align: end">
                    <a type="button" v-bind:href="downloadNfeLink" id="btn-baixarXML" class="btn btn-info">Baixar Arquivos XML (NFe)</a>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 50px; width: 100%">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Venda ID</th>
                    <th scope="col">Cliente</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Chave</th>
                    <th scope="col">Data</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="xml in xmlNfe">
                    <td style="text-align: center;">{{ xml.id }}</td>
                    <td style="text-align: center;">{{ xml.customer }}</td>
                    <td style="text-align: center;">{{ xml.grand_total }}</td>
                    <td style="text-align: center;">{{ xml.chave }}</td>
                    <td style="text-align: center;">{{ xml.date }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/assets/packages/toastr.min.js"></script>
<script src="/assets/packages/vue.min.js"></script>
<script>
    
    function getFormData($form){
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function(n, i){
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    

    const app = new Vue({
        el: "#app",
        data: {
            allXML: [],
            xmlNfe: [],
            chavesNfce: [],
            chavesNfe: [],
            downloadNfceLink: window.location.origin + '/api_fiscal/api/download/pos/xml?',
            downloadNfeLink: window.location.origin + '/api_fiscal/api/download/pos/xml?',
            notFound: false
        }
    });

    $('#form-filter').submit(e=>{
        e.preventDefault();

        $.post('/validate/request', getFormData( $('#form-filter') )).then(res=>{
            console.log(res)
            if(res.xmlNfce.length <= 0) {
                app.notFound = true;
                app.allXML = [];
                app.xmlNfe = [];
                toastr.error(`Nenhum registro encontrado.`, "Erro");
            } else {
                app.notFound = false;
                app.allXML = res.xmlNfce;
                app.xmlNfe = res.xml;
                app.chavesNfce = res.chavesNfce;
                app.chavesNfe = res.chavesNfe;

                app.chavesNfce.forEach(value => {
                    app.downloadNfceLink += '&chaves='+value
                })

                app.chavesNfe.forEach(value => {
                    app.downloadNfeLink += '&chaves='+value
                })

                toastr.success(`${app.allXML.length} registros encontrados.`, "Sucesso");
            }
        }).fail(err=>{
            console.log(err.responseText);
        })
    });

    $(document).ready(()=> {
        const today = new Date();

        let dd = (today.getDate() < 10) ? "0"+today.getDate() : today.getDate();
        let mm = today.getMonth()+1;
        let yyyy = today.getFullYear();


        const priorDate = new Date();

        const previous = new Date(priorDate.setDate(today.getDate()-30));

        let dd30 = (previous.getDate() < 10) ? "0"+previous.getDate() : previous.getDate();
        let mm30 = previous.getMonth()+1;
        let yyyy30 = previous.getFullYear();

        if(mm < 10) {
            mm = '0'+mm;
        }

        if(mm30 < 10) {
            mm30 = '0'+mm30;
        }

        document.querySelector("#data_final").value =  yyyy+"-"+mm+"-"+dd;
        document.querySelector("#data_inicial").value = yyyy30+"-"+mm30+"-"+dd30;
    })
</script>