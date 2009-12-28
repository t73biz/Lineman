$LOAD_PATH.push File.join(File.dirname(__FILE__),"utilities" )

require 'comm_helper'
require 'optparse'
require 'ostruct'
require 'yaml'

module Lineman
  VERSION = '1.0.1'
  class Core
    attr_reader :options
    attr_accessor :args, :error, :receiver, :sender

    def initialize
      self.args = ARGV
      self.error = $stderr
      self.receiver = $stdin
      self.sender = $stdout
      # Set defaults
      @options = OpenStruct.new
      @options.verbose = false
      @options.quiet = false
      @help = YAML.load(File.read(File.join(File.dirname(__FILE__), 'help.yml'))).to_hash
      @comm = Utilities::CommHelper.new(receiver, sender)
    end


    def start
      if parsed_options? && arguments_valid?
        process_arguments
        process_command
        true
      else
        output_usage
        false
      end
    end

    protected
  
    def parsed_options?
      # Specify options
      opts = OptionParser.new
      opts.banner = @help['Cli']['Usage']
      opts.on('-v', '--version')    { output_version }
      opts.on('-h', '--help')       { output_help }
      opts.on('-V', '--verbose')    { @options.verbose = true }  
      opts.on('-q', '--quiet')      { @options.quiet = true }
      begin
        opts.parse!(@args)
      rescue OptionParser::InvalidOption
        $stderr.puts %Q{Failed to parse options: #{@args}}
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
      # TO DO - implement real logic here
      true
    end
    
    # Setup the arguments
    def process_arguments
    end
    
    def output_help
      @sender.puts @help['Cli']['Help']
    end
    
    def output_usage
      @sender.puts @help['Cli']['Usage']
    end
    
    def output_version
      @sender.puts "Lineman version #{VERSION}"
    end
    
    def process_command
      @comm.send('Welcome')
      @comm.send('Main Menu')
      input = @receiver.read
      @comm.receive(input)
    end
  end
end
