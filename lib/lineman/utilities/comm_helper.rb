# Main Lineman Module
module Lineman
  class CommHelper
    def initialize
      @messages = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", 'messages.yml')))
    end
    
    def send(what)
      output = ""
      case what
        when "menu"
          output += @messages['Welcome'] + "\n" + @messages['Select'] + "\n"
          @messages['Menu'].sort.each do |key, value|
            output += value + "\n"
          end
        else
          output = "Danger Will Robinson!"
      end
      return output
    end
  end
end
