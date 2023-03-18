class PostsController < ApplicationController
  def index
    @time = Time.now
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_post_params)

    if @post.save
      # redirect_to posts_path
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def create_post_params
    params.require(:post).permit(:title, :content, :author, :password)
  end
end
