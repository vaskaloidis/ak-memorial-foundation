# -*- encoding: utf-8 -*-

require 'rails_helper'

RSpec.describe 'golfer package feature' do

  describe 'authenticating first' do
    let(:user) {create(:user)}

    around(:example) do |test|
      test.run
      sign_in user
      test.run
      sign_out user
    end

  end

  end