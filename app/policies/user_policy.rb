class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(user, current_user)
    @user = user
    @current_user = current_user
  end


  def feed?
    current_user == user
  end

  def discover?
    feed?
  end

  def show?
    true
  end

  def liked?
    user == current_user || 
    !current_user.private? || 
    current_user.followers.include?(user)
  end
end
