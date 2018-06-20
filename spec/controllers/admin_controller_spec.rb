# -*- encoding: utf-8 -*-

require 'rails_helper'

describe AdminController do

  # TODO: auto-generated
  describe 'GET quick_purchase_golfer_package' do
    it 'works' do
      get :quick_purchase_golfer_package, {}, {}
      expect(response.status).to eq(200)
    end
  end

  # TODO: auto-generated
  describe 'GET quick_purchase_sponsorship' do
    it 'works' do
      get :quick_purchase_sponsorship, {}, {}
      expect(response.status).to eq(200)
    end
  end

  # TODO: auto-generated
  describe 'GET home' do
    it 'works' do
      get :home, {}, {}
      expect(response.status).to eq(200)
    end
  end

  # TODO: auto-generated
  describe 'GET create_user' do
    it 'works' do
      get :create_user, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
