require "digests"
require "./www/cli"
require "./www/web"

WWW::CLI.def_action "WWW.run"

module WWW
  VERSION = "0.1.0"

  def self.run(port, prod)
    unless prod
      ENV["DIGESTS_ENV"] = "dev"
    else
      Digests.init # Default "static"
    end
    Web.run port: port.to_i, prod: prod
  end
end
