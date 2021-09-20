class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @item = Item.new(item_params)
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品の登録が完了しました"
      redirect_to item_path(@item.id)
    else
      @items = Item.all
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "商品詳細が更新されました"
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


 private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre, :active)
  end


end




  # def destroy
  #   @book = Book.find(params[:id])
  #   @book.destroy
  #   flash[:alert] = "Book was successfully destroyed."
  #   redirect_to books_path
  # end