class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else 
      render 'new'
    end
  end

  def show
    find_post
  end

  def edit
    find_post
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    find_post
    @post.destroy

    redirect_to root_path
  end
  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
