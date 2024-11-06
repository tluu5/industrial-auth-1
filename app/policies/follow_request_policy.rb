class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def create?
    true
  end

  def destroy?
    user.id == follow_request.sender_id ||
    user.id == follow_request.recipient_id
  end

  def update?
    user.id == follow_request.recipient_id
  end
end
