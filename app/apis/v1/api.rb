module V1
  class API < Grape::API
    format :json

    helpers V1::Helpers

    route :any, '*path' do
      error!({message: "路由错误"}, 404)
    end

    rescue_from ActiveRecord::RecordNotFound do
      error!({code: 404, message: '资源不存在'}, 404)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!({code: 400, message: '参数不符合要求,请检查参数是否按照 API 要求传输。', error: e.full_messages}, 400)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      record = e.record
      error!({code: 400, message: '参数不符合要求', error: record.errors.full_messages}, 400)
    end

    rescue_from :all do |exception|
      # lifted from https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/debug_exceptions.rb#L60
      # why is this not wrapped in something reusable?
      trace = exception.backtrace

      message = "\n#{exception.class} (#{exception.message}):\n"
      message << exception.annoted_source_code.to_s if exception.respond_to?(:annoted_source_code)
      message << "  " << trace.join("\n  ")

      API.logger.add Logger::FATAL, message
      if Rails.env == 'product'
        error!({message: 'Internal Server Error'}, 500)
      else
        error!({message: message}, 500)
      end
    end
  end
end