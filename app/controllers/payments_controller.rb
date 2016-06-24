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
  @product=params[:product_id]
  begin
  @user=user_signed_in?
  @user=current_user
    charge = Stripe::Charge.create(
      :amount => 1000, # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail]
      :redirect_to @product_path(@product)
    )
      :description => params[:stripeEmail]

  if charge.paid
    Order.create()
  end
...
  rescue Stripe::CardError => e
    # The card has beenS declined
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  redirect_to product_path(product)
end
end