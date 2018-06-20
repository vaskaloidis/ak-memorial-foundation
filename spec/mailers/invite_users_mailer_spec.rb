# -*- encoding: utf-8 -*-

require 'spec_helper'

describe InviteUsersMailer do

  # TODO: auto-generated
  describe '#invite_users' do
    it 'works' do
      invite_users_mailer = InviteUsersMailer.new
      invite = double('invite')
      result = invite_users_mailer.invite_users(invite)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#notify_registered' do
    it 'works' do
      invite_users_mailer = InviteUsersMailer.new
      registered = double('registered')
      result = invite_users_mailer.notify_registered(registered)
      expect(result).not_to be_nil
    end
  end

end
