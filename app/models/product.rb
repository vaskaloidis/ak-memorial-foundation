class Product < ApplicationRecord
  enum category: [ :golf_package, :donation, :sponsor ]


  def self.golf_package
    return Product.where(category: 'golf_package').first
  end
end
