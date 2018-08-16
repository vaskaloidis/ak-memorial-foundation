# -*- encoding: utf-8 -*-

require 'rails_helper'

describe 'ChargesController', :type => :request do
  before(:context) do
    @user = create(:user)
  end
  before(:each) do
    @stripe_helper = StripeMock.create_test_helper
    StripeMock.start
  end

  context 'authenticated user' do
    before(:context) do
      sign_in @user
      @shopping_cart = populate_cart
    end
    it 'views new charges form' do
      get new_charge_url
      expect(response).to have_http_status(:success)
    end

    it 'creates a charge' do
      post charges_url,
           params: {
               stripeToken: @stripe_helper.generate_card_token
           }
      expect(response).to have_http_status(:success)
    end

    after(:context) do
      @user.shopping_cart.delete_all
      sign_out @user
    end
  end

  context 'unauthenticated user (quick-purchase sponsorship)' do
    before(:context) do
      @product = Product.sponsor.first
      @new_user = attributes_for(:base_user)
    end

    it 'views new charges form' do
      get new_charge_url(@product)
      expect(response).to have_http_status(:success)
    end

    it 'creates a charge' do
      post charges_url(@product),
        params: {
          total_charge: @product.price,
          user: @new_user,
          stripeToken: @stripe_helper.generate_card_token
        }
      expect(response).to have_http_status(:success)
    end

    after(:each) do
      StripeMock.stop
    end
  end

  # Populates the shopping cart with items
  # TODO: Consolidate this with cart_spec
  #
  def populate_cart
    shopping_cart = []
    shopping_cart << create(:shopping_cart, user: @user, product: Product.golf_package)
    shopping_cart << create(:shopping_cart, user: @user, product: Product.sponsor.first)
    shopping_cart << create(:shopping_cart, user: @user, product: Product.sponsor.second)
    shopping_cart
  end
end
