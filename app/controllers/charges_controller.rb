class ChargesController < ApplicationController
  def new
    @total_charge = current_user.cart_total
    @shopping_carts = current_user.shopping_cart
  end

  def create
    # Amount in cents
    @amount_dollars = current_user.cart_total
    @amount = (current_user.cart_total * 100)

    charge = Stripe::Charge.create(
        :source => params[:stripeToken],
        :amount => @amount.round,
        :description => 'Athan Kaloidis Memorial Golf Tournament',
        :currency => 'usd'
    )

    current_user.shopping_cart.each do |item|
      purchase = Purchase.new
      purchase.user = current_user
      purchase.product = item.product
      purchase.product_category = item.product.category
      purchase.save
    end


    # Empty Shopping Cart Last
    current_user.shopping_cart.delete_all
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end
end
