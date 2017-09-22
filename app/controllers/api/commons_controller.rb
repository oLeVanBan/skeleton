class Api::CommonsController < ApiController
  def alive
    json_response("Alives!", :ok)
  end
end
