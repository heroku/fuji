require 'digest/md5'
require 'uri'
require 'compass'

require 'fuji/header'
require 'fuji/helper'
require 'fuji/style'
require 'fuji/middleware'
require 'fuji/version'

class Fuji

  cattr_accessor :request

  # FIXME: Why not just call Fuji::Header.render in the view?
  def self.render
    Fuji::Header.render
  end

  def self.fullpath
    self.request[:fullpath]
  end

  def self.logged_in?
    self.request[:logged_in] || false
  end

end
