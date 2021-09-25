class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to address_path(@address.id)
    else
      @addresses = Address.all
      @customers = Customer.all
      @customer = current_customer
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @address.update_attributes(address_params)
      flash[:success] = "配送先を更新しました"
      redirect_to address_params(@address)
    else
      render :edit
    end
  end

  def destroy
    @address= Address.find(params[:id])
    @address.destroy
    flash[:alert] = "配送先を削除しました"
    redirect_to address_params
  end
  

  private
  def address_params
    params.require(:address).permit(:id, :customer_id, :name, :postal_code, :address)
  end
end

