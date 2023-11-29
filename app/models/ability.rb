class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.is?("default")  # additional permissions for logged in users (they can read their own posts)
    can :read, Post, author: user
    can :create, Post, author: user
    can :destroy, Post, author: user

    return unless user.is?("admin")  # additional permissions for administrators
    can :manage, Post
  end
end
