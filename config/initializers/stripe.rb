Rails.configuration.stripe = {
  :publishable_key => 'pk_test_geufYBE595yJfHOBtx1ukSGt',
  :secret_key      => 'sk_test_04w1amZyr5HXuQwaUqvN9nNU'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]