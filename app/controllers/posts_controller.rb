class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_data)
    post.likes_counter = 0
    post.comments_counter = 0

    respond_to do |format|
      format.html do
        if post.save
          redirect_to "/users/#{post.author_id}/posts/", notice: 'Post saved!'
        else
          render :new, status: 'Post error!'
        end
      end
    end
  end

  private

  def post_data
    params.require(:post).permit(:title, :text)
  end
end
