// Add SDK credentials
// REPLACE WITH YOUR PUBLIC KEY AVAILABLE IN: https://developers.mercadopago.com/panel
const mercadopago = new MercadoPago('TEST-74c772f4-e009-4370-9e98-29d00279a226', {
  locale: 'pt-BR' // The most common are: 'pt-BR', 'es-AR' and 'en-US'
});

// Handle call to backend and generate preference.
document.getElementById("checkout-btn").addEventListener("click", function() {

  $('#checkout-btn').attr("disabled", true);

   var data = {};
    data[site.csrf_token] = site.csrf_token_value;
    data['order_id'] =  document.getElementById("order_id").value;

    data['filters'] = get_filters();
    data['format'] = 'json';
    $.ajax({ url: site.site_url + 'payment/mp', type: 'POST', data: data, dataType: 'json' })
    .done(function(preference)  {
        createCheckoutButton(preference.id);
        
        $(".shopping-cart").fadeOut(500);
        setTimeout(() => {
            $(".container_payment").show(500).fadeIn();
        }, 500);
    }).fail(function(preference)  {
           alert("Unexpected error");
        $('#checkout-btn').attr("disabled", false);
    }); 

});

// Create preference when click on checkout button
function createCheckoutButton(preferenceId) {
  // Initialize the checkout
  mercadopago.checkout({
    preference: {
      id: preferenceId
    },
    render: {
      container: '#button-checkout', // Class name where the payment button will be displayed
      label: 'Pagar', // Change the payment button text (optional)
    }
  });
}

// Handle price update
function updatePrice() {
  let quantity = document.getElementById("quantity").value;
  let unitPrice = document.getElementById("unit-price").innerHTML;
  let amount = parseInt(unitPrice) * parseInt(quantity);

  document.getElementById("cart-total").innerHTML = "R$ " + amount;
  document.getElementById("summary-price").innerHTML = "R$ " + unitPrice;
  document.getElementById("summary-total").innerHTML = "R$ " + amount;
}

document.getElementById("quantity").addEventListener("change", updatePrice);
updatePrice();  