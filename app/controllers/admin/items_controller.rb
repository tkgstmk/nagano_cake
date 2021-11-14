class Admin::ItemsController < ApplicationController
#   validates :name, presence: true
#   validates :price, presence: true
#   validates :genre, presence: true
#   validates :active, presence: true

# before_action :authenticate_admin!

  def search
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
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
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      flash[:notice] = "アイテムを作成しました"
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:id, :name, :image, :introduction, :price, :genre_id, :is_active)
  end
end
