# -*- encoding: utf-8 -*-

require 'spec_helper'

describe User do

  # TODO: auto-generated
  describe '#validate_name' do
    it 'works' do
      user = User.new
      result = user.validate_name
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#validate_golfer2' do
    it 'works' do
      user = User.new
      result = user.validate_golfer2
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#validate_golfer3' do
    it 'works' do
      user = User.new
      result = user.validate_golfer3
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#validate_golfer4' do
    it 'works' do
      user = User.new
      result = user.validate_golfer4
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#full_address' do
    it 'works' do
      user = User.new
      result = user.full_address
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#full_name' do
    it 'works' do
      user = User.new
      result = user.full_name
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#is_god?' do
    it 'works' do
      user = User.new
      result = user.is_god?
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#group_member' do
    it 'works' do
      user = User.new
      result = user.group_member
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#cart_total' do
    it 'works' do
      user = User.new
      result = user.cart_total
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#cart_contains_golf_package?' do
    it 'works' do
      user = User.new
      result = user.cart_contains_golf_package?
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#purchased_golf_package?' do
    it 'works' do
      user = User.new
      result = user.purchased_golf_package?
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#cart_contains?' do
    it 'works' do
      user = User.new
      product = double('product')
      result = user.cart_contains?(product)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#purchased?' do
    it 'works' do
      user = User.new
      product = double('product')
      result = user.purchased?(product)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#golfer_status' do
    it 'works' do
      email = double('email')
      result = User.golfer_status(email)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#account_exists?' do
    it 'works' do
      email = double('email')
      result = User.account_exists?(email)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#golfer_status_icon' do
    it 'works' do
      email = double('email')
      result = User.golfer_status_icon(email)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#invite_golfer_two' do
    it 'works' do
      user = User.new
      result = user.invite_golfer_two
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#invite_golfer_three' do
    it 'works' do
      user = User.new
      result = user.invite_golfer_three
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#invite_golfer_four' do
    it 'works' do
      user = User.new
      result = user.invite_golfer_four
      expect(result).not_to be_nil
    end
  end

end
