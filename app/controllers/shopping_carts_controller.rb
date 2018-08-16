class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shopping_cart, only: [:destroy]

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index; end

  def add_product_to_cart
    @shopping_cart = ShoppingCart.new
    @shopping_cart.user = current_user
    @shopping_cart.product = Product.find(params[:product_id])
    @shopping_cart.amount = @shopping_cart.product.price
    respond_to do |format|
      if @shopping_cart.save
        @shopping_carts = current_user.shopping_cart
        format.html {redirect_to shopping_carts_path, notice: 'Product Added To Cart'}
        format.json {render json, status: :created, location: @shopping_cart}
      else
        format.html {render :index}
        format.json {render json: @shopping_cart.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    @shopping_cart.destroy
    respond_to do |format|
      format.html {redirect_to shopping_carts_url, notice: 'Product Removed From Cart'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_shopping_cart
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shopping_cart_params
    params.require(:shopping_cart).permit(:user_id)
  end
end
