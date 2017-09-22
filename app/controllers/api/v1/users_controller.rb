class Api::V1::UsersController < ApiController
  validates :index do
    integer :page
    integer :per_page
  end

  def index
    users = User.order(:id).page(params[:page]).per(params[:per_page])
    json_response_collection(users, :ok, Users::IndexSerializer)
  end

  def show
    json_response(User.find(params[:id]), :ok)
  end
end
