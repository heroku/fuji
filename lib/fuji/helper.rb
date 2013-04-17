class Fuji
  class Helper

    def self.current_site_matches?(url)
      # puts url.inspect.to_s
      # puts Fuji.fullpath.to_s
      link = URI.parse(url.to_s)
      current = URI.parse(Fuji.fullpath.to_s)

      # puts "URI link: #{link.inspect}"
      # puts "URI current: #{current.inspect}"

      link == current
    end

    def self.link_to(name, url, css = "")
      css = "#{css} active" if Fuji::Helper.current_site_matches?(url)
      "<li><a href='#{url}' class='#{css}'>#{name}</a></li>"
    end

    def self.image_tag(url)
      "<img src='#{url}'>"
    end

  end
end