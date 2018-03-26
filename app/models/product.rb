class Product < ApplicationRecord
  enum category: [ :golf_package, :donation, :sponsor ]


  def self.golf_package
    return Product.where(category: 'golf_package').first
  end

  def self.donation
    return Product.where(category: 'donation').first
  end
end
