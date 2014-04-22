# app/policies/topic_policy.rb

class TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present? && user.role?(:admin)
  end

  def update?
    create?
  end

#do i need this? It isn't really clear
  def destroy?
    update?
  end

end