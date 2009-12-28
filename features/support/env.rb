$LOAD_PATH << File.join(File.dirname(__FILE__),".." ,"..", "lib/lineman" )
require 'lineman'
require 'utilities/comm_helper'
require "spec/mocks"
Before do
  $rspec_mocks ||= Spec::Mocks::Space.new
end
After do
  begin
    $rspec_mocks.verify_all
  ensure
    $rspec_mocks.reset_all
  end
end
