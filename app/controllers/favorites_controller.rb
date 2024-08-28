class FavoritesController < ApplicationController

  def create
    @favorites = current_user.favorites
    @create_favorite = @favorites.build(blog_id: params[:blog_id])
    @create_favorite.save
    @blog = @create_favorite.blog
    respond_to do |format|
      format.js { render "blogs/create" }
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @blog = @favorite.blog
    @favorite.destroy
    respond_to do |format|
      format.js { render "blogs/destroy" }
    end
  end

end
