$LOAD_PATH.push File.join(File.dirname(__FILE__),"utilities" )

require 'comm_helper'
require 'optparse'
require 'ostruct'
require 'yaml'

module Lineman
  VERSION = '1.0.1'
  class Core
    attr_reader :options
    attr_accessor :args, :comm, :error, :kernel, :receiver, :sender

    def initialize
      self.args = ARGV
      self.error = $stderr
      self.receiver = $stdin
      self.sender = $stdout
      # Set defaults
      @kernel = Kernel
      @options = OpenStruct.new
      @options.verbose = false
      @options.quiet = false
      @comm = Utilities::CommHelper.new
      @comm.receiver = receiver
      @comm.sender = sender
    end


    def start
      if parsed_options? && arguments_valid?
        process_arguments
        @comm.send('Welcome')
        @comm.send('Main Menu')
        @comm.receive
        true
      else
        @comm.help('Usage')
        @kernel.exit
        false
      end
    end

    def quit
      @kernel.exit
    end

    protected
  
    def parsed_options?
      # Specify options
      opts = OptionParser.new
      opts.banner = @comm.help('Usage')
      opts.on('-v', '--version')    { output_version }
      opts.on('-h', '--help')       { output_help }
      opts.on('-V', '--verbose')    { @options.verbose = true }  
      opts.on('-q', '--quiet')      { @options.quiet = true }
      begin
        opts.parse!(@args)
      rescue OptionParser::InvalidOption
        @comm.send(@comm.messages['Parse Error']['Message'] + " #{@args}")
        return false
      end
      process_options
      true
    end

    # Performs post-parse processing on options
    def process_options
      @options.verbose = false if @options.quiet
    end
    
    def arguments_valid?
      arg = @args.last
      # We check against nil arguments
      if arg.nil?
        return true
      end
      # Next we check against usage being passed as the argument
      if arg.downcase == 'usage'
        return false
      end
      # Next we check to see if our arg is a directory
      if File.directory?(arg)
        return false
      end
      # Finally, can our arg be a directory?
      if  arg.include?("/") && Dir.open(arg.chomp(arg.split("/").last))
        return true
      end
    end
    
    # Setup the arguments
    # At this point we can assume that we do not have an active directory
    def process_arguments
      
    end
    
    def output_help
      @comm.help
      @comm.help('Usage')
      @kernel.exit
    end
    
    def output_version
      @comm.help('Version')
      @kernel.exit
    end
    
  end
end
