# -*- encoding: utf-8 -*-

require 'rails_helper'

RSpec.describe 'MainController tests', :type => :request do

  describe 'unauthenticated and then authenticated requests' do
    let(:user) {create(:user)}

    # Test Unauthenticated and then Authenticated
    around(:example) do |test|
      test.run
      sign_in user
      test.run
      sign_out user
    end

    it 'executes a GET request for home' do
      get root_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for about' do
      get about_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for donate' do
      get donate_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for childrens_exhibit' do
      get childrens_exhibit_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for golf_tournament' do
      get golf_tournament_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for legacy' do
      get legacy_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for supporters' do
      get supporters_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for twenty_fifteen_gallery' do
      get twenty_fifteen_gallery_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for twenty_ten_gallery' do
      get twenty_ten_gallery_url
      expect(response).to have_http_status(:success)
    end

    it 'executes a GET request for athan_gallery' do
      get athan_gallery_url
      expect(response).to have_http_status(:success)
    end
  end

end
