class Product < ApplicationRecord
  enum category: [ :golf_package, :donation, :sponsor ]


  def self.golf_package
    return Product.where(category: 'golf_package').first
  end

  def self.donation
    return Product.where(category: 'donation').first
  end

  def self.purchase_options
    results = []
    results.merge(Product.sponsor)
    results << Product.golf_package
    results
  end

  def name_with_price
    "#{name} - $#{price}"
  end
end
