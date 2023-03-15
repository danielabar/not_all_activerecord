class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer_form = CustomerForm.new
  end

  # TODO: Handle CustomerForm
  # GET /customers/1/edit
  def edit
    @customer_form = CustomerForm.new(
      id: @customer.id,
      email: @customer.email,
      first_name: @customer.first_name,
      last_name: @customer.last_name
    )
  end

  # POST /customers or /customers.json
  def create
    @customer_form = CustomerForm.new(customer_form_params)

    respond_to do |format|
      if @customer_form.save
        format.html { redirect_to customer_url(@customer_form.customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    @customer_form = CustomerForm.new(customer_form_params)
    @customer_form.id = @customer.id

    respond_to do |format|
      if @customer_form.save
        format.html { redirect_to customer_url(@customer_form.customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_form.customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name)
  end

  def customer_form_params
    params.require(:customer_form).permit(:email, :first_name, :last_name, :age)
  end
end
