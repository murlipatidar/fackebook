class PostsController < ApplicationController
# before_action :authenticate_user!

before_action :data_find, only: [:show, :edit, :update, :destroy] 




   # def index
   #  # Searchkick.multi_search([Post, Comment], "query")

   #  search = params[:search].present? ? params[:search] : nil
   #    @posts = if search
   #      Post.where("name LIKE ? OR image LIKE ?","%#{search}%","%#{search}%")
   #    else
   #    # @posts = Post.search(params[:search],fields: ["name", "image"])
   #    @posts = Post.all.order("created_at DESC")
   #    end


  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC") 
    else
      @posts = Post.all.order("created_at DESC")
    end
  end

  def profile
    @posts = Post.where(:user_id => current_user.id).order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
   @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post successfully deleted"
    redirect_to posts_path, status: :see_other
  end


  private

  def data_find
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :image)   
  end 

end
