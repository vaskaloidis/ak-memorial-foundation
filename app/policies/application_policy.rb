class ApplicationPolicy
  attr_reader :user, :record
  def initialize(user, record = nil)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record unless record.nil?
  end

  def index?
    admin?
  end

  def show?
    admin?
  end

  def create?
    admin?
  end

  def new?
    admin?
  end

  def update?
    admin?
  end

  def edit?
    admin?
  end

  def destroy?
    admin?
  end

  def admin?
    user.admin?
  end

end
