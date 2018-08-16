class UserPolicy < ApplicationPolicy
  attr_reader :user, :target

  def initialize(user, target)
    super(user, target)
    @user = user
    @target = target
  end

  def index?
    user.admin?
  end

  def profile?
    user == target
  end

  def show?
    user.admin? or (user == target)
  end

  def edit?
    user.admin? or (user == target)
  end

  def update?
    user.admin? or (user == target)
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end