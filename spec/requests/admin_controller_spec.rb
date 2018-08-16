# -*- encoding: utf-8 -*-

require 'rails_helper'

describe 'AdminController', :type => :request do
  before(:context) do
    @user = create(:user)
    @admin = create(:admin, admin: true)
    puts 'Creating users'
  end

  context 'administrator accessing' do
    before(:context) do
      sign_in @admin
    end

    it 'should load the admin panel' do
        get admin_url
        expect(response).to have_http_status(:success)
    end

    after(:context) do
      sign_out @admin
    end
  end

end
