# This makes a sass partial available to your app: @import "fuji"
base_directory  = File.join(File.dirname(__FILE__), '..')
Compass::Frameworks.register('fuji', :path => base_directory)
