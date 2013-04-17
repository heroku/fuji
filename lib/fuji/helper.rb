class Fuji
  class Helper

    def self.dehumanize string
      string.downcase.squish.gsub( /\s/, '-' )
    end

    def self.image_tag(url)
      "<img src='#{url}'>"
    end

  end
end