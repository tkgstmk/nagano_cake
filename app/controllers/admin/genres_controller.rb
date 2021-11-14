class Admin::GenresController < ApplicationController
    
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを作成しました"
      redirect_to admin_genres_path
    else
      @genre = Genre.all
      render edit_admin_genre_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(genre_params)
      flash[:success] = "変更を保存しました"
      redirect_to admin_genres_path(@genre)
    else
      render edit_admin_genre_path
    end
  end










  private

  def genre_params
    params.require(:genre).permit(:name)
    #params.permit(:title, :body)
  end
  
end
