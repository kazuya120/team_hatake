class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    favorite = @blog.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    favorite = @blog.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
