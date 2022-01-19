

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://sdk.mercadopago.com/js/v2"></script>
    <script type="text/javascript" src="<?= $assets; ?>mp/js/index.js" defer></script>
    
    <link href="<?= $assets; ?>mp/css/index.css" rel="stylesheet">

    <main>
      <!-- Shopping Cart -->
      <section class="shopping-cart dark">
        <div class="container" id="container">
          <div class="block-heading">
            <h2>Carrinho</h2>
          </div>
          <div class="content">
            <div class="row">
              <div class="col-md-12 col-lg-8">
                <div class="items">
                  <div class="product">
                    <div class="info">
                      <?php
                      $total = 0;
                      foreach ($rows as $row): $total+= $row->subtotal;?>
                      <div class="product-details mb-2">
                        <div class="row justify-content-md-center">
                          <div class="col-md-3">
                              <img alt="" src="<?= base_url() ?>assets/uploads/thumbs/<?= $row->image ?>">
                            </div>
                          <div class="col-md-4 product-detail">
                            <h5>Produto</h5>
                            <div class="product-info">
                              <p><b>Descrição: </b><span id="product-description"><?= $row->product_name ?></span><br>
                              <b>Valor:</b> R$ <span class="unit-price"><?= $row->subtotal ?></span></p>
                            </div>
                            <input type="hidden" id="quantity" value="1" min="1" class="form-control">
                            <input type="hidden" id="order_id" value="<?= $id ?>">
                          </div>
                        </div>
                      </div>
                      <?php endforeach; ?>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-lg-4">
                <div class="summary">
                  <h3>Resumo</h3>
                  <div class="summary-item"><span class="text">Subtotal</span><span class="price"> <?= $total ?></span></div>
                  <button class="btn btn-primary btn-lg btn-block" id="checkout-btn">Finalizar</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--payment-->
      <section class="payment-form dark">
        <div class="container_payment">
          <div class="block-heading">
            <h2>Pagamento</h2>
          </div>
          <div class="form-payment">
            <div class="products">
              <div class="item">
                <?php foreach ($rows as $row):?>
                <span class="price" id="summary-price"></span>
                <p class="item-name"><?= $row->product_name ?><span> <?= $row->subtotal ?></span></p>
                <?php endforeach; ?>
              </div>

              <div class="total">Total<span class="price">R$ <?= $total ?></span></div>
            </div>
            <div class="payment-details">
              <div class="form-group col-sm-12">
                <br>      
                <div id="button-checkout">
                </div>                 
                <br>
    
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- footer -->
    </main>
    <footer>
      <div class="footer_logo"><img id="horizontal_logo" src="<?= $assets; ?>mp/img/horizontal_logo.png"></div>
        </footer>
  </body>
