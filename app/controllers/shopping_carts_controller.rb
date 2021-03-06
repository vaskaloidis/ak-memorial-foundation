class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: [:show, :edit, :update, :destroy]

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    if signed_in?
      @shopping_carts = current_user.shopping_cart
    end
  end

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  def show
  end

  def add_donation_to_cart
    @shopping_cart = ShoppingCart.new
    @shopping_cart.user = User.find(params[:user_id])
    @shopping_cart.product = Product.find(params[:product_id])
    @shopping_cart.amount = params[:amount]

    respond_to do |format|
      if @shopping_cart.save

        @shopping_carts = current_user.shopping_cart

        format.html {redirect_to shopping_carts_path, notice: 'Product Added To Cart'}
        format.json {render :show, status: :created, location: @shopping_cart}
      else
        format.html {render :new}
        format.json {render json: @shopping_cart.errors, status: :unprocessable_entity}
      end
    end
  end

  def add_product_to_cart
    @shopping_cart = ShoppingCart.new
    @shopping_cart.user = User.find(params[:user_id])
    @shopping_cart.product = Product.find(params[:product_id])
    @shopping_cart.amount = @shopping_cart.product.price

    respond_to do |format|
      if @shopping_cart.save

        @shopping_carts = current_user.shopping_cart

        format.html {redirect_to shopping_carts_path, notice: 'Product Added To Cart'}
        format.json {render :show, status: :created, location: @shopping_cart}
      else
        format.html {render :new}
        format.json {render json: @shopping_cart.errors, status: :unprocessable_entity}
      end
    end
  end

  # GET /shopping_carts/new
  def new
    @shopping_cart = ShoppingCart.new
    @shopping_cart.user = User.find(params[:user_id])
    @shopping_cart.product = Product.find(params[:product_id])

    respond_to do |format|
      if @shopping_cart.save

        @shopping_carts = current_user.shopping_cart

        format.html {redirect_to shopping_carts_path, notice: 'Product Added To Cart'}
        format.json {render :show, status: :created, location: @shopping_cart}
      else
        format.html {render :new}
        format.json {render json: @shopping_cart.errors, status: :unprocessable_entity}
      end
    end
  end

  # GET /shopping_carts/1/edit
  def edit
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    @shopping_cart.amount = Product.find(params[:product_id]).amount

    respond_to do |format|
      if @shopping_cart.save
        format.html {redirect_to @shopping_cart, notice: 'Shopping cart was successfully created.'}
        format.json {render :show, status: :created, location: @shopping_cart}
      else
        format.html {render :new}
        format.json {render json: @shopping_cart.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /shopping_carts/1
  # PATCH/PUT /shopping_carts/1.json
  def update
    respond_to do |format|
      if @shopping_cart.update(shopping_cart_params)
        format.html {redirect_to @shopping_cart, notice: 'Shopping cart was successfully updated.'}
        format.json {render :show, status: :ok, location: @shopping_cart}
      else
        format.html {render :edit}
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
