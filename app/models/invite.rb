class Invite < ApplicationRecord
  include Discard::Model

  belongs_to :user

  accepts_nested_attributes_for :user

end
