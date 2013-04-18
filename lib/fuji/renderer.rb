class Fuji
  class Renderer

    def self.render request
      self.new(request)._render
    end

    def initialize request
      @request = request
    end

  private

    def _render
      raise "Unimplemented"
    end

    def logged_in?
      @request.cookies.fetch("heroku_session", false)
    end

    def current_page
      "#{@request.env["rack.url_scheme"]}://#{@request.env["HTTP_HOST"]}#{@request.fullpath}"
      @request.url
    end

  end
end