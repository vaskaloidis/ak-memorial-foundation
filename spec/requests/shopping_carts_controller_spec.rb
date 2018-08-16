# -*- encoding: utf-8 -*-

require 'rails_helper'

describe 'ShoppingCartsController', :type => :request do
  before(:context) do
    @user = create(:user)
    @shopping_cart = populate_cart
  end

  context 'authenticated user' do
    before(:each) do
      sign_in @user
    end

    it 'view shopping-cart' do
      get shopping_carts_url
      expect(response).to have_http_status(:success)
    end

    it 'adds a golf-package to cart' do
      get add_product_to_user_cart_url(Product.golf_package)
      expect(response).to redirect_to shopping_carts_path
      expect(@user.shopping_cart_item).to.includes(Product.golf_package)
    end

    it 'adds a product to cart' do
      get add_product_to_user_cart_url(Product.sponsor.third)
      expect(response).to redirect_to shopping_carts_path
      expect(@user.shopping_cart_item).to.includes(Product.sponsor.third)
    end

    it 'deletes a product from shopping-cart' do
      cart_item = create(:shopping_cart, user: @user, product: Product.golf_package)
      delete shopping_cart_url(cart_item)
      expect(response).to have_http_status(:success)
      expect(@user.shopping_cart).not_to include(cart_item)
    end

    after(:each) do
      sign_out @user
    end
  end

  # Populates the shopping cart with items
  # TODO: Move this (dup code in charges spec)
  #
  def populate_cart
    shopping_cart = []
    shopping_cart << create(:shopping_cart, user: @user, product: Product.golf_package)
    shopping_cart << create(:shopping_cart, user: @user, product: Product.sponsor.first)
    shopping_cart << create(:shopping_cart, user: @user, product: Product.sponsor.second)
    shopping_cart
  end
end
