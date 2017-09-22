class ApiController < ActionController::API
  include Response
  include ExceptionHandler

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from WeakParameters::ValidationError do
    head 400
  end

  protected
  def record_not_found
    render json: Error::RecordNotFound.new.messages, status: 200
  end

  def record_invalid(exception)
    render json: Error::RecordInvalid.new(exception.message).messages, status: 200
  end
end
