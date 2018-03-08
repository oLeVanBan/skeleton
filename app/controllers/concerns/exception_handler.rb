# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from WeakParameters::ValidationError do |e|
      render json: Error::Unknown.new(e.message).messages, status: 400
    end

    rescue_from Error::Base do |e|
      render json: e.messages, status: e.status
    end

    private

      def record_not_found
        render json: Error::RecordNotFound.new.messages, status: 200
      end

      def record_invalid(exception)
        render json: Error::RecordInvalid.new(exception.record.errors.full_messages.join("\n")).messages, status: 200
      end
  end
end
