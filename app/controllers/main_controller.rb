class MainController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  before_action :verify_admin, only: [:admin]

  def admin
    @golf_packages = Purchase.where(:product_category => 'golf_package').all
    @donations = Purchase.where(:product_category => 'donation').all
    @sponsorships = Purchase.where(:product_category => 'sponsor').all

    @users = User.where(admin: false).all
    @admins = User.where(admin: true).all

  end

  def home
  end

  def about
  end

  def donate
    @donation = ShoppingCart.new
    @donation.user = current_user
    @donation.product = Product.donation

    @sponsorships = Product.where(category: :sponsor)
  end

  def childrens_exhibit
  end

  def golf_tournament
  end

  def legacy
  end

  def sponsorships
    @sponsorships = Product.where(category: :sponsor)
  end

  def buy_package
  end

  def supporters
    @supporters = Purchase.where(product_category: 'sponsor')
  end

  def profile
  end

  # Photo Galleries
  def twenty_fifteen_gallery
  end

  def twenty_ten_gallery
  end

  def athen_gallery
  end

  private
  def verify_admin
    if signed_in?
      unless current_user.admin?
        redirect_to root_path, notice: 'You are not an Admin.'
      end
    else
      redirect_to root_path, notice: 'You are not logged in.'
    end
  end
end
