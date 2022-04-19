class CustomerController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy ]
  
  def index
    @customers = params[:letter].nil? ? Customer.all : Customer.by_letter(params[:letter])
    render json: @customers
  end

  def show
    render json: @customer
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    
    respond_to do |format|
      if @customer.save
        # format.html { redirect_to menu_url(@customer), notice: "Customer was successfully created." }
        # format.json { render :show, status: :created, location: @customer }
        render json: Customer.new(@customer).as_json, status: :created
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customer_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end
  
  def customer_params
    params.permit(:name, :email, :phone)
  end
end
