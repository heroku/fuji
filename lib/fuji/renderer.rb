class Fuji
  class Renderer

    def self.render request, options = {}
      self.new(request, options).render
    end

    def initialize request, options = {}
      @request = request
      @options = options
    end

    def render
      raise Exception.new("Unimplemented")
    end

  private

    def logged_in?
      cookies = @request.cookies
      cookies ? cookies.fetch("heroku_session", false) : false
    end

    def current_page
      @request.url
    end

  end
end