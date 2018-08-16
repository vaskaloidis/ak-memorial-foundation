# -*- encoding: utf-8 -*-

require 'spec_helper'

describe User do
  before(:each) do
    @user = create(:user, first_name: 'First', last_name: 'Last')
    @golfer = create(:user)
    @purchase = create(:purchase, user: @golfer, product: Product.golf_package)
  end

  describe '#account_exists?' do
    it 'exists' do
      result = User.account_exists?(@user.email)
      expect(result).to be true
      expect(result).to be_equal(@user)
    end
    it 'does not exist' do
      result = User.account_exists?('email_does_not_exist@gmail.com')
      expect(result).to be false
    end
  end

  describe '#golfer_status' do
    it 'Incomplete' do
      result = User.golfer_status(@user)
      expect(result).to be_equal('Incomplete')
    end
    it 'Registered' do
      result = User.golfer_status(@golfer)
      expect(result).to be_equal('Registered')
    end
    it 'Un-Registered' do
      result = User.golfer_status('email_does_not_exist@gmail.com')
      expect(result).to be_equal('Un-Registered')
    end
  end

  describe '#full_name' do
    it 'returns first and last name' do
      expect(@user.full_name).to be_equal('First Last')
    end
    it 'returns email' do
      no_name = create(:base_user)
      expect(no_name.full_name).to be_equal(no_name.email)
    end
  end

  describe '#is_god' do
    before do
      create :vas
    end

    it 'returns first and last name' do
      expect(@user.is_god?).to be false
    end
    it 'returns email' do
      vas = User.where(email:'vas.kaloidis@gmail.com').first
      expect(vas.is_god?).to be true
    end
  end

  describe '#group_member' do
    it 'is a member of 3 golf groups' do
      @member1 = create(:user, golfer2_email: @user.email, golfer2_name: @user.full_name)
      @member2 = create(:user, golfer3_email: @user.email, golfer3_name: @user.full_name)
      @member3 = create(:user, golfer4_email: @user.email, golfer4_name: @user.full_name)
      result = @user.group_member
      expect(result).to include(@member1, @member2, @member3)
    end
    it 'is not a member of any golf groups' do
      result = @golfer.group_member
      expect(result).to match_array([])
    end
  end

  describe '#cart_total' do
    it 'has an empty cart' do
      expect(@user.cart_total).to be 0.0
    end
    it 'has two items in cart for total' do
      user = create(:user)
      sponsorship = Product.sponsor.first
      create(:shopping_cart, product: Product.golf_package, user: user)
      create(:shopping_cart, product: sponsorship, user: user)
      total_expected = Product.golf_package.price + sponsorship.price
      expect(user.cart_total).to eq(total_expected)
    end
  end

  describe '#add_to_cart' do
    it 'adds the golf package to the cart' do
      @user.add_to_cart(Product.golf_package)
      expect(@user.shopping_cart_items).to include(Product.golf_package)
    end
    it 'adds sponsorship to cart' do
      user = create(:user)
      sponsorship = Product.sponsor.first
      user.add_to_cart(sponsorship)
      expect(user.shopping_cart_items).to include(sponsorship)
    end
  end

  describe '#cart_contains_golf_package?' do
    it 'has the package in the cart' do
      create(:shopping_cart, product: Product.golf_package, user: @user)
      expect(@user.cart_contains_golf_package?).to be true
    end
    it 'does not have the package in the cart' do
      user = create(:user)
      expect(user.cart_contains_golf_package?).to be false
    end
  end

  describe '#purchased_golf_package?' do
    it 'returns true' do
      expect(@golfer.purchased_golf_package?).to be true
    end
    it 'returns false' do
      user = create(:user)
      expect(user.purchased_golf_package?).to be false
    end
  end

  describe '#purchased?' do
    it 'has the purchased the sponsorship' do
      user = create(:user)
      sponsorship = Product.sponsor.second
      create(:purchase, product: sponsorship, user: user)
      expect(user.purchased?(sponsorship)).to be true
    end
    it 'has not purchased the sponsorship' do
      user = create(:user)
      sponsorship = Product.sponsor.third
      expect(user.purchased?(sponsorship)).to be false
    end
  end

end
