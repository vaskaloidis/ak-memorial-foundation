# -*- encoding: utf-8 -*-

require 'rails_helper'

describe 'RegistrationsController', :type => :request do
  before(:context) do
    # request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it 'views the registration page' do
    get new_user_registration_url
    expect(response).to have_http_status(:success)
  end

  # it 'registers the user' do
  #   registration_params = attributes_for(:user_registration)
  #   post
  #   expect(response).to have_http_status(:success)
  # end

end
