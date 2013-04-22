class Fuji
  class Helper

    def self.dehumanize string
      string.downcase.gsub(/\W+/, '-')
    end

  end
end