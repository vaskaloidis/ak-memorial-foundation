require 'rails_helper'

describe AdminPolicy do

  describe 'authenticated' do
    subject {AdminPolicy.new(user)}

    context "as an admin" do
      let(:user) {FactoryBot.create(:admin)}
      it {should permit_action(:show)}
      it {should permit_action(:home)}
    end

    context "as a customer" do
      let(:user) {FactoryBot.create(:user)}
      it {should forbid_action(:show)}
      it {should forbid_action(:home)}
    end

  end

end