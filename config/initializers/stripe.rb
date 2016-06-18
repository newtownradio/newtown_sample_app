if Rails.env.production?
		  Rails.configuration.stripe = {
		    :publishable_key => ENV[pk_live_tfxdzdMJNGdf1heLMRDDWCT5],
		    :secret_key => ENV[sk_live_I5waNpGXHtkqDQ5rBqmvfJGW]
		  }
else
  Rails.configuration.stripe = {
    :publishable_key => pk_test_kCrAjvgE32B3QsJAva3PReLz Roll Key
,
    :secret_key => sk_test_xJhfiGJna976j9YcyjiFA625 }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]