class Admin::GenresController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_my_admin
 def index
     @genres = Genre.all
 end
 
 def new
     @genre = Genre.new
 end
 
  # 投稿データの保存
  def create
    # @genre_name = GenreName.index(genre_name_params)
    # @genre_name.user_id = current_user.id
    # @genre_name.save
    @genre = Genre.new(genre_name_params)
    @genre.save
    redirect_to admin_genres_path
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end
    # 投稿データのストロングパラメータ
  private

  def genre_name_params
    params.require(:genre).permit(:genre_name)
  end
end
 