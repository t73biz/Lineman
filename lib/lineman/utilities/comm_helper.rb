# Main Lineman Module
module Lineman
  module Utilities
    class CommHelper
      def initialize(sender)
        @messages = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", 'messages.yml')))
        @messages = @messages.to_hash
        @sender = sender
      end

      def menu_parse(input)
        begin
          output = @messages[input]['Message']
          @sender.puts output
        rescue Exception => e
          @sender.puts "Please Enter a Valid Selection"
          send("Main Menu")
        end
      end

      def receive(input)
        input = input.strip
        if input.size == 1
          menu_parse(input)
        elsif input.size > 1
          send(input)
        else
          @sender.puts @messages['Error'] + "\n"
        end
      end
      
      def send(what)
        output = ""
        case what
          when "Main Menu"
            output += @messages['Select'] + "\n"
            @messages['Main Menu'].sort.each do |key, value|
              output += value + "\n"
            end
          when "Welcome"
            output = @messages['Welcome'] + "\n"
            @messages['Intro'].each do |value|
              output += value + "\n"
            end
          else
            output = @messages['Error'] + "\n"
        end
        @sender.puts output
      end
      
    end
  end
end
