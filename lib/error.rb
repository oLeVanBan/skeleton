module Error
  extend ActiveSupport::Autoload

  CODES = {
    invalid_token: 'invalid_token',
    unknown: 'unknown',
    param_invalid: 'param_invalid',
    record_invalid: 'record_invalid',
    record_not_found: 'record_not_found',
    login_failed: 'login_failed',
  }.freeze

  class Base < ::StandardError
    STATUS = 200

    attr_reader :code, :status

    def initialize *args
      underscore_name = self.class.name.underscore
      key = underscore_name.gsub('error/', '').gsub(/\//, '_').to_sym
      @code = Error::CODES[key]
      @status = self.class::STATUS

      if args.length.zero?
        t_key = underscore_name.gsub /\//, '.'
        super I18n.t(t_key)
      else
        super *args
      end
    end

    def messages
      {
        error: {
          code: code,
          message: message,
          status: status
        }
      }
    end
  end

  class InvalidToken < Error::Base; end
  class Unknown < Error::Base; end
  class ParamInvalid < Error::Base; end
  class RecordInvalid < Error::Base; end
  class RecordNotFound < Error::Base; end
  class LoginFailed < Error::Base; end
end
