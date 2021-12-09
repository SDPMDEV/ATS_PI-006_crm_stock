<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<div class="container" id="app">
    <fieldset class="scheduler-border">
        <legend class="scheduler-border">ENVIAR XML PARA O ESCRITÓRIO</legend>

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


    <hr>
    <b v-if="notFound" style="color: red; font-size: 20px">Nenhum arquivo encontrado</b>

    <div v-if="allXML.length > 0">
        <div class="row">
            <div class="col-md-12">
                <b style="text-align: start">Total de arquivos de NFCe: <span style="color: #0eaad6">{{ allXML.length }}</span></b>      
                <div style="text-align: end">                
                    <a type="button" href="<?= str_replace('/api', '', $remote_url) ?>/enviarXml/downloadNfce" id="btn-baixarXML" class="btn btn-info">Baixar Arquivos de XML NFCe</a>
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
                        <td scope="row" style="text-align: center;">{{ xml.id }}</td>
                        <td style="text-align: center;">{{ xml.razao_social }}</td>
                        <td style="text-align: center;">{{ xml.valor_total }}</td>
                        <td style="text-align: center;">{{ xml.chave }}</td>
                        <td style="text-align: center;">{{ xml.updated_at }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
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
            notFound: false
        }
    });

    $('#form-filter').submit(e=>{
        e.preventDefault();

        $.post('/validate/request', getFormData( $('#form-filter') )).then(res=>{
            if(res.xmlNfce.length <= 0) {
                app.notFound = true;
                app.allXML = [];
                toastr.error(`Nenhum registro encontrado.`, "Erro");
            } else {
                app.notFound = false;
                app.allXML = res.xmlNfce;
                toastr.success(`${app.allXML.length} registros encontrados.`, "Sucesso");
            }
        }).fail(err=>{
            console.log(err.responseText);
        })
    });

    


    const today = new Date();

    let dd = (today.getDate() < 10) ? "0"+today.getDate() : today.getDate();
    let mm = today.getMonth()+1;
    let yyyy = today.getFullYear();

    
    const priorDate = new Date();

    const previous = new Date(priorDate.setDate(today.getDate()-30));

    let dd30 = (previous.getDate() < 10) ? "0"+previous.getDate() : previous.getDate();
    let mm30 = previous.getMonth()+1;
    let yyyy30 = previous.getFullYear();

    document.querySelector("#data_final").value =  yyyy+"-"+mm+"-"+dd;
    document.querySelector("#data_inicial").value = yyyy30+"-"+mm30+"-"+dd30;
</script>