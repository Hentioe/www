require "kemal"

module WWW::Web
  def self.run(port : Int32, prod : Bool)
    serve_static({"gzip" => false})
    public_folder "static"

    get "/" do
      render "src/views/index.html.ecr"
    end

    Kemal.config.env = "production" if prod
    Kemal.run(args: nil, port: port)
  end
end
