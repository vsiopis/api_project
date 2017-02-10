class PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.order('created_at DESC')
    render json: @posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def show
    render json: @post
  end

  def edit
  end

  def update
    if @post.update(post_params)
      render 'show'
    else
      render 'edit'
    end 
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:post_text, :title, category_ids: []) 
  end
end
