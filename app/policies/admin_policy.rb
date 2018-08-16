class AdminPolicy < Struct.new(:user, :admin)

  def home?
    user.admin?
  end

  def show?
    user.admin?
  end
end