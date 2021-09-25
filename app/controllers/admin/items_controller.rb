class Admin::ItemsController < ApplicationController
  has_many :order_details

  validates :name, presence: true
  validates :price, presence: true
  validates :genre, presence: true
  validates :active, presence: true

  def search
  end

  def index
    @item = Item.new
    @items = Item.all
    # @items = Item.where(id: params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "変更を保存しました"
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @genre.save
      flash[:notice] = "アイテムを作成しました"
      #redirect_to book_path(@book.id)
    else
      @item = Item.all
      # render :index
    end
  end




  def genre_params
    params.require(:item).permit(:name, :price, :genre, :active)
  end

end
