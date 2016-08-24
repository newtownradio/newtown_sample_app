class PaymentsController < ApplicationController
  layout "mailer"
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )

      if charge.paid
        UserMailer.thank_you
        Order.create(
          :product_id => @product.id,
          :user_id => @user,
          :total => @product.price
        )
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product), notice: "Thank you for your purchase"
  end

  def thank_you(user)
    UserMailer.contact_form(user.name, user.email, "Thank you!").deliver_now
  end
end

