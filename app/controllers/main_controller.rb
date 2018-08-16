class MainController < ApplicationController

  def home; end

  def about; end

  def donate
    @donation = ShoppingCart.new
    @donation.user = current_user
    @donation.product = Product.donation
    @sponsorships = Product.where(category: :sponsor)
  end

  def childrens_exhibit; end

  def golf_tournament; end

  def legacy; end

  def supporters
    @supporters = Purchase.joins(:product).where('products.category' => 2)
  end

  # Photo Galleries
  def twenty_fifteen_gallery ; end

  def twenty_ten_gallery ; end

  def athan_gallery; end
end
