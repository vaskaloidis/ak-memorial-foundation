class Purchase < ApplicationRecord
  include Discard::Model
  # TODO: Add Discard to more models
  # rails generate migration add_discarded_at_to_users discarded_at:datetime:index

  enum payment_type: [:stripe, :check, :cash, :card, :request]
  PAYMENT_TYPE_DESC = { :stripe => 'Stripe (Website)', :check => 'Check', :cash => 'Cash', :card => 'Debit / Credit Card', :request => 'Request Payment' }

  belongs_to :product
  belongs_to :user, :class_name => 'User'
  belongs_to :admin, :class_name => 'User', optional: true

  accepts_nested_attributes_for :product
  accepts_nested_attributes_for :user

  default_scope -> { kept }

  def product_category
    product.category
  end

  # Totals:

  def self.golf_package_total_sales
    total = 0.00
    Purchase.where(product_category: 'golf_package').each do |p|
      total = total + p.amount
    end
    return total
  end

  def self.donation_total_sales
    total = 0.00
    Purchase.where(product_category: 'donation').each do |p|
      total = total + p.amount
    end
    return total
  end

  def self.sponsor_total_sales
    total = 0.00
    Purchase.where(product_category: 'sponsor').each do |p|
      total = total + p.amount
    end
    return total
  end
end
