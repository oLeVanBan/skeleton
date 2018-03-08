# frozen_string_literal: true

class Api::CommonsController < ApiController
  def alive
    json_response("Alives!", :ok)
  end
end
