if Rails.env.production?
		  Rails.configuration.stripe = {
		    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		    :secret_key => ENV['STRIPE_SECRET_KEY']
		  }
else
  Rails.configuration.stripe = {
    :publishable_key => [pk_test_kCrAjvgE32B3QsJAva3PReLz],
    :secret_key => [sk_test_xJhfiGJna976j9YcyjiFA625]
    } 
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]