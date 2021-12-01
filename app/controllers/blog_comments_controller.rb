class BlogCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = BlogComment.new(blog_comment_params)
    @blog_comment.blog_id = @blog.id
    @blog_comment.user_id = current_user.id
    @blog_comments = @blog.blog_comments
    @blog_comment.save
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    BlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
