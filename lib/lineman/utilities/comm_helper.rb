# Main Lineman Module
module Lineman
  module Utilities
    class CommHelper
      attr_accessor :help, :messages, :input_channel, :output_channel
      
      def help(input = 'Help')
        @output_channel.puts @help['Cli'][input]
      end
      
      def initialize
        @help         = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", 'locale/en/help.yml'))).to_hash
        @messages     = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", 'locale/en/messages.yml'))).to_hash
        @menus        = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", 'locale/en/menus.yml'))).to_hash
        @current_menu = 'Main'
        @data         = ''
      end

      def build_menu(input)
        @current_menu = input
        count = 0
        output = @menus[input]['Title'] + "\n"
        @menus[input]['Display'].each do |value|
          count = count + 1
          value = value.to_a
          output += "#{count}) " + value[0][0] + "\n"
        end
        output_to_channel(output)
        input_from_channel
      end
      
      def parse_input(input)
        method_array = @menus[@current_menu]['Display'][input.to_i - 1].to_a
        method_array.each do |key, value|
          if value['data']
            method(value['method'].to_sym).call(value['data'])
          else
            method(value['method'].to_sym)
          end
        end
      end

      def input_from_channel
        input = @input_channel.gets
        if input != nil
          parse_input(input)
        else
          output_to_channel(@messages['Valid']['Message'] + "\n")
        end
      end
      
      def output_to_channel(input)
        output = ''
        case input
          when "Main Menu"
            build_menu('Main')
          when "Welcome"
            output << @messages['Welcome'] << "\n"
            output << @messages['Intro'] << "\n"
          else
            output = input
        end
        @output_channel.puts output
      end

    end
  end
end
