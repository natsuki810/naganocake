class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update
    redirect_to customer_path
  end
  
  def confirm
    @customer = current_customer
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_active: "false")
    reset_session
    redirect_to root_path
    
  end
end
