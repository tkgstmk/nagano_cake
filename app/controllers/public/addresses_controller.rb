class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    # @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to addresses_path(@address)
    else
      @addresses = Address.all
      # @customers = Customer.all
      # @customer = current_customer
      render :index
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(address_params)
      flash[:success] = "変更を保存しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])  # データ（レコード）を1件取得
    @address.destroy  # データ（レコード）を削除
    redirect_to addresses_path  # 投稿一覧画面へリダイレクト
  end
  
  private
  def address_params
    params.require(:address).permit(:id, :customer_id, :name, :postal_code, :address)
  end
end
