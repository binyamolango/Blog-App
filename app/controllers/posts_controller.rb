class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 3)
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(author_id: @user.id, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      redirect_to user_posts_path(@post.author.id)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
