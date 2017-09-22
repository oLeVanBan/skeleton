class Api::V1::CustomersController < ApiController
  validates :index do
    integer :page
    integer :per_page
    string :full_name
  end

  def index
    customers = if params[:full_name]
                  Customer.order(:id).by_full_name(params[:full_name])
                else
                  Customer.order(:id)
                end.page(params[:page]).per(params[:per_page])
    json_response_collection(customers, :ok, CustomerSerializer)
  end

  validates [:create, :update] do
    integer :store_id
    string :first_name
    string :gender, only: ["Nam", "Nữ", "Other"]
    string :birthday
    string :phone_number
    string :career
    string :address
    file :avatar
  end

  def create
    customer = Customer.create!(customer_params)
    json_response(customer)
  end

  def update
    customer = load_customer
    customer.update!(customer_params)
    json_response(customer)
  end

  def destroy
    customer = load_customer
    customer.destroy!
    json_response(customer)
  end

  def show
    json_response(load_customer)
  end

  private
  def customer_params
    params.permit(*Customer::DEFAULT_PARAMS)
  end

  def load_customer
    Customer.find(params[:id])
  end
end
