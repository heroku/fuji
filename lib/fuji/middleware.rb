class Fuji
  class Nav

    def initialize app, options = {}
      @app = app
    end

    def call env
      request = {
        fullpath: "#{env["rack.url_scheme"]}://#{env["HTTP_HOST"]}#{env["REQUEST_PATH"]}",
        logged_in: env["rack.request.cookie_hash"].fetch("heroku_session", false)
      }
      Fuji.request = request

      status, headers, body = @app.call env
      [status, headers, body]
    end

  end
end
