require 'digest/md5'
require 'uri'
require 'compass'

require 'fuji/link'
require 'fuji/helper'
require 'fuji/renderer'
require 'fuji/header'
require 'fuji/custom_header'
require 'fuji/style'
require 'fuji/railtie' if defined?(Rails)
require 'fuji/version'

class Fuji
  DEFAULTS = {
    logo_text: "heroku",
    logo_subtext: "",
    logo_url: "https://www.heroku.com/",
  }

  class << self

    def options= options
      @options = DEFAULTS.merge(options)
    end

    def options; @options || DEFAULTS; end

  end
end
