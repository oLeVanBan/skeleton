module Response
  def json_response(object, status = :ok, serializer = nil)
    if serializer
      render json: object, status: status, serializer: serializer
    else
      render json: object, status: status
    end
  end

  def json_response_collection(objects, status = :ok, serializer = nil)
    if serializer
      render json: objects, status: status, each_serializer: serializer, adapter: :json
    else
      render json: objects, status: status, adapter: :json
    end
  end
end
