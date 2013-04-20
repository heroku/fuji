class Fuji
  class CustomHeader < Header

  private

    def css_class
      "fuji-header fuji-custom-header"
    end

    def links
      if @options.is_a? Array
        @options
      else
        @options[:links]
      end
    end

  end
end