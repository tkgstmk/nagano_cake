class Public::CustomersController < ApplicationController
    
    def show
      # @customer = Customer.find(params[:id])
      @customer = current_customer
    end
    
    def edit
      # @customer = Customer.find(params[:id])
      @customer = current_customer
    end
    
    def update
      @customer = current_customer
      if @customer.update_attributes(customer_params)
        flash[:success] = "会員情報が更新されました"
        redirect_to mypage_path
      else
        render :edit
      end
    end
    
    def comfirm
      @customer = current_customer
    end
    
    def withdrawal
      @customer = current_customer
      @customer.update(is_valid: false)
      reset_session
      redirect_to root_path
    end
    

    
    private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
    end
    
end
