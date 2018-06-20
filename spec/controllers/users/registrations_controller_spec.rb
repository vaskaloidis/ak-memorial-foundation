# -*- encoding: utf-8 -*-

require 'rails_helper'

describe RegistrationsController do

  # TODO: auto-generated
  describe 'POST create' do
    it 'works' do
      post :create, {}, {}
      expect(response.status).to eq(200)
    end
  end

  # TODO: auto-generated
  describe 'PUT update' do
    it 'works' do
      put :update, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
