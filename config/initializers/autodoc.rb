# frozen_string_literal: true

if Rails.env.test?
  Autodoc::Document.class_eval do
    private

      def request_body
        if instance_variable_defined?(:@request_body)
          @request_body
        else
          @request_body = JSON.pretty_generate(request.params.except("controller", "action"))
        end
      end
  end
  Autodoc.configuration.suppressed_response_header += ["X-Request-Id", "X-Runtime", "Content-Length", "ETag"]
end
