# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Product do

  describe 'Domain Data' do
    it 'exists' do
      expect(Product.golf_package).to be true
    end
    it 'does not exist' do
      result = User.account_exists?('email_does_not_exist@gmail.com')
      expect(result).to be false
    end
  end

end
