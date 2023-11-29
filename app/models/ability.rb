class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    if user.is?("default")  # additional permissions for logged in users (they can read their own posts)
      can :read, Post, author: user
      can :create, Post, author: user
      can :destroy, Post, author: user
      can :update, Post, author: user
    else
      can :read, Post
      can :create, Post
      can :destroy, Post
      can :update, Post
    end
  end
end
