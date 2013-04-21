class Fuji

  # This makes a sass partial available to your app: @import "fuji"
  BASE_DIRECTORY  = File.join(File.dirname(__FILE__), '../../')
  Compass::Frameworks.register('fuji', :path => BASE_DIRECTORY)

end