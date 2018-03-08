# frozen_string_literal: true

class Api::V1::RoomsController < ApiController
  before_action :authenticate!

  validates :index do
    integer :last_id
    integer :limit
  end

  def index
    # TODO
    json_response({})
  end

  private

    def last_id
      params[:last_id].to_i
    end

    def load_customer
      params[:limit].presence || 20
    end
end
