###
var stripe = Stripe(INSERT STRIPE KEY);
var elements = stripe.elements();

var card = elements.create('card');

card.mount('#card-element');

function stripeTokenHandler(token) {
  var form = document.getElementById('payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  form.submit();
}

function createToken() {
  stripe.createToken(card).then(function(result) {
  if (result.error) {
      // Inform the user if there was an error
        var errorElement = document.getElementById('card-errors');
        errorElement.textContent = result.error.message;
    } else {
    // Send the token to your server
    stripeTokenHandler(result.token);
  }
  });

var form = document.getElementById('payment-form');
form.addEventListener('submit', function(e) {
  e.preventDefault();
  createToken();
});
###

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  purchase.setupForm()

purchase =
  setupForm: ->
    $('#new_purchase').submit ->
      $('input[type=submit]').prop('disabled', true)
      if carduse == "existingcustomer"
        true        
      else
        if $('#card_number').length
          purchase.processCard()
          false
        else
          true

  processCard: ->
    card =
      {number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()}
    Stripe.createToken(card, purchase.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#purchase_stripe_card_token').val(response.id)
      $('#new_purchase')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)