# -*- encoding: utf-8 -*-

require 'spec_helper'

describe AdminMailer do
  before(:context) do
    @user = create(:user)
    @admin = create(:admin)
    @purchase = create(:purchase, user: @user, product: Product.golf_package)
    expect(@purchase).to be_valid
  end

  context 'authenticated user' do
    it 'sends an admin purchase notification' do
      sign_in @admin
      # We are testing the Deliver-Later feature for Active-Job too here!
      # result = AdminMailer.with(purchase: purchase.id).purchase_notification.deliver_now if purchase.valid?
      result = AdminMailer.with(purchase: @purchase.id).purchase_notification.deliver_later
      expect(result).not_to be_nil
      sign_out @admin
    end
    it 'sends a user purchase notification' do
      AdminMailer.with(purchase: purchase.id).purchase_notification.deliver_later
      admin_mailer = AdminMailer.new
      result = admin_mailer.purchase_notification
      expect(result).not_to be_nil
    end
  end

  context 'unauthenticated user' do
    describe 'sends a registration notification' do
      it 'works' do
        result = AdminMailer.with(customer_id: @user.id).registration_notifications.deliver_later
        expect(result).not_to be_nil
      end
    end

    describe 'sends a quick-purchase and registration notification' do
      it 'works' do
        result = AdminMailer.with(customer_id: @user.id).registration_notifications.deliver_now
        expect(result).not_to be_nil
        result = AdminMailer.with(purchase: @purchase.id).purchase_notification.deliver_now
        expect(result).not_to be_nil
      end
    end
  end

end
