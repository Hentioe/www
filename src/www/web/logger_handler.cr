module WWW::Web
  class LoggerHandler < Kemal::BaseLogHandler
    def initialize
    end

    def call(context : HTTP::Server::Context)
      elapsed_time = Time.measure { call_next(context) }
      elapsed_text = elapsed_text(elapsed_time)
      Logger.info "#{context.response.status_code} #{context.request.method} #{context.request.resource} #{elapsed_text}"
      context
    end

    def write(message : String)
      Logger.info message.strip
    end

    private def elapsed_text(elapsed)
      millis = elapsed.total_milliseconds
      return "#{millis.round(2)}ms" if millis >= 1

      "#{(millis * 1000).round(2)}µs"
    end
  end
end
