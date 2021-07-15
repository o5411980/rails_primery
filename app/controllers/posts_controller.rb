class PostsController < ApplicationController
  def index
    @posts = Post.order(updated_at: :desc)
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to new_post_path
    else
      render :new
    end
  end
  private
  def post_params
  params.require(:post).permit(:content)
  end
  end
