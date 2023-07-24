class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
  
  def destroy?
    user.admin?
  end

  def show?
    true
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
