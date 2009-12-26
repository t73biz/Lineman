$LOAD_PATH.push File.join(File.dirname(__FILE__),"utilities" )
# Main Lineman Module
require 'comm_helper'
require 'yaml'

module Lineman
  class Core
    def initialize(sender)
      @sender = sender
      @comm = CommHelper.new(@sender)
    end
    
    def start
      @comm.send("Welcome")
      @comm.send("Main Menu")
    end
  end
end
