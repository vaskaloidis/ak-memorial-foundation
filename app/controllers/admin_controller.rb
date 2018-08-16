class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  def home
    authorize :admin, home?
    @packages = Purchase.where(:product_category => 'golf_package').all
    @donations = Purchase.where(:product_category => 'donation').all
    @sponsorships = Purchase.where(:product_category => 'sponsor').order('amount DESC').all
    @golfers = Purchase.golf_package.collect{ |package| package.user }
    @users = User.where(admin: false).all
    @admins = User.where(admin: true).all
  end

end
