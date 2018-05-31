class AdminController < ApplicationController
  def quick_purchase_golfer_package
  end

  def quick_purchase_sponsorship
  end

  def home
    @packages = Purchase.where(:product_category => 'golf_package').all
    @donations = Purchase.where(:product_category => 'donation').all
    @sponsorships = Purchase.where(:product_category => 'sponsor').order('amount DESC').all

    @users = User.where(admin: false).all
    @admins = User.where(admin: true).all
  end

  def create_user

  end
end
