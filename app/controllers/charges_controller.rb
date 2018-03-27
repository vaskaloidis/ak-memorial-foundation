class ChargesController < ApplicationController
  def new

    flash.keep

    if signed_in?
      @total_charge = current_user.cart_total
      @shopping_carts = current_user.shopping_cart
    else
      @product = Product.find(params[:product_id])
      @total_charge = @product.price
    end

  end

  def create

    flash.keep

    if signed_in?

      # Amount in cents
      @amount_dollars = current_user.cart_total
      @amount = (current_user.cart_total * 100)

      charge = Stripe::Charge.create(
          :source => params[:stripeToken],
          :amount => @amount.round,
          :description => 'Athan Kaloidis Memorial Foundation, LLC. Donation',
          :currency => 'usd'
      )

      current_user.shopping_cart.each do |item|
        purchase = Purchase.new
        purchase.user = current_user
        purchase.product = item.product
        purchase.product_category = item.product.category
        purchase.amount = item.amount
        purchase.save
      end

      current_user.shopping_cart.delete_all
    else
      # Amount in cents
      @amount_dollars = params[:total_charge].to_d
      @amount = (@amount_dollars * 100.00)
      @product = Product.find(params[:product_id])

      u = User.new(user_params)
      u.admin = false

      if u.save

        charge = Stripe::Charge.create(
            :source => params[:stripeToken],
            :amount => @amount.round,
            :description => 'Athan Kaloidis Memorial Foundation, LLC. Donation',
            :currency => 'usd'
        )

        logger.info("Stripe Charge Made - " + @amount.round.to_s)
        logger.info(charge)

        purchase = Purchase.new
        purchase.user = u
        purchase.product = @product
        purchase.product_category = @product.category
        purchase.amount = @product.price
        purchase.save

        sign_in(:user, u)

      else
        logger.error("There was an error creating the user during Quick Purchase, Stripe Checkout")
        logger.error(u.errors.full_messages)
        error_msg = ''
        u.errors.full_messages.each_with_index do |e, count|
          error_msg = error_msg + e.to_s
          if count != 0
            error_msg = error_msg + '<br>'
          end
        end
        flash.keep
        redirect_to(quick_purchase_path(@product.id), {:flash => { :error => error_msg }})
      end

    end


      # Empty Shopping Cart Last
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :company_name, :company_published_name, :company_website, :phone)
  end

end
