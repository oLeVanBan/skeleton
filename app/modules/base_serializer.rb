# frozen_string_literal: true

module BaseSerializer
  def attributes(*args)
    super(*args).compact
  end
end
