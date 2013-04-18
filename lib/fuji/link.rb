class Fuji
  class Link

    def initialize label, url, options = {}
      @label = label
      @url = url
      @options = options
    end

    def html current_page
      local = nil
      url = localize @url

      @options[:css] ||= Fuji::Helper.dehumanize(@label)
      css_class = [@options[:css]]
      css_class << "active" if current_page?(url, current_page) 
      "<li><a href='#{url}' class='#{css_class.join(" ")}'>#{@label}</a></li>"
    end

  private

    def localize url
      if mapping = Fuji.options[:map]
        url.sub(mapping[:from], mapping[:to])
      else
        url
      end
    end

    def current_page?(url, current)
      link = URI.parse(url.to_s)
      request = URI.parse(current)

      request.query = nil       unless link.query
      request.path  = link.path if      ["", "/"].include? link.path

      link == request
    end

  end
end