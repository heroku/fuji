class Fuji
  class Renderer

    def self.render request
      self.new(request).render
    end

    def initialize request
      @request = request
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