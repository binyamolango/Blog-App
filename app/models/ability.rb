class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    return unless user.is?("default")  # additional permissions for logged in users (they can read their own posts)
    can :read, Post, user: user

    return unless user.is?("admin")  # additional permissions for administrators
    can :read, Post, user: user
    can :manage, Post
  end
end
