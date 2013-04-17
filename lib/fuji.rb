require 'digest/md5'
require 'uri'
require 'compass'

require 'fuji/link'
require 'fuji/helper'
require 'fuji/header'
require 'fuji/style'
require 'fuji/middleware'
require 'fuji/version'

class Fuji

  cattr_accessor :request

  def self.fullpath
    self.request[:fullpath]
  end

  def self.logged_in?
    self.request[:logged_in] || false
  end

end
