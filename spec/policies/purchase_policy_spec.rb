require 'rails_helper'

describe PurchasePolicy do

  describe 'unauthenticated' do
    context "as a visitor" do
      let(:purchase) { FactoryBot.create(:purchase, product: Product.golf_package) }
      let(:user) {nil}
      permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
        it {expect{PurchasePolicy.new(user)}.to raise_error(Pundit::NotAuthorizedError)}
      end
    end
  end

  describe 'authenticated' do
    subject {PurchasePolicy.new(user)}
    let(:purchaser) {FactoryBot.create(:user)}
    let(:purchase) { FactoryBot.create(:purchase, product: Product.golf_package, user: purchaser) }

    context "as admin" do
      let(:user) {FactoryBot.create(:admin)}
      it {should permit_action(:index)}
      it {should permit_action(:show)}
      it {should permit_action(:create)}
      it {should permit_action(:new)}
      it {should permit_action(:update)}
      it {should permit_action(:edit)}
      it {should permit_action(:destroy)}
    end

    context "as customer" do
      let(:user) {FactoryBot.create(:user)}
      it {should forbid_action(:index)}
      it {should forbid_action(:show)}
      it {should forbid_action(:create)}
      it {should forbid_action(:new)}
      it {should forbid_action(:update)}
      it {should forbid_action(:edit)}
      it {should forbid_action(:destroy)}
    end
  end

end