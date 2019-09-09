class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}

  def index
    @posts = Post.page(params[:page]).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def ensure_correct_user
   @post = Post.find_by(id:params[:id])
   if @post.user_id != @current_user.id
    flash[:notice] = "権限がありません"
    redirect_to("/posts/index")
   end
  end



  def create
    @post = Post.new(
      content: params[:content],
      user_id:@current_user.id
    )
    @post.save
    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

    if @post.save
      redirect_to("/posts/index") and return
    else
      render("posts/edit") and return
    end
    @post.save
    redirect_to("/posts/index") and return
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

private
  def post_params
    params.require(:post).permit(:content)
  end
end
