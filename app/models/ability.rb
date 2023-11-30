class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment
    can :create, Comment
    can :update, Comment, user: user

    if user.is?("default")  # additional permissions for logged in users (they can read their own posts)
      can :create, Post, author: user
      can :destroy, Post, author: user
      can :update, Post, author: user

      can :destroy, Comment, user: user
    else
      can :create, Post
      can :destroy, Post
      can :update, Post

      can :destroy, Comment
    end
  end

end
