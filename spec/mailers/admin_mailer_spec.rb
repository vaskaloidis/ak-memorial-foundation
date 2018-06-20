# -*- encoding: utf-8 -*-

require 'spec_helper'

describe AdminMailer do

  # TODO: auto-generated
  describe '#registration_notifications' do
    it 'works' do
      admin_mailer = AdminMailer.new
      result = admin_mailer.registration_notifications
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#purchase_notification' do
    it 'works' do
      admin_mailer = AdminMailer.new
      result = admin_mailer.purchase_notification
      expect(result).not_to be_nil
    end
  end

end
