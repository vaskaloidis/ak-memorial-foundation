# -*- encoding: utf-8 -*-

require 'rails_helper'

describe 'UserController', :type => :request do
  before(:context) do
    @user = create(:user)
    @admin = create(:admin, admin: true)
  end

  describe 'admin' do
    before(:each) do
      sign_in @admin
    end

    it 'views their profile' do
      get user_url(@admin)
      expect(response).to have_http_status(:success)
    end

    it 'views a customer profile' do
      get user_url(@user)
      expect(response).to have_http_status(:success)
    end

    it 'views new customer form' do
      get new_user_url
      expect(response).to have_http_status(:success)
    end

    it 'creates a new user' do
      new_user = attributes_for(:user_update)
      post users_url, params: { user: new_user }
      expect(response).to have_http_status(:success)
      expect(response).to redirect_to(user_url(new_user))
    end

    it 'edits their profile' do
      get edit_user_url(@admin)
      expect(response).to have_http_status(:success)
    end

    it 'updates customer profile with patch' do
      user_update = attributes_for(:user_update)
      patch user_url(@user), params: { user: user_update }
      expect(response).to redirect_to(user_url(@user))
    end

    it 'deletes an account with DELETE' do
      delete_user = create(:user)
      delete user_url(delete_user), xhr: true
      expect(response).to have_http_status(:success)
    end
    after(:context) do
      puts 'Signing out Admin'
      sign_out @admin
    end
  end

  describe 'customers' do
    before(:context) do
      sign_in @user
      puts 'Signing in User'
    end

    it 'can view their profile' do
      get user_url(@user)
      expect(response).to have_http_status(:success)
    end

    it 'views their edit profile page' do
      get edit_user_url(@user)
      expect(response).to have_http_status(:success)
    end

    it 'update their profile' do
      patch user_url(@user), params: { user: { first_name: 'new-first-name'} }
      expect(response).to have_http_status(:success)
      expect(response).to redirect_to(user_url(@user))
    end

    after(:each) do
      sign_out @user
    end
  end

end
