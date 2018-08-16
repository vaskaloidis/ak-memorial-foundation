# -*- encoding: utf-8 -*-

require 'rails_helper'

describe 'SessionsController', :type => :request do
  before(:context) do
    # request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it 'views the login page' do
    get new_user_session_url
    expect(response).to have_http_status(:success)
  end

end
