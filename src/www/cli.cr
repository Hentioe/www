require "clicr"

module WWW::CLI
  macro def_action(action)
    def cli_run
      Clicr.create(
        name: "www",
        info: "Bluerain.io Home",
        action: {{action}},
        variables: {
          port: {
            info:    "Web server port",
            default: 8080,
          },
        },
        options: {
          prod: {
            info: "Running in prod mode",
          },
        }
      )
    end

    cli_run unless ENV["WWW_ENV"]? == "test"
  end
end
