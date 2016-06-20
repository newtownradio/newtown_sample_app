if Rails.env.production?
		  Rails.configuration.stripe = {
		    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		    :secret_key => ENV['STRIPE_SECRET_KEY']
		  }
else
  Rails.configuration.stripe = {
    :publishable_key => [pk_live_tfxdzdMJNGdf1heLMRDDWCT5],
    :secret_key => [sk_live_I5waNpGXHtkqDQ5rBqmvfJGW]
    } 
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]