class BlogsController < ApplicationController
   before_action :correct_user, only:[:edit, :update]

  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
    @newblog = Blog.new
    @blog_comment = BlogComment.new
    @blog_comments = @blog.blog_comments
  end

  def index
    @total_blogs = Blog.all
    @blogs = Blog.all
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog), notice: "You have created blog successfully."
    else
      @blogs = Blog.all
      render 'index'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    if @blog.user == current_user
      render 'edit'
    else
      redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: "You have updated blog successfully."
    else
      render "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :image)
  end
  
  def correct_user
    @blog = Blog.find(params[:id])
    redirect_to(blog_url) unless @blog.user == current_user
  end

end
