require 'rails_helper'

describe UserPolicy do

  describe 'unauthenticated' do
    context "as a visitor" do
      let(:user) {FactoryBot.create(:user)}
      let(:auth) {nil}
      permissions :index?, :profile?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
        it {expect{UserPolicy.new(auth, user)}.to raise_error(Pundit::NotAuthorizedError)}
      end
    end
  end

  describe 'authenticated' do
    subject {UserPolicy.new(auth, user)}

    context "as a user editing another user" do
      let(:user) {FactoryBot.create(:user)}
      let(:auth) {FactoryBot.create(:user)}
      it {should forbid_action(:index)}
      it {should forbid_action(:profile)}
      it {should forbid_action(:show)}
      it {should forbid_action(:create)}
      it {should forbid_action(:new)}
      it {should forbid_action(:update)}
      it {should forbid_action(:edit)}
      it {should forbid_action(:destroy)}
    end

    context "as a user editing themselves" do
      let(:auth) {FactoryBot.create(:user)}
      let(:user) {auth}
      it {should forbid_action(:index)}
      it {should permit_action(:profile)}
      it {should permit_action(:show)}
      it {should permit_action(:update)}
      it {should permit_action(:edit)}
      it {should forbid_action(:create)}
      it {should forbid_action(:new)}
      it {should forbid_action(:destroy)}
    end

    context "as an admin editing a user" do
      let(:user) {FactoryBot.create(:user)}
      let(:auth) {FactoryBot.create(:admin)}
      # it {should permit_action(:profile)}
      it {should permit_action(:index)}
      it {should permit_action(:show)}
      it {should permit_action(:create)}
      it {should permit_action(:new)}
      it {should permit_action(:update)}
      it {should permit_action(:edit)}
      it {should permit_action(:destroy)}
    end

    context "as an admin editing themselves" do
      let(:auth) {FactoryBot.create(:admin)}
      let(:user) {auth}
      it {should permit_action(:index)}
      it {should permit_action(:profile)}
      it {should permit_action(:show)}
      it {should permit_action(:create)}
      it {should permit_action(:new)}
      it {should permit_action(:update)}
      it {should permit_action(:edit)}
      it {should permit_action(:destroy)}
    end
  end

end