class ApiController < ActionController::API
  include Response
  include ExceptionHandler

  def alives
    json_response("Alives!", :ok)
  end
end
