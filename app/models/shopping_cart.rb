class ShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :user

  accepts_nested_attributes_for :product
  accepts_nested_attributes_for :user
end
