class Purchase < ApplicationRecord
  enum product_category: [ :golf_package, :donation, :sponsor ]

  belongs_to :product
  belongs_to :user

  accepts_nested_attributes_for :product
  accepts_nested_attributes_for :user
end
