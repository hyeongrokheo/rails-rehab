class PostsController < ApplicationController
  def index
    @time = Time.now
    @posts = Post.all
  end
end
