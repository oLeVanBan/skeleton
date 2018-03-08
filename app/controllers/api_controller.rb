# frozen_string_literal: true

class ApiController < ActionController::API
  include Response
  include ExceptionHandler

  serialization_scope :view_context

  protected

    def authenticate!
      raise Error::Unauthorized unless token_valid?
      raise Error::Unauthorized unless current_user
      if firebase_token_header.present?
        current_user.update! firebase_token: firebase_token_header
      end
    end

    def current_user
      @current_user ||= user_id_header.present? && User.find_or_create_by!(user_id: user_id_header)
    end

  private

    def token_valid?
      Digest::MD5.hexdigest("#{user_id_header}_TS_CLX_9a84e1c4-2501-4e0b-955d-a666f172c679") == token_header
    end

    def firebase_token_header
      request.headers["X-Firebase-Token"]
    end

    def token_header
      request.headers["X-Token"]
    end

    def user_id_header
      request.headers["X-User-Id"]
    end

    def record_not_found
      render json: Error::RecordNotFound.new.messages, status: 200
    end

    def record_invalid(exception)
      render json: Error::RecordInvalid.new(exception.message).messages, status: 200
    end
end
