module V1
  module Helpers
    def render_api_error!(message, status, options={})
      error!({code: status, message: message}.merge!(options), status)
    end

    def bad_request!(reason=nil, options={})
      message  = reason.present? ? reason : "Bad Request"
      render_api_error!(message, 400, options)
    end
  end
end