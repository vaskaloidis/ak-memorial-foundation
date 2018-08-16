# Charges Policy
# Three use cases:
#  - Admin Purchases
#  - Authenticated Customer Purchases
#  - Unauthenticated Purchases (Quick-Purchase)
# TODO: Finish this policy logic (complex)
#
class ChargesPolicy < ApplicationPolicy
  def new?
    true
    # admin? or user
  end

  def create?
    true
    # user.admin? or (user == target)
  end

end