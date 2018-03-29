class Purchase < ApplicationRecord
  enum product_category: [ :golf_package, :donation, :sponsor ]

  belongs_to :product
  belongs_to :user

  accepts_nested_attributes_for :product
  accepts_nested_attributes_for :user

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
