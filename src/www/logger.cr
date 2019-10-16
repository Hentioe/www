require "logger"

alias StdLogger = Logger

module WWW::Logger
  @@logger : StdLogger?

  def self.init(level : String)
    level = StdLogger::Severity.parse?(level) || StdLogger::UNKNOWN
    logger = StdLogger.new(STDOUT)
    logger.level = level
    @@logger = logger
  end

  macro def_log_puts(levels)
    {% for level in levels %}
      def self.{{level.id}}(msg)
        (@@logger || self.init("debug")).{{level}} msg
      end
    {% end %}
  end

  def_log_puts [debug, error, fatal, info, unknown, warn]
end
