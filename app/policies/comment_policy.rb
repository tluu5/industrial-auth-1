class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    true
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    comment.author_id == user.id
  end
end
