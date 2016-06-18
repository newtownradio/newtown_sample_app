if Rails.env.production?
		  Rails.configuration.stripe = {
		    :publishable_key => ENV['pk_test_kCrAjvgE32B3QsJAva3PReLz'],
		    :secret_key => ENV['sk_test_xJhfiGJna976j9YcyjiFA625']
		  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_live_tfxdzdMJNGdf1heLMRDDWCT5',
    :secret_key => ' sk_live_I5waNpGXHtkqDQ5rBqmvfJGW'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]