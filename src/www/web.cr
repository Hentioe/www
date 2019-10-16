require "kemal"
require "./web/logger_handler"

module WWW::Web
  def self.run(port : Int32, prod : Bool)
    serve_static({"gzip" => false})
    public_folder "static"
    Kemal.config.logger = LoggerHandler.new

    get "/" do
      render "src/views/index.html.ecr"
    end

    error 404 do
      "Not Found"
    end

    Kemal.config.env = "production" if prod
    Kemal.run(args: nil, port: port)
  end
end
