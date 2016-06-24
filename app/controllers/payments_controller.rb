class PaymentsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  
  # Create a Customer
  customer = Stripe::Customer.create(
    :source=> token,
    :descrption => "Example customer"
    )

  # Charge the Customer instead of the card
  
   Stripe::Charge.create(
      :amount => 1000, # amount in cents, again
      :currency => "usd",
      :source => token,
      :customer => customer.id
    )

  if charge.paid
    Order.create()
  end

  Stripe::Charge.create(
    :amount => 1500, # $15.00 this time
    :currency => "usd",
    :customer => customer_id #Previously stored, then retrieved
    )

  rescue Stripe::CardError => e
    # The card has beenS declined
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
   product_path(product)
end
end