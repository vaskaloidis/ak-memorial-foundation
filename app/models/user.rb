class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shopping_cart
  has_many :shopping_cart_items, :source => :product, :through => :shopping_cart
  has_many :purchases
  has_many :purchased_items, :source => :product, :through => :purchases

  accepts_nested_attributes_for :shopping_cart
  accepts_nested_attributes_for :shopping_cart_items
  accepts_nested_attributes_for :purchases

  def cart_total
    total = 0.0
    self.shopping_cart.each do |sci|
      total = total + sci.product.price
    end
    return total
  end

  def cart_contains_golf_package?
    self.shopping_cart.each do |sci|
      if sci.product.category == 'golf_package'
        return true
      end
    end
    return false
  end

  def purchased_golf_package?
    self.purchases.each do |purchase|
      if purchase.product.category == 'golf_package'
        return true
      end
    end
    return false
  end

end
