class Fuji
  class Helper

    def self.dehumanize string
      string.downcase.squish.gsub( /\s/, '-' )
    end

  end
end