class Fuji
  class Link

    def initialize label, url, options = {}
      @label = label
      @url = url
      @options = options
    end

    def html local = nil
      url = local ? localize(@url, local) : @url

      @options[:css] ||= Fuji::Helper.dehumanize(@label)
      css_class = [@options[:css]]
      css_class << "active" if current_page?(url) 
      "<li><a href='#{url}' class='#{css_class.join(" ")}'>#{@label}</a></li>"
    end

  private

    def localize url, local
      url.sub(local[:from], local[:to])
    end

    def current_page?(url)
      link = URI.parse(url.to_s)
      request = URI.parse(Fuji.fullpath.to_s)

      if ["", "/"].include? link.path
        link.host == request.host
      else
        link == request
      end
    end

  end
end