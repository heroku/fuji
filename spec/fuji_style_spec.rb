require 'spec_helper'

describe "Fuji compass extension" do

  it "the base directory contains stylesheets" do
    Dir.glob(File.expand_path(Fuji::BASE_DIRECTORY + "/stylesheets/*")).length > 0
  end

end