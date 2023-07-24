class SubscriptionPolicy < ApllicationPolicy
  def destroy?
    user.admin?
  end

  def show?
    true
  end

  def index?
    true
  end
end

