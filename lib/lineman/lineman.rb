$LOAD_PATH.push File.join(File.dirname(__FILE__),"utilities" )
# Main Lineman Module
require 'comm_helper'
require 'yaml'

module Lineman
  class Core
    def initialize(messenger)
      @messenger = messenger
      @comm = CommHelper.new
    end
    
    def start
      @messenger.puts @comm.send("welcome")
      @messenger.puts @comm.send("menu")
    end
  end
end
