# -*- encoding: utf-8 -*-

require 'rails_helper'

describe ApplicationController do

  # TODO: auto-generated
  describe 'GET after_sign_in_path_for' do
    it 'works' do
      get :after_sign_in_path_for, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
