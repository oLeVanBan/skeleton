require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :request do
  let(:store) {FactoryGirl.create :store, id: 1}
  let(:customer) { FactoryGirl.create :customer }
  let(:params) {
    {
      store_id: store.id,
      first_name: Faker::Name.name,
      birthday: 1991,
      phone_number: Faker::PhoneNumber.phone_number,
      gender: ["Nam", "Nữ"].sample,
      career: Faker::Job.title,
      address: Faker::Address.street_name,
      avatar: fixture_file_upload("/images.jpeg")
    }
  }
  let(:json) { JSON.parse response.body }

  describe "GET #index", autodoc: true do
    before do
      FactoryGirl.create_list :customer, 5, store: store, first_name: "first_name"
    end
    it "returns http success" do
      get api_v1_customers_path, params: {page: 1, per_page: 20, full_name: "name"}
      expect(response).to have_http_status(:ok)
      expect(json["customers"].count).to eq 5
    end
  end

  describe "POST #create", autodoc: true do
    it "returns http success" do
      post api_v1_customers_path, params: params
      expect(response).to have_http_status(:ok)
      customer = Customer.first
      expect(customer.first_name).to eq params[:first_name]
      expect(customer.birthday).to eq params[:birthday]
      expect(customer.phone_number).to eq params[:phone_number]
      expect(customer.gender).to eq params[:gender]
    end
  end

  describe "PUT #update" do
    it "returns http success", autodoc: true do
      put api_v1_customer_path(customer.id), params: params.merge(id: customer.id)
      expect(response).to have_http_status(:ok)
      customer.reload
      expect(customer.first_name).to eq params[:first_name]
      expect(customer.birthday).to eq params[:birthday]
      expect(customer.phone_number).to eq params[:phone_number]
      expect(customer.gender).to eq params[:gender]
    end
  end

  describe "DELETE #destroy", autodoc: true do
    it "returns http success" do
      delete api_v1_customer_path(customer.id), params: {id: customer.id}
      expect(response).to have_http_status(:ok)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show", autodoc: true do
    it "returns http success" do
      get api_v1_customer_path(customer.id), params: {id: customer.id}
      expect(response).to have_http_status(:ok)
      expect(json["first_name"]).to eq customer.first_name
      expect(json["last_name"]).to eq customer.last_name
      expect(json["birthday"]).to eq customer.birthday
      expect(json["phone_number"]).to eq customer.phone_number
      expect(json["gender"]).to eq customer.gender
    end
  end

end
