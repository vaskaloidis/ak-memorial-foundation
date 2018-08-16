# -*- encoding: utf-8 -*-

require 'rails_helper'

describe 'PurchasesController', :type => :request do
  before(:context) do
    @user = create(:user)
    @admin = create(:admin, admin: true)
    # @purchase = create(:purchase, user: @user, product: Product.golf_package)
    # @purchase2 = create(:purchase, user: @user, product: Product.sponsor.first)
    @golf_package = Product.golf_package
  end

  describe 'admin' do
    before(:context) do
      sign_in @admin
      puts 'Signing in Admin'
    end

    it 'views all purchases' do
      get purchases_url
      expect(response).to have_http_status(:success)
    end

    it 'views a purchase' do
      get purchase_url(@purchase)
      expect(response).to have_http_status(:success)
    end

    it 'views new purchase form' do
      get new_purchase_url
      expect(response).to have_http_status(:success)
    end

    it 'creates a new purchase' do
      post purchase_url, params: {purchase: {
          product_id: "#{@golf_package.id}",
          user_id: "#{@user.id}",
          admin_id: "#{@admin.id}",
          note: 'new-purchase-note'
      }}
      expect(response).to redirect_to(purchases_url)
      #TODO: Check Flash Message here
      purchase = Purchase.last
      expect(purchase.user.id).to equal(@user.id)
      expect(purchase.admin.id).to equal(@admin.id)
      expect(purchase.product.id).to equal(@golf_package.id)
      expect(purchase.note).to equal('new-purchase-note')
    end

    it 'edits a purchase' do
      purchase = create(:purchase, user: @user, admin: @admin, product: Product.golf_package)
      get edit_purchase_url(purchase)
      expect(response).to have_http_status(:success)
    end

    it 'updates a purchase' do
      purchase = create(:purchase, user: @user, admin: @admin, product: Product.golf_package)
      user2 = create(:user)
      expect(purchase.user.id).to equal(@user.id)
      expect(purchase.admin.id).to equal(@admin.id)
      expect(purchase.product.id).to equal(Product.golf_package.id)
      patch purchase_url(purchase), params: {purchase: {
          user_id: user2.id,
          product_id: Product.sponsor.first.id,
          note: 'new-update-note'
      }}
      expect(response).to redirect_to(purchases_url)
      # TODO: Check Flash Message here
      purchase.reload
      expect(purchase.user.id).to equal(user2.id)
      expect(purchase.admin.id).to equal(@admin.id)
      expect(purchase.product.id).to equal(Product.sponsor.first.id)
      expect(purchase.note).to equal('new-update-note')
    end

    it 'deletes an account with DELETE' do
      delete_purchase = create(:purchase)
      delete purchase_url(delete_purchase)
      expect(response).to redirect_to(purchases_url)
      # TODO: Check the Flash
      delete_purchase.reload
      expect(delete_purchase.discarded?).to be true
    end

    after(:context) do
      puts 'Signing out Admin'
      sign_out @admin
    end
  end

end
