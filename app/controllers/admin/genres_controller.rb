class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを作成しました"
      #redirect_to book_path(@book.id)
    else
      @genre = Genre.all
      # render :index
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(book_params)
      flash[:success] = "変更を保存しました"
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end
  
  
  
  
  
  
  
  
  
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
    #params.permit(:title, :body)
  end
  
end
